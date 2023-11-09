import 'package:flutter/material.dart';
import 'package:nueva_app/services/usuario_normal_services.dart';
import 'package:provider/provider.dart';

class PanicBottonScreen extends StatelessWidget {
  const PanicBottonScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final int idUsuario = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Botton del Paniciihooo'),
      ),
      body: Consumer<UsuarioNormalServices>(
        builder: (context, usuariosNormalesServices, child) {
          usuariosNormalesServices.getUsuarioNormal(idUsuario);
          final user = usuariosNormalesServices.usuarioNormalResult;
          return Column(
            children: [
              if (user != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Correo: ${user.usuario.correo}'),
                    Text('Nombre de usuario: ${user.usuario.nombreUsuario}'),
                    // Otros campos que quieras mostrar...
                    SizedBox(
                      width: double.infinity,
                      child: AspectRatio(
                      aspectRatio: 16 / 9, // Puedes ajustar el aspecto según tus necesidades
                      child: FadeInImage(
                      placeholder: const AssetImage('assets/LOADING.gif'),
                      image: NetworkImage(user.usuario.imagenPerfil),
                fit: BoxFit.cover,
              ),
            ),
          ),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
} 
