import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:nueva_app/services/inicioSesion_services.dart';
import 'package:provider/provider.dart';
class LoginScreen extends StatelessWidget {

const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors=Theme.of(context).colorScheme;
    // final inicioSesionServices=Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
          icon: const Icon(
          Icons.arrow_back_ios_outlined,
          color: Colors.black,
          size: 30,
        )),
        actions: [
          TextButton(onPressed: (){
            Navigator.pushNamed(context, '/register');
          },
           style: TextButton.styleFrom(
            foregroundColor: Colors.black,
           ),
           child: const Text('REGISTRO'))
        ],
      ),
      backgroundColor: colors.primary,
      
      body:SingleChildScrollView(
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Inicia Sesion ', 
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900
              ),),
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Por favor completa los siguientes campos', 
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
            ),
            const SizedBox(height: 50,),
            Container(
              width: double.infinity,
              height: 1800,
              //color: Colors.blue,
              decoration:const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft:Radius.circular(40) ,
                  topRight:Radius.circular(40) ,
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                  )
                ],
              ) ,
              child: const Column(
                children: [
                  MyCustomForm(),

                ],
              ),
            ),
          ],
        ),
        ),


      );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email=TextEditingController();
  TextEditingController pass=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _email(email),
            const SizedBox(height: 15,),
            _pass(pass),
            const SizedBox(height: 15,),
            _CustomButtonRegistrer(formKey: _formKey, email: email, pass: pass),
          ],
        ),
      ),
    );
  }



  TextFormField _email(TextEditingController value) {
    return TextFormField(
      controller: value,
      autovalidateMode: AutovalidateMode.disabled,
        validator: (value){
        if(value!.isEmpty){
          return"este campo es obligatorio";

        }
      },
      
      decoration: InputDecoration(
        hintText: 'Correo Electrónico',
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none
        ) ,
        enabledBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none
        ) ,
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40)
        ) ,
        filled: true,
        fillColor:Colors.grey.shade200
      ),
    );
  }
  TextFormField _pass(TextEditingController val) {
    return TextFormField(
      controller: val,
      autovalidateMode: AutovalidateMode.disabled,
      validator: (value){
        if(value!.isEmpty){
          return'Este campo es obligatorio';

        }
      },
      decoration: InputDecoration(
        hintText: 'Contraseña',
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none
        ) ,
        enabledBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none
        ) ,
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(40)
        ) ,
        filled: true,
        fillColor:Colors.grey.shade200
      ),
    );
  }
 
}

class _CustomButtonRegistrer extends StatelessWidget {
  const _CustomButtonRegistrer({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.email,
    required this.pass,
  }) : 
    _formKey = formKey,
    super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController email;
  final TextEditingController pass;

  @override
  Widget build(BuildContext context) {
    final inicioSesionServices = Provider.of<InicioSesionServices>(context);
    return FutureBuilder(
      future: inicioSesionServices.postAuth(email, pass), // Llama a postAuth con los valores actuales de email y pass
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final resultResponses = snapshot.data;
            handleResponse(resultResponses,context); // Llama a la función handleResponse con la respuesta
          } else {
            print('FAllo mucho');
          }
        }

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          height: 55,
          child: ElevatedButton(
  onPressed: () async {
    if (_formKey.currentState!.validate()) {
      print(email.text);
      print(pass.text);
      // solicitud HTTP aquí
      final resultResponses = await inicioSesionServices.postAuth(email, pass);
      handleResponse(resultResponses,context);
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
  child: const Text(
    'Inicia Sesion',
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  ),
),

        );
      },
    );
  }

  void handleResponse(resultResponses, BuildContext context) {
    final rol=resultResponses['data']['rol'].toString();
    final int idUsuario =resultResponses['data']['id_usuario'];
    if(rol=='usuario_normal'){
        Navigator.pushNamed(context,'/actividades',arguments: idUsuario,);// Aquí envías el idUsuario como argumento
  //);
    }else if(rol=='administrador'){
      Navigator.pushNamed(context, '/administrador');
    }else if(rol=='colaborador'){
      Navigator.pushNamed(context, '/colaborador');
    }
  }
}

//-------------------------------------------------------------------------------
// class _CustomButtonRegistrer extends StatelessWidget {
  
//   const _CustomButtonRegistrer({
//     super.key,
//     required GlobalKey<FormState> formKey,
//     required this.email,
//     required this.pass,
//   }) : _formKey = formKey;

//   final GlobalKey<FormState> _formKey;
//   final TextEditingController email;
//   final TextEditingController pass;

//   @override
//   Widget build(BuildContext context) {
//   final inicioSesionServices = Provider.of<InicioSesionServices>(context);
//     return Container(
//       padding:const EdgeInsets.symmetric(horizontal: 30),
//       width: double.infinity,
//       height: 55,
//       child: ElevatedButton(
//         onPressed: (){
//           if(_formKey.currentState!.validate()){
//             print(email.text);
//             print(pass.text);
//             inicioSesionServices.postAuth(email, pass);
//             handleResponse(inicioSesionServices.resultResponses);
//             //postAuth(email,pass);
//          }
//         },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.black,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//           )
//         ),
//         child:const Text('Inicia Sesion',
//         style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
//         ),
//         ),
//     );
//   }
// }

// void handleResponse(resultResponses) {
//   print('Respuesta en el widget: $resultResponses');

// }


//-------------------------------------------------------------------------------
    // postAuth(TextEditingController correo,TextEditingController contrasenia)async{
    //   const url='https://render-proyecto281-backend.onrender.com/api//auth/login';
    //               // Supongamos que tienes un objeto 'usuario' que quieres serializar a JSON.
    //             Map<String, dynamic> usuario = {
    //               'correo': correo.text.toString(),
    //               'contrasenia': contrasenia.text.toString(),
    //             };

    //             // Serializa el objeto 'usuario' a una cadena JSON.
    //             String usuarioJSON = jsonEncode(usuario);
    //   var response =await http.post(
    //     Uri.parse(url),
    //     headers: <String, String>{'Content-Type': 'application/json'}, 
    //     body:usuarioJSON );
    //   print(usuarioJSON);
    //   print('Response status: ${response.statusCode}');
    //   print('Response body: ${response.body}');
    // }

