import 'package:flutter/material.dart';
import 'package:nueva_app/data/models/actividad_model.dart';
import 'package:http/http.dart' as http;
class ActividadServices extends ChangeNotifier{
    List<Datum> actividadesResults=[];
    ActividadServices(){
      getActividades();

    }
    getActividades()async{
      const url='https://render-proyecto281-backend.onrender.com/api/actividad';
      //obtener la respuesta del url
      final res =await http.get(Uri.parse(url));
       //mapeamos las respuesta obtenida
      if(res.statusCode==200){
        final resultResponse= ActividadModelFromJson(res.body);
        actividadesResults.addAll(resultResponse.data);
        }else if (res.statusCode==400){
        print('object');  
    }
    notifyListeners();


    }
    



}
