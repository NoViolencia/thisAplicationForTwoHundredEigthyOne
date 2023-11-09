import 'package:flutter/material.dart';
class NavigationBotton extends StatefulWidget {
  //const NavigationBotton({super.key});
  final int indice;
  final int idUser;
  const NavigationBotton({
    Key? key,
    required this.indice,
    required this.idUser,
  }) : super(key: key);

  @override
  State<NavigationBotton> createState() => NavigationBottonState(indice,idUser);
}

class NavigationBottonState extends State<NavigationBotton> {
  int i=0;
  int idUsuario=0;
  NavigationBottonState(int indice, int idUser) {
    i = indice;
    idUsuario =idUser;
  }

  set setIndex(int index) {
    i = index;
    setState(() {});
  }

  get getIndex=>i;

  //get getIdUser=>idUsuario;
  @override

  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap:(value) {
        setIndex=value;
      switch (value) {
      case 0:
        Navigator.pushNamed(context,'/actividades',arguments: idUsuario,);
        break;
      case 1:
        Navigator.pushNamed(context, '/denunciaPublica',arguments: idUsuario,);
        break;
      case 2:
        Navigator.pushNamed(context, '/panicBotton',arguments: idUsuario,);
        break;
      case 3:
        Navigator.pushNamed(context, '/recursos',arguments: idUsuario,);
        break;
      case 4:
        Navigator.pushNamed(context, '/institucionAyuda',arguments: idUsuario,);
        break;
    }

      
      },
      currentIndex: getIndex,
      type: BottomNavigationBarType.fixed,
      items:const [
      BottomNavigationBarItem(
        icon: Icon(Icons.local_activity_outlined),
        label: 'actividades'),
      BottomNavigationBarItem(
        icon: Icon(Icons.family_restroom_sharp),
        label: 'denuncias'),
        BottomNavigationBarItem(
        icon: CircleAvatar(
          backgroundColor:Color.fromARGB(255, 206, 58, 107),
          radius: 25,
          child: Text('V',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30),
            ),
        ),
        label: ''),
        BottomNavigationBarItem(
        icon: Icon(Icons.recycling_outlined),
        label: 'recursos'),
        BottomNavigationBarItem(
        icon: Icon(Icons.recent_actors_outlined),
        label: 'institucion'),
      ],
      );
  }
}