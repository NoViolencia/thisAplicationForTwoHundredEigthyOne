import 'package:flutter/material.dart';
import 'package:nueva_app/presentation/screens/widget/shared/app_Bar_generic.dart';
import 'package:nueva_app/presentation/screens/widget/shared/floating_button_chat.dart';
import 'package:nueva_app/presentation/screens/widget/shared/navigation_botton.dart';
import 'package:nueva_app/services/actividad_services.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
class ActividadesScreen extends StatelessWidget {
  const ActividadesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final int idUsuario = ModalRoute.of(context)!.settings.arguments as int;
    final actividadesServices= Provider.of<ActividadServices>(context);
    final colors=Theme.of(context).colorScheme;
    print('desde Actividades : $idUsuario');
    return Scaffold(
      appBar:  AppBarGeneric(nombreAppBar: 'Actividades',idUser: idUsuario),
      body:ListView.builder(
      itemCount: actividadesServices.actividadesResults.length,
      itemBuilder: (context, index) {
        final actividad = actividadesServices.actividadesResults[index];
        return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(actividad.tipo,style:  TextStyle(fontWeight:FontWeight.w900,fontSize: 19,color:colors.secondary),),
          Text(actividad.nombreActividad, style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 22)),
          SizedBox(
            width: double.infinity,
            child: AspectRatio(
              aspectRatio: 16 / 9, // Puedes ajustar el aspecto según tus necesidades
              child: FadeInImage(
                placeholder: const AssetImage('assets/LOADING.gif'),
                image: NetworkImage(actividad.imagen),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(actividad.descripcion),
          Text('Fecha de Inicio: ${DateFormat('yyyy-MM-dd').format(actividad.fechaIni)}'),
          Text('Fecha de Finalizacion: ${DateFormat('yyyy-MM-dd').format(actividad.fechaFin)}'),
          Text('Hora de la Actividad ${DateFormat('HH:mm').format(actividad.hora)}'),
        ],
      ),
    );
  },
),




      floatingActionButton: const FloatingButtonChat(),
      bottomNavigationBar: NavigationBotton(indice:0,idUser: idUsuario),
    );
  }
}




