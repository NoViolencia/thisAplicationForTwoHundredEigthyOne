import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
class RegistrerPostServices extends ChangeNotifier{
  dynamic resultResponses;
  RegistrerPostServices(){
    //
  }


  Future<bool> postRegister(String nombre,String telefono,String ci,DateTime fechaNac,
  String genero,String correo,String direccion,String nombreUsuario,String pass,dynamic imagen,String paterno,String materno)async{
   // List<int> bytes = await File(imagen.path).readAsBytes();
   String genero='Otro';
   if(genero=='Genero.masculino'){
    genero='Masculino';
   }else if(genero=='Genero.femenino'){
    genero='Femenino';
   }
      const url='https://render-proyecto281-backend.onrender.com/api/usuario_normal';
        var request = http.MultipartRequest('POST', Uri.parse(url));
        request.fields['ci'] = ci;
        request.fields['nombre'] = nombre+ " "+paterno+" "+materno;
        request.fields['fecha_nac'] = fechaNac.toString();
        request.fields['genero'] = genero;
        request.fields['direccion'] = direccion;
        request.fields['correo'] = correo;
        request.fields['telefono'] = telefono;
        request.fields['nombre_usuario'] = nombreUsuario;
        request.fields['contrasenia'] = pass;
        //request.files.add(http.MultipartFile.fromBytes('archivo', bytes, filename: 'imagen.jpg'));
            // Agregar la imagen al formulario multipart
    var stream = http.ByteStream(imagen.openRead());
    //var length = await imagen.length();
    var bytes = await imagen.readAsBytes();
    var length = bytes.length;
    var multipartFile = http.MultipartFile('image', stream, length,
        filename: 'imagen.jpg', contentType: MediaType('image', 'jpeg'));

    request.files.add(multipartFile);
        var response = await request.send();
        print(request.fields);
        print(request.files);
        print(response.statusCode);
        if(response.statusCode==200){
        return true; // Retorna true en caso de éxito
        } else {
          return false; // Retorna false en caso de error
        } 
   }
}