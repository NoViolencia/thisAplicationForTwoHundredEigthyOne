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
    //final int idUsuario = ModalRoute.of(context)!.settings.arguments as int;
    final int idUsuario=idUser;
    final colors = Theme.of(context).colorScheme;
    final usuariosNormalesServices = Provider.of<UsuarioNormalServices>(context, listen: false);
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
  Row(
    children: [
      _buildUserImageSection(idUsuario, usuariosNormalesServices),
      const SizedBox(width: 8), // Agregar espacio entre los elementos
      IconButton(
      onPressed: () {
        _showMenu(context, idUsuario);
      },
      icon: const Icon(Icons.menu_rounded, color: Colors.white),
    ),
    ],
  ),
],
    );
  }
  Widget _buildUserImageSection(int idUsuario, UsuarioNormalServices usuariosNormalesServices) {
    return FutureBuilder<bool>(
      future: usuariosNormalesServices.getUsuarioNormal(idUsuario),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.data == true) {
          final user = usuariosNormalesServices.usuarioNormalResult;
          return CircleAvatar(
            backgroundImage: NetworkImage(user.usuario.imagenPerfil),
          );
        } else {
          return const Center(child: Text('Hubo un problema al obtener los datos del usuario.'));
        }
      },
    );
  }


void _showMenu(BuildContext context, int idUsuario) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MenuScreen(user: idUsuario),
      ),
    );
  }
}

