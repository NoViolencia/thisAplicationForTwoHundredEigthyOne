import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nueva_app/data/models/conactos_model.dart';
class ContactosServices extends ChangeNotifier{
      List<Datum> contactosResults=[];
    ContactosServices(){
      getContactos();

    }
    getContactos()async{
      const url='https://render-proyecto281-backend.onrender.com/api/usuario_normal/29';
      //obtener la respuesta del url
      final res =await http.get(Uri.parse(url));
       //mapeamos las respuesta obtenida
      if(res.statusCode==200){
        final resultResponse= contactosModelFromJson(res.body);
        contactosResults.addAll(resultResponse.data);
        }else if (res.statusCode==400){
        print('object');  
    }
    notifyListeners();


    }

}