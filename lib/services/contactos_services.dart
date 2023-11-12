import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nueva_app/data/models/conactos_model.dart';
import 'dart:convert';
class ContactosServices extends ChangeNotifier{
      dynamic resultResponses;
      List<Datum> contactosResults=[];
    ContactosServices(){
      //getContactos();

    }
    getContactos(int idUser)async{
      contactosResults=[];
      var url='https://render-proyecto281-backend.onrender.com/api/contacto/usuario/$idUser';
      //obtener la respuesta del url
      final res =await http.get(Uri.parse(url));
       //mapeamos las respuesta obtenida
      if(res.statusCode==200){
        print('contacto enviado ..');
        final resultResponse= contactosModelFromJson(res.body);
        contactosResults.addAll(resultResponse.data);
        }else if (res.statusCode==400){
        print('object');  
    }
    notifyListeners();
    }


   Future<bool> postContactos(TextEditingController nombre,TextEditingController celular,int idUser)async{
      const url='https://render-proyecto281-backend.onrender.com/api/contacto';
                // Supongamos que tienes un objeto 'contacto' que quieres serializar a JSON.
                Map<String, dynamic> contacto = {
                  'nombre_contacto': nombre.text.toString(),
                  'telefono': celular.text.toString(),
                  'id_usuario': idUser,
                };
                // Serializa el objeto 'contacto' a una cadena JSON.
                String contactoJSON = jsonEncode(contacto);
        var response =await http.post(Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'}, 
        body:contactoJSON );
        if(response.statusCode==200){
        final resultResponse= jsonDecode(response.body);
        resultResponses=resultResponse;
        return true; // Retorna true en caso de éxito
        } else {
          return false; // Retorna false en caso de error
        } 
   }
   
   
   Future<bool> deleteContactos(int idContac,int idUser)async{
    var url='https://render-proyecto281-backend.onrender.com/api/contacto/$idContac/usuario/$idUser';
    var response=await http.delete(Uri.parse(url));
    if(response.statusCode==200){
      return true;
    }else{
      return false;
    }
   }

    Future<bool> putContactos(TextEditingController nombre,TextEditingController celular,int idContac,int idUser)async{
    var url='https://render-proyecto281-backend.onrender.com/api/contacto/$idContac/usuario/$idUser';
            // Supongamos que tienes un objeto 'contacto' que quieres serializar a JSON.
                Map<String, dynamic> contactoEdit = {
                  'nombre_contacto': nombre.text.toString(),
                  'telefono': celular.text.toString(),
                };
                // Serializa el objeto 'contacto' a una cadena JSON.
                String contactoJSON = jsonEncode(contactoEdit);
    var response=await http.put(Uri.parse(url),
    headers: <String, String>{'Content-Type': 'application/json'},
    body:contactoJSON );
    if(response.statusCode==200){
      return true;
    }else{
      return false;
    }
   }
    

}