import 'package:flutter/material.dart';
import 'package:nueva_app/presentation/screens/widget/shared/app_Bar_generic.dart';
import 'package:nueva_app/presentation/screens/widget/shared/floating_button_chat.dart';
import 'package:nueva_app/presentation/screens/widget/shared/navigation_botton.dart';
import 'package:nueva_app/services/denunciaPublica_services.dart';
import 'package:provider/provider.dart';
class DenunciaPublicaScreen extends StatelessWidget {
  const DenunciaPublicaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final denunciaPublicaServices=Provider.of<DenunciaPublicaServices>(context);
    final int idUsuario = ModalRoute.of(context)!.settings.arguments as int;
    //final colors = Theme.of(context).colorScheme;
    print('desde Denuncia P : $idUsuario');
    return Scaffold(
      appBar:  AppBarGeneric(nombreAppBar: 'Denuncias Publicas',idUser: idUsuario),

  body: ListView.builder(
  itemCount: denunciaPublicaServices.denunciaPublicaResults.length,
  itemBuilder: (context, index) {
    final denunciaP = denunciaPublicaServices.denunciaPublicaResults[index];
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdemcPDH7MyKF_ANzNc9KKXrf7NIGGPQKgZQ&usqp=CAU'),
                  radius: 20,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nombre del Agresor: ${denunciaP.nombreAgresor}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Nombre de la Víctima: ${denunciaP.nombreVictima}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            'Tipo de Violencia: ${denunciaP.tipoViolencia}',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            'Ubicación: ${denunciaP.ubicacion}',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: FadeInImage(
                placeholder: const AssetImage('assets/LOADING.gif'),
                image: NetworkImage(denunciaP.pruebas),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              denunciaP.descripcion,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  },
),


      floatingActionButton:const FloatingButtonChat(),
      bottomNavigationBar: NavigationBotton(indice:1,idUser: idUsuario),
    );
  }
}