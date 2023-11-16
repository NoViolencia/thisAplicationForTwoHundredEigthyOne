import 'package:flutter/material.dart';
import 'package:nueva_app/data/models/recurso_model.dart';
import 'package:nueva_app/presentation/screens/widget/shared/app_bar_Back_Space.dart';
import 'package:nueva_app/presentation/screens/widget/shared/message_field_box.dart';
import 'package:nueva_app/services/comentario_services.dart';
import 'package:nueva_app/services/recurso_services.dart';
import 'package:nueva_app/services/usuario_normal_services.dart';
import 'package:provider/provider.dart';

class ComentarioRecursoScreen extends StatelessWidget {
  final int indice;
  final int user;
  final int idRecurso;
  const ComentarioRecursoScreen({
    super.key, 
    required this.indice,
    required this.user,
    required this.idRecurso,
    });
  @override
  Widget build(BuildContext context) {
    final comentarioServices = Provider.of<ComentarioServices>(context, listen: false);
    final recursoServices=Provider.of<RecursoServices>(context);
    final recurso = recursoServices.recursosResults[indice];
    print('Id de usuario desde Comentarios:  $user');
    comentarioServices.getComentarios(recurso.idRecurso);
    final usuariosNormalesServices = Provider.of<UsuarioNormalServices>(context, listen: false); 
    return Scaffold(
      appBar: AppBarBackSpace(nombreAppBar: recurso.titulo),


body: Column(
  children: [
    Expanded(
      child: ListView(
        children: [
          Card(
            margin: const EdgeInsets.all(16.0),
            child: PublicacionRecurso(recurso: recurso),
          ),
          const Text('Sección Comentarios'),
          Consumer<ComentarioServices>(
            builder: (context, comentarioServices, child) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: comentarioServices.comentarioResults.length,
                itemBuilder: (context, index) {
                  final comentario = comentarioServices.comentarioResults[index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child:_buildUserAvatar(usuariosNormalesServices,comentario.idUsuario, comentario.descripcion) ,
                  );
                },
              );
            },
          ),
        ],
      ),
    ),
     MessageFieldBox(indice:idRecurso, user:user),
  ],
),



    );
  }
}
Widget _buildUserAvatar(UsuarioNormalServices usuariosNormalesServices, int idUsuario, String comentarioDescripcion) {
  return FutureBuilder<bool>(
    future: usuariosNormalesServices.getUsuarioNormal(idUsuario),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else if (snapshot.data == true) {
        final user = usuariosNormalesServices.usuarioNormalResult;
        return Row(
          children: [
            CircleAvatar(
              radius: 20.0, // Puedes ajustar el tamaño del avatar cambiando este valor
              backgroundImage: NetworkImage(user.usuario.imagenPerfil),
            ),
            const SizedBox(width: 8.0), // Espacio entre el avatar y el comentario
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), // Ajusta la redondez de los bordes
                  color: Colors.grey[300], // Puedes cambiar el color del fondo según tus preferencias
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.usuario.nombreUsuario, style: const TextStyle(fontSize:17,fontWeight: FontWeight.bold),),
                    Text(comentarioDescripcion,style: const TextStyle(fontSize: 16.0),),
                  ],
                ),
              ),
            ),
          ],
        );
      } else {
        return const Center(child: Text('Hubo un problema al obtener los datos del usuario.'));
      }
    },
  );
}

class PublicacionRecurso extends StatelessWidget {
  const PublicacionRecurso({
    super.key,
    required this.recurso,
  });

  final Datum recurso;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          recurso.titulo,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(
          width: double.infinity,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: FadeInImage(
              placeholder: const AssetImage('assets/LOADING.gif'),
              image: NetworkImage(recurso.url),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(recurso.descripcion),
              Text('Tipo de Evento: ${recurso.tipo}'),
              Text('Autor: ${recurso.autor}'),
              Text(recurso.contenido),
            ],
          ),
        ),

        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  onPressed: (

                  ) {
                  },
                  icon: const Icon(Icons.mode_comment_outlined),
                ),

                Text('Comentarios ${recurso.contenido}'), 
                // Reemplaza "recurso.comentarios" por tu variable real
              ],
            ),
            IconButton(
              onPressed: () {
              },
              icon: const Icon(Icons.share_outlined),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
