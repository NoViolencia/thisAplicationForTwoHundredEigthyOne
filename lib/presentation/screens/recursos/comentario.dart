import 'package:flutter/material.dart';
import 'package:nueva_app/data/models/recurso_model.dart';
import 'package:nueva_app/presentation/screens/widget/shared/app_bar_Back_Space.dart';
import 'package:nueva_app/presentation/screens/widget/shared/message_field_box.dart';
import 'package:nueva_app/services/comentario_services.dart';
import 'package:nueva_app/services/recurso_services.dart';
import 'package:provider/provider.dart';

class ComentarioRecursoScreen extends StatelessWidget {
  final int indice;
  final int user;
  const ComentarioRecursoScreen({
    super.key, 
    required this.indice,
    required this.user
    });
  @override
  Widget build(BuildContext context) {
    final comentarioServices = Provider.of<ComentarioServices>(context, listen: false);
    final recursoServices=Provider.of<RecursoServices>(context);
    final recurso = recursoServices.recursosResults[indice];
    print('Id de usuario desde Comentarios:  $user');
    comentarioServices.getComentarios(recurso.idRecurso); 
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
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkUhmWPAYfxHWH6Rh3I_VSlVoujsRx-R-tDg&usqp=CAU'),
                      ),
                      title: Text(comentario.idUsuario.toString()),
                      subtitle: Text(comentario.descripcion),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    ),
    const MessageFieldBox(),
  ],
),



    );
  }
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
