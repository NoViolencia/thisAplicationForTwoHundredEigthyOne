import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ComentarioPostServices extends ChangeNotifier{
  dynamic resultResponses;
  ComentarioPostServices(){
    //
  }
     Future<bool> postComentarios(TextEditingController descripcion, int  idRecurso,int idUser)async{
      bool estado=false;
      const url='https://render-proyecto281-backend.onrender.com/api//comentario';
                // Supongamos que tienes un objeto 'comentario' que quieres serializar a JSON.
                Map<String, dynamic> comentario = {
                  'fecha': DateTime.now().toString(),
                  'descripcion': descripcion.text.toString(),
                  'estado': estado.toString(),
                  'id_recurso': idRecurso.toString(),
                  'id_usuario': idUser.toString(),
                };
                // Serializa el objeto 'comentario' a una cadena JSON.
                String comentarioJSON = jsonEncode(comentario);
        var response =await http.post(Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'}, 
        body:comentarioJSON );
        print('entro a comentarios');
        print('estatus desde Comenaty: ${response.statusCode}');
        print(comentarioJSON);
        if(response.statusCode==200){
        final resultResponse= jsonDecode(response.body);
        resultResponses=resultResponse;
        return true; // Retorna true en caso de éxito
        } else {
          return false; // Retorna false en caso de error
        } 
   }
}