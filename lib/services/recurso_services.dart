import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:nueva_app/data/models/recurso_model.dart';
class RecursoServices extends ChangeNotifier{
  List<Datum> recursosResults=[];
  RecursoServices(){
    getRecursos();
  }
  getRecursos()async{
    const url='https://render-proyecto281-backend.onrender.com/api/recurso';
    final res =await http.get(Uri.parse(url));
    if(res.statusCode==200){
      final resultResponse=recursosModelFromJson(res.body);
      recursosResults.addAll(resultResponse.data);
    }else if(res.statusCode==400){
      print('object');
    }
    notifyListeners();
  }
}