import 'package:flutter/material.dart';
import 'package:nueva_app/presentation/screens/menu/menu_screen.dart';
import 'package:nueva_app/services/usuario_normal_services.dart';
import 'package:provider/provider.dart';
class AppBarGeneric extends StatelessWidget implements PreferredSizeWidget {
  final String nombreAppBar;
  final int idUser;

  const AppBarGeneric({
    Key? key,
    required this.nombreAppBar,
    required this.idUser,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final int idUsuario = ModalRoute.of(context)!.settings.arguments as int;
    final colors = Theme.of(context).colorScheme;
    final usuariosNormalesServices = Provider.of<UsuarioNormalServices>(context, listen: false);
    usuariosNormalesServices.getUsuarioNormal(idUsuario);
    //var user = usuariosNormalesServices.usuarioNormalResult;
    return AppBar(
      backgroundColor: colors.primary,
      title: Text(
        nombreAppBar,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      automaticallyImplyLeading: false,
      actions: <Widget>[
        Text('id usuario: $idUser'),
        //Text(user.usuario.nombre),
        IconButton(
          onPressed: () {
             Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => MenuScreen(user:idUsuario), // Pasa la URL de la imagen del comentario
              ),
            );

          },
          icon: const Icon(Icons.menu_rounded, color: Colors.white),
        ),
        // const Card(
        //   margin: EdgeInsets.all(8.0),
        //   child: ListTile(
        //   leading: CircleAvatar(
        //   //backgroundImage: NetworkImage(user.usuario.imagenPerfil),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}