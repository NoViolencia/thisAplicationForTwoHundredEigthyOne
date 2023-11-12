import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nueva_app/data/models/denuncai_usuario_model.dart';
class DenunciaUsuarioServices extends ChangeNotifier{
        List<Datum> denunciaResults=[];
    DenunciaUsuarioServices(){
      //getDenuncia();

    }
    getDenuncia(int idUsuario)async{
      denunciaResults=[];
      var url='https://render-proyecto281-backend.onrender.com/api/denuncia/usuario_normal/$idUsuario';
      //obtener la respuesta del url
      final res =await http.get(Uri.parse(url));
       //mapeamos las respuesta obtenida
      if(res.statusCode==200){
        print('denuncia enviada');
        final resultResponse= denunciaUsuarioModelFromJson(res.body);
        denunciaResults.addAll(resultResponse.data);
        }else if (res.statusCode==400){
        print('object');  
    }
    notifyListeners();
    }

}