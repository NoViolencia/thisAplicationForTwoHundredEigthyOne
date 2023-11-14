import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class PerfilServices extends ChangeNotifier{
  PerfilServices(){
    //void
  }

  Future<bool> putPerfil(String nombre,String telefono,String ci,DateTime fechaNac,
  String genero,String direccion,String nombreUsuario,String pass,dynamic imagen,int idUser)async{
    var url='https://render-proyecto281-backend.onrender.com/api/usuario_normal/$idUser';
            // Supongamos que tienes un objeto 'contacto' que quieres serializar a JSON.
                Map<String, dynamic> usuarioEdit = {
                  'ci':ci,
                  'nombre': nombre,
                  'fecha_nac': fechaNac.toString(),
                  'genero':genero,
                  'direccion': direccion,
                  'telefono': telefono,
                  'nombre_usuario':nombreUsuario,
                  'contrasenia':pass,
                  'image':imagen,
                };
                // Serializa el objeto 'contacto' a una cadena JSON.
                String usuarioJSON = jsonEncode(usuarioEdit);
                
    var response= await http.put(Uri.parse(url),
    headers: <String, String>{'Content-Type': 'application/json'},
    body:usuarioJSON );
    if(response.statusCode==200){
      return true;
    }else{
      return false;
    }
  }
}