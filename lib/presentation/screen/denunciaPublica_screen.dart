import 'package:flutter/material.dart';
import 'package:nueva_app/services/denunciaPublica_services.dart';
import 'package:provider/provider.dart';
class denunciaPublica_Screen extends StatelessWidget {
  const denunciaPublica_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final denunciaPublicaServices=Provider.of<DenunciaPublicaServices>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Denuncias Publicas'),
      ),
      body: ListView.builder(
        itemCount: denunciaPublicaServices.denunciaPublicaResults.length,
        itemBuilder: (context, index) {
          final denunciaPublica=denunciaPublicaServices.denunciaPublicaResults[index];
          return ListTile(
            title: Text(denunciaPublica.idDenuncia.toString()),
            subtitle: Text(denunciaPublica.descripcion),
            leading: FadeInImage(
              placeholder: const AssetImage('assets/LOADING.gif'), 
              image: NetworkImage(denunciaPublica.pruebas)),
          );
        },
        ),
    );
  }
}