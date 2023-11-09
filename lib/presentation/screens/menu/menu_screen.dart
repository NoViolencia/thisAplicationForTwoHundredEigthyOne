import 'package:flutter/material.dart';
import 'package:nueva_app/presentation/screens/actividades/actividades.dart';
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
            print('Tapped on Mi Perfil');
          }),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSizedMenuItem('Mis Denuncias', Icons.assignment, 175.0, 80.0, () {
                // Lógica para 'Mis Denuncias'
                print('Tapped on Mis Denuncias');
              }),
              _buildSizedMenuItem('Contactos', Icons.contacts, 175.0, 80.0, () {
                // Lógica para 'Contactos'
                print('Tapped on Contactos');
              }),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSizedMenuItem('Actividades', Icons.accessibility_new, 175.0, 80.0, () {
                // Lógica para 'Actividades'
                  Navigator.pushNamed(context,'/actividades',arguments: user,);
                print('Tapped on Actividades');
              }),
              _buildSizedMenuItem('Denuncias Públicas', Icons.public, 175.0, 80.0, () {
                // Lógica para 'Denuncias Públicas'
                Navigator.pushNamed(context, '/denunciaPublica',arguments: user,);
                print('Tapped on Denuncias Públicas');
              }),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSizedMenuItem('Botón del Pánico', Icons.warning, 175.0, 80.0, () {
                // Lógica para 'Botón del Pánico'
                Navigator.pushNamed(context, '/panicBotton',arguments: user,);
                print('Tapped on Botón del Pánico');
              }),
              _buildSizedMenuItem('Recursos', Icons.library_books, 175.0, 80.0, () {
                // Lógica para 'Recursos'
                Navigator.pushNamed(context, '/recursos',arguments: user,);
                print('Tapped on Recursos');
              }),
            ],
          ),
          SizedBox(height: 16.0),
          _buildSizedMenuItem('Instituciones de Ayuda', Icons.business, 150.0, 70.0, () {
            // Lógica para 'Instituciones de Ayuda'
            Navigator.pushNamed(context, '/institucionAyuda',arguments: user,);
            print('Tapped on Instituciones de Ayuda');
          }),
        ],
      ),
    ),
  );
}

Widget _buildSizedMenuItem(String title, IconData icon, double width, double height, VoidCallback onTap) {
  return Container(
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 171, 248, 225),
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
      style: TextStyle(color: Colors.black),
    ),
    onTap: onTap,
  );
}
}
