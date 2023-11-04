import 'package:flutter/material.dart';
import 'package:nueva_app/services/recurso_services.dart';
import 'package:provider/provider.dart';
class recursos_screen extends StatelessWidget {
  const recursos_screen({super.key});

  @override
  Widget build(BuildContext context) {
    final recursoServices=Provider.of<RecursoServices>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Ventana Recursos'),
      ),
      body: ListView.builder(
        itemCount: recursoServices.recursosResults.length,
        itemBuilder: (context, index) {
          final recurso=recursoServices.recursosResults[index];
          return ListTile(
            title: Text(recurso.titulo),
            subtitle: Text(recurso.contenido),
            trailing: FadeInImage(
              placeholder:const AssetImage('assets/LOADING.gif'),
               image: NetworkImage(recurso.url)
               ),
            
          );
        },
        )
    );
  }
}