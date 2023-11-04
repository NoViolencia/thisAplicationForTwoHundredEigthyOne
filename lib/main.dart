import 'package:flutter/material.dart';
import 'package:nueva_app/presentation/screen/actividades.dart';
import 'package:nueva_app/presentation/screen/denunciaPublica_screen.dart';
import 'package:nueva_app/presentation/screen/institucionAyuda_screen.dart';
import 'package:nueva_app/presentation/screen/login_screen.dart';
import 'package:nueva_app/presentation/screen/recursos.dart';
import 'package:nueva_app/presentation/screen/register_screen.dart';
import 'package:nueva_app/presentation/screen/welcome_screen.dart';
import 'package:nueva_app/services/actividad_services.dart';
import 'package:nueva_app/services/denunciaPublica_services.dart';
import 'package:nueva_app/services/institucionAyuda_services.dart';
import 'package:nueva_app/services/recurso_services.dart';
import 'package:provider/provider.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context)=>ActividadServices(),
          ),
        ChangeNotifierProvider(
          create: (context) => RecursoServices(),
          ),
        ChangeNotifierProvider(
          create: (context) => InstitucionAyudaServices(),
          ),
        ChangeNotifierProvider(
          create: (context) => DenunciaPublicaServices(),
          )
    
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: "/welcome",
        routes: {
          "/welcome":(context) => const welcomeScreen(),
          "/login":(context) => const loginScreen(),
          "/register":(context) =>const registerScreen(),
          "/actividades":(context)=>const actividades_screen(),
          "/recursos":(context) => const recursos_screen(),
          "/institucionAyuda":(context) =>const institucionAyudaScreen(),
          "/denunciaPublica":(context) => const denunciaPublica_Screen()
        },
      
      ),
    );
  }
}