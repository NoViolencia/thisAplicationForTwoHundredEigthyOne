import 'package:flutter/material.dart';
import 'package:nueva_app/presentation/screens/recursos/comentario.dart';
import 'package:nueva_app/presentation/screens/widget/shared/app_Bar_generic.dart';
import 'package:nueva_app/presentation/screens/widget/shared/floating_button_chat.dart';
import 'package:nueva_app/presentation/screens/widget/shared/navigation_botton.dart';
import 'package:nueva_app/services/recurso_services.dart';
import 'package:provider/provider.dart';

class RecursosScreen extends StatelessWidget {
  const RecursosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recursoServices=Provider.of<RecursoServices>(context);
    final int idUsuario = ModalRoute.of(context)!.settings.arguments as int;
    //int idUsuario =71;
   // final colors = Theme.of(context).colorScheme;
   print('desde Recurso : $idUsuario');
    return Scaffold(
      appBar:  AppBarGeneric(nombreAppBar: 'Recursos',idUser: idUsuario),

      body: ListView.builder(
        itemCount: recursoServices.recursosResults.length,
        itemBuilder: (context, index) {
          final recurso = recursoServices.recursosResults[index];
          return Card(
            margin: const EdgeInsets.all(16.0),
            child: Column(
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
                  child: Text(recurso.descripcion),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ComentarioRecursoScreen(indice:index, user:idUsuario,idRecurso:recurso.idRecurso), // Pasa la URL de la imagen del comentario
                              ),
                            );
                          },
                          icon: const Icon(Icons.mode_comment_outlined),
                        ),

                        Text('Comentarios ${recurso.contenido}'), 
                        // Reemplaza "recurso.comentarios" por tu variable real
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        print('enviando a otra apk');
                      },
                      icon: const Icon(Icons.share_outlined),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),



      floatingActionButton: const FloatingButtonChat(),  
      bottomNavigationBar: NavigationBotton(indice:3,idUser: idUsuario),
    );
  }
}