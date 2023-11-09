import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nueva_app/data/models/cometario_media.dart';
class ComentarioServices extends ChangeNotifier{
  List<Datum> comentarioResults=[];
  ComentarioServices({int? idRecurso}){
    // if(idRecurso!=null){
    //   getComentarios(idRecurso);
    // }
  }
  getComentarios(int idRecur)async{
    comentarioResults=[];
    var url='https://render-proyecto281-backend.onrender.com/api//recurso/comentario/$idRecur';
    final res=await http.get(Uri.parse(url));
    if(res.statusCode==200){
      final resultResponse=comentarioMediaFromJson(res.body) ;
      comentarioResults.addAll(resultResponse.data);
    }else if(res.statusCode==400){
      print('object');
    }
    notifyListeners();
  }
}