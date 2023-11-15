import 'package:flutter/material.dart';
import 'package:nueva_app/config/theme/app_theme.dart';
import 'package:nueva_app/presentation/screens/actividades/actividades.dart';
import 'package:nueva_app/presentation/screens/administrador/administrador_screen.dart';
import 'package:nueva_app/presentation/screens/administrador/colaborador_screen.dart';
import 'package:nueva_app/presentation/screens/denunciaPublica/denunciaPublica_screen.dart';
import 'package:nueva_app/presentation/screens/institucionAyuda/institucionAyuda_screen.dart';
import 'package:nueva_app/presentation/screens/login/login_screen.dart';
import 'package:nueva_app/presentation/screens/menu/contactos/contactos_user_screen.dart';
import 'package:nueva_app/presentation/screens/menu/denunciaU/denuncia_usuario_screen.dart';
import 'package:nueva_app/presentation/screens/menu/menu_screen.dart';
import 'package:nueva_app/presentation/screens/menu/perfil/perfil_usuario_screen.dart';
import 'package:nueva_app/presentation/screens/panicBotton/panic_botton_screen.dart';
import 'package:nueva_app/presentation/screens/recursos/recursos.dart';
import 'package:nueva_app/presentation/screens/register/registrer_screen_tree.dart';
import 'package:nueva_app/presentation/screens/welcome/welcome_screen.dart';
import 'package:nueva_app/presentation/screens/widget/shared/app_Bar_generic.dart';
import 'package:nueva_app/services/actividad_services.dart';
import 'package:nueva_app/services/comentario_post.dart';
import 'package:nueva_app/services/comentario_services.dart';
import 'package:nueva_app/services/contactos_services.dart';
import 'package:nueva_app/services/denunciaPublica_services.dart';
import 'package:nueva_app/services/denuncia_usuario_services.dart';
import 'package:nueva_app/services/inicioSesion_services.dart';
import 'package:nueva_app/services/institucionAyuda_services.dart';
import 'package:nueva_app/services/perfil_services.dart';
import 'package:nueva_app/services/recurso_services.dart';
import 'package:nueva_app/services/usuario_normal_services.dart';
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
          ),
        ChangeNotifierProvider(
          create: (context) => InicioSesionServices(),
          ),
        ChangeNotifierProvider(
          create: (context) => ComentarioServices(),
          ),
        ChangeNotifierProvider(
          create: (context) => UsuarioNormalServices(),
          ),
        ChangeNotifierProvider(
          create: (context) => ContactosServices(),
          ),
        ChangeNotifierProvider(
          create: (context) => DenunciaUsuarioServices(),
          ),
        ChangeNotifierProvider(
          create: (context) => PerfilServices(),
          ),
          ChangeNotifierProvider(
          create: (context) => ComentarioPostServices(),
          ),
      ],
      child: MaterialApp(
        theme: AppTheme(selectedColor: 2).theme(),
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: "/welcome",
        routes: {
          "/welcome":(context) => const WelcomeScreen(),
          "/login":(context) => const LoginScreen(),
          "/register":(context) =>const RegistrerScreenTree(),
          "/actividades":(context)=>const ActividadesScreen(),
          "/recursos":(context) => const RecursosScreen(),
          "/institucionAyuda":(context) =>const InstitucionAyudaScreen(),
          "/denunciaPublica":(context) => const DenunciaPublicaScreen(),
          "/administrador":(context) => const AdministradorScreen(),
          "/colaborador":(context) => const ColaboradorScreen(),
          "/panicBotton":(context) => const PanicBottonScreen(),
          //"/perfil":(context) => const PerfilUsuarioScreen(),
          "/denunciaUser":(context) => const DenunciaUsuarioScreen(),
          //"/appGeneric":(context) =>const AppBarGeneric(nombreAppBar: 'JUAN - JO',idUser: 71),

         // "/comentarioRecurso":(context) => const ComentarioRecursoScreen(),

        },
      
      ),
    );
  }
}