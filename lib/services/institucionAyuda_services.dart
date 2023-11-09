import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nueva_app/data/models/institucion_model.dart';
class InstitucionAyudaServices extends ChangeNotifier{
  List<Datum> institucionAyudaResult=[];
  InstitucionAyudaServices(){
    getInstitucionAyuda();
  }
  getInstitucionAyuda()async{
    const url="https://render-proyecto281-backend.onrender.com/api/institucion_ayuda";
    final res =await http.get(Uri.parse(url));
    if(res.statusCode==200){
      final resultResponse=institucionAyudaModelFromJson(res.body);
      institucionAyudaResult.addAll(resultResponse.data);
      print('institucion ayuda enviada');
    }else if(res.statusCode==400){
      print('object');
    }
    notifyListeners();
  }

}