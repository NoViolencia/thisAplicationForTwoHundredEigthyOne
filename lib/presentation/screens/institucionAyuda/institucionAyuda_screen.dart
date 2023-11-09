import 'package:flutter/material.dart';
import 'package:nueva_app/presentation/screens/widget/shared/app_Bar_generic.dart';
import 'package:nueva_app/presentation/screens/widget/shared/floating_button_chat.dart';
import 'package:nueva_app/presentation/screens/widget/shared/navigation_botton.dart';
import 'package:nueva_app/services/institucionAyuda_services.dart';
import 'package:provider/provider.dart';
class InstitucionAyudaScreen extends StatelessWidget {
  const InstitucionAyudaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int idUsuario = ModalRoute.of(context)!.settings.arguments as int;
    final institucionAyudaServices=Provider.of<InstitucionAyudaServices>(context);
    print('desde Institucion Ayuda : $idUsuario');
    return Scaffold(
      appBar:  AppBarGeneric(nombreAppBar: 'Instituciones Ayuda',idUser: idUsuario),

  body:ListView.builder(
      itemCount: institucionAyudaServices.institucionAyudaResult.length,
      itemBuilder: (context, index) {
        final institucionA = institucionAyudaServices.institucionAyudaResult[index];
        return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(institucionA.nombreInstitucion,style:const  TextStyle(fontWeight:FontWeight.w900,fontSize: 19),),
          Text(institucionA.descripcion, style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 22)),
          SizedBox(
            width: double.infinity,
            child: AspectRatio(
              aspectRatio: 16 / 9, // Puedes ajustar el aspecto según tus necesidades
              child: FadeInImage(
                placeholder: const AssetImage('assets/LOADING.gif'),
                image: NetworkImage(institucionA.imagen),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(institucionA.telefono),
          Text(institucionA.url),

        ],
      ),
    );
  },
),

        floatingActionButton:const FloatingButtonChat(),
        bottomNavigationBar: NavigationBotton(indice:4,idUser: idUsuario),
    );
  }
}