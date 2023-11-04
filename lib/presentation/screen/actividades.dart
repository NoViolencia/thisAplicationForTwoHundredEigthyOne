import 'package:flutter/material.dart';
import 'package:nueva_app/services/actividad_services.dart';
import 'package:provider/provider.dart';
class actividades_screen extends StatelessWidget {
  const actividades_screen({super.key});

  @override
  Widget build(BuildContext context) {
    final actividadesServices= Provider.of<ActividadServices>(context);
    return Scaffold(
      appBar: AppBar(
        title:const Text('Actividades'),
      ),
      body: ListView.builder(
        itemCount: actividadesServices.actividadesResults.length,
        itemBuilder: (context, index) {
          final actividad=actividadesServices.actividadesResults[index];
          return ListTile(
            title: Text(actividad.nombreActividad),
            subtitle: Text(actividad.descripcion),
            leading: FadeInImage(
              placeholder:const AssetImage('assets/LOADING.gif'), 
              image: NetworkImage(actividad.imagen)),
          );
        },
      ),
    );
  }

}