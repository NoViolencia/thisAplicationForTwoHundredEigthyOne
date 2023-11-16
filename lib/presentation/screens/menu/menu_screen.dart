import 'package:flutter/material.dart';
import 'package:nueva_app/presentation/screens/actividades/actividades.dart';
import 'package:nueva_app/presentation/screens/menu/contactos/contactos_user_screen.dart';
import 'package:nueva_app/presentation/screens/menu/perfil/perfil_usuario_screen.dart';
import 'package:nueva_app/presentation/screens/widget/shared/app_bar_Back_Space.dart';
class MenuScreen extends StatelessWidget {
  final int user;
  const MenuScreen(
    {
      super.key,
      required this.user
    });

@override
Widget build(BuildContext context) {
  final colors = Theme.of(context).colorScheme;
  print('Id de usuario desde Menu :  $user');
  return Scaffold(
    //appBar: AppBar(title: Text('No Violencia'),),
    appBar: const AppBarBackSpace(nombreAppBar: 'No Violencia'),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildMenuItem('Mi Perfil', Icons.person, () {
            // Lógica para 'Mi Perfil'
            Navigator.push(context,MaterialPageRoute(builder: (context) => PerfilUsuarioScreen(idUser:user),),);
          }),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSizedMenuItem('Mis Denuncias', Icons.assignment, 169.0, 80.0, () {
                // Lógica para 'Mis Denuncias'
                print('Tapped on Mis Denuncias');
              }),
              _buildSizedMenuItem('Contactos', Icons.contacts, 169.0, 80.0, () {
                // Lógica para 'Contactos'
              Navigator.push(context,MaterialPageRoute(builder: (context) => ContactosUserScreen(idUser:user),),);
              }),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSizedMenuItem('Actividad', Icons.accessibility_new, 169.0, 80.0, () {
                // Lógica para 'Actividades'
                  Navigator.pushNamed(context,'/actividades',arguments: user,);
              }),
              _buildSizedMenuItem('Denuncias Públicas', Icons.public, 169.0, 80.0, () {
                // Lógica para 'Denuncias Públicas'
                Navigator.pushNamed(context, '/denunciaPublica',arguments: user,);
              }),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSizedMenuItem('Botón del Pánico', Icons.warning, 169.0, 80.0, () {
                // Lógica para 'Botón del Pánico'
                Navigator.pushNamed(context, '/panicBotton',arguments: user,);
                print('Tapped on Botón del Pánico');
              }),
              _buildSizedMenuItem('Recursos', Icons.library_books, 169.0, 80.0, () {
                // Lógica para 'Recursos'
                Navigator.pushNamed(context, '/recursos',arguments: user,);
              }),
            ],
          ),
          const SizedBox(height: 16.0),
          _buildSizedMenuItem('Instituciones de Ayuda', Icons.business, 150.0, 70.0, () {
            // Lógica para 'Instituciones de Ayuda'
            Navigator.pushNamed(context, '/institucionAyuda',arguments: user,);
          }),
        ],
      ),
    ),
  );
}

Widget _buildSizedMenuItem(String title, IconData icon, double width, double height, VoidCallback onTap) {
  return Container(
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 231, 244, 240),
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(color: Colors.black),
    ),
    width: width,
    height: height,
    child: _buildMenuItem(title, icon, onTap),
  );
}

Widget _buildMenuItem(String title, IconData icon, VoidCallback onTap) {
  return ListTile(
    leading: Icon(icon, color: Colors.black),
    title: Text(
      title,
      style:const TextStyle(color: Colors.black),
    ),
    onTap: onTap,
  );
}
}
