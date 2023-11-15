import 'package:flutter/material.dart';
import 'package:nueva_app/data/models/usuario_normal_model.dart';
import 'package:nueva_app/services/contactos_services.dart';
import 'package:nueva_app/services/institucionAyuda_services.dart';
import 'package:nueva_app/services/usuario_normal_services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_sms/flutter_sms.dart';

class PanicBottonScreen extends StatelessWidget {
  const PanicBottonScreen({Key? key});


  @override
  Widget build(BuildContext context) {
    int idUsuario=71;
    return Scaffold(
      appBar: AppBar(
        title:const Text('Boton del pánico oo'),
      ),
      backgroundColor: Colors.white70,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _mostrarDialogo(context,idUsuario); // Mostrar el cuadro de diálogo al presionar el botón
          },
          style: ElevatedButton.styleFrom(
            shape:const  CircleBorder(),
            primary: Colors.red, // Color de fondo rojo
            onPrimary: Colors.white, // Color del texto blanco
            side:const BorderSide(color: Colors.white, width: 4), // Borde blanco más grueso
            padding:const EdgeInsets.all(30.0), // Aumenta el espacio dentro del botón
          ),
          child: Container(
            width: 200, // Ajusta según tus necesidades
            height: 200, // Ajusta según tus necesidades
            alignment: Alignment.center,
            child:const Text(
              '¡AYUDA!',
              style: TextStyle(fontSize: 24), // Aumenta el tamaño de la letra
            ),
          ),
        ),
      ),
    );
  }



  void _mostrarDialogo(BuildContext context, int idUsuario) {
    final contactosServices = Provider.of<ContactosServices>(context, listen: false);
    final institucionAyudaServices = Provider.of<InstitucionAyudaServices>(context, listen: false);
    final usuariosNormalesServices = Provider.of<UsuarioNormalServices>(context, listen: false);
    usuariosNormalesServices.getUsuarioNormal(idUsuario);

    if (contactosServices.contactosResults.isEmpty) {
      contactosServices.getContactos(idUsuario);
    }

    if (usuariosNormalesServices.usuarioNormalResult.idUsuario != idUsuario) {
      usuariosNormalesServices.getUsuarioNormal(idUsuario);
    }

    final user = usuariosNormalesServices.usuarioNormalResult;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enviar mensaje de ayuda?'),
          actions: [
            TextButton(
              onPressed: () {
                List<int> telefonosContactos = contactosServices.contactosResults
                    .map((contacto) => int.tryParse(contacto.telefono) ?? 0)
                    .toList();

                List<int> telefonosInstituciones = institucionAyudaServices.institucionAyudaResult
                    .map((institucion) => int.tryParse(institucion.telefono) ?? 0)
                    .toList();
                _enviarMensaje(user,telefonosContactos, telefonosInstituciones);

                // Cierra el cuadro de diálogo
                Navigator.of(context).pop();
              },
              child:const Text('Continuar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }



void _enviarMensaje(Data user, List<int> contactos, List<int> instituciones) {
  // Números de teléfono como cadenas de texto
  List<String> telefonosContactos = contactos.map((telefono) => telefono.toString()).toList();
  List<String> telefonosInstituciones = instituciones.map((telefono) => telefono.toString()).toList();

  // Cuerpo del mensaje
  String mensaje = 'Ayuda urgente en la dirección: ${user.usuario.direccion}';

  // Combinar todos los números de teléfono
  List<String> todosLosTelefonos = [...telefonosContactos, ...telefonosInstituciones];

  // Enviar el mensaje
  _enviarSMS(todosLosTelefonos, mensaje);
}

void _enviarSMS(List<String> destinatarios, String mensaje) async {
  try {
    String result = await sendSMS(
      message: mensaje,
      recipients: destinatarios,
    );
    print(result);
  } catch (error) {
    print('Error al enviar SMS: $error');
  }

}


















// void _enviarMensaje(Data user, List<int> contactos, List<int> instituciones) {
//   // Lógica para enviar mensajes de texto
//   print('Dirección: ${user.usuario.direccion}');

//   print('Contactos:');
//   for (var contactoTelefono in contactos) {
//     print('Contacto $contactoTelefono'); // Puedes ajustar según la estructura de tus contactos
//   }

//   print('Instituciones:');
//   for (var institucionTelefono in instituciones) {
//     print('Institución $institucionTelefono'); // Puedes ajustar según la estructura de tus instituciones de ayuda
//   }

//   // Aquí puedes agregar la lógica para enviar mensajes de texto
// }

}



