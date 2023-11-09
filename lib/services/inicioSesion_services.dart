import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class InicioSesionServices extends ChangeNotifier{
    //InvalidType resultResponse=;
    dynamic resultResponses;
    InicioSesionServices({TextEditingController? email,TextEditingController? pass}){
      if (email != null && pass != null) {
      postAuth(email, pass);
      }    
    }
    postAuth(TextEditingController correo,TextEditingController contrasenia)async{
      const url='https://render-proyecto281-backend.onrender.com/api//auth/login';
                  // Supongamos que tienes un objeto 'usuario' que quieres serializar a JSON.
                Map<String, dynamic> usuario = {
                  'correo': correo.text.toString(),
                  'contrasenia': contrasenia.text.toString(),
                };
                // Serializa el objeto 'usuario' a una cadena JSON.
                String usuarioJSON = jsonEncode(usuario);
      var response =await http.post(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'}, 
        body:usuarioJSON );
      if(response.statusCode==200){
        final resultResponse= jsonDecode(response.body);
        resultResponses=resultResponse;
        // final correologin = resultResponse['data']['correo'];
        // final id_usuario = resultResponse['data']['id_usuario'];
        // final rol = resultResponse['data']['rol'];
        //print('respuesta del body en el services: $resultResponse');
        return resultResponse; // Retorna la respuesta
        } else {
          return null; // Retorna null en caso de error
        }
        // }else if (response.statusCode==400){
        // print(jsonDecode(response.body)['message']);  
        // } 
    }
}