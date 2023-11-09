import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nueva_app/data/models/comentario_Model_two.dart';
class ComentarioTwoServices extends ChangeNotifier{
  List<Datum> comentarioResult=[];
  ComentarioTwoServices(){
    
  }
  getComentario(int id)async{
    var url='https://render-proyecto281-backend.onrender.com/api//recurso/comentario/$id';
    final res=await http.get(Uri.parse(url)) ;
    if(res.statusCode==200){
      final resultResponses=comentariModelFromJson(res.body);
      comentarioResult.addAll(resultResponses.data);
    }
    if(res.statusCode==400){
      print('error al mandar datos ');
    }
    



  }
}