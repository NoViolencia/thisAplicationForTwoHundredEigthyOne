import 'package:flutter/material.dart';
import 'package:nueva_app/services/institucionAyuda_services.dart';
import 'package:provider/provider.dart';
class institucionAyudaScreen extends StatelessWidget {
  const institucionAyudaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final institucionAyudaServices=Provider.of<InstitucionAyudaServices>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Instituciones Ayuda'),
      ),
      body: ListView.builder(
        itemCount: institucionAyudaServices.institucionAyudaResult.length,
        itemBuilder: (context, index) {
          final institucion=institucionAyudaServices.institucionAyudaResult[index];
          return ListTile(
            title: Text(institucion.nombreInstitucion),
            subtitle: Text(institucion.descripcion),
            leading: FadeInImage(
              placeholder: const AssetImage('assets/LOADING.gif'),
               image: NetworkImage(institucion.imagen)
               ),

          );
        },
        ),
    );
  }
}