import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nueva_app/data/models/denuncia_model.dart';
class DenunciaPublicaServices extends ChangeNotifier{
  List<Datum> denunciaPublicaResults=[];
  DenunciaPublicaServices(){
    getDenunciasPublicas();
  }
  getDenunciasPublicas()async{
    const url="https://render-proyecto281-backend.onrender.com/api/denuncia";
    final res =await http.get(Uri.parse(url));
    if(res.statusCode==200){
      final resultResponse=denunciaModelFromJson(res.body);
      denunciaPublicaResults.addAll(resultResponse.data);
    }else if(res.statusCode==400){
      print('object');
    }

        // Realiza el filtrado de datos
    denunciaPublicaResults = denunciaPublicaResults.where((datum) {
      return datum.tipoDenuncia == 'publica'; // Reemplaza 'campo' por el campo real en tus datos
    }).toList();




    notifyListeners();
  }
}