import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nueva_app/data/models/usuario_normal_model.dart';

class UsuarioNormalServices extends ChangeNotifier {
  Data? usuarioNormalResult; // Cambio de List<Datum> a Datum
  UsuarioNormalServices({int? idUser}) {
    // if (idUser != null) {
    //   print('entro a este methidi');
    //   getUsuarioNormal(idUser);
    // }
  }
  getUsuarioNormal(int idUsuario) async {
    print(idUsuario);
    var url = 'https://render-proyecto281-backend.onrender.com/api/usuario_normal/$idUsuario';
    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      final resultResponses = usuarioNormalModelFromJson(res.body);
      usuarioNormalResult = resultResponses.data;
      print('el usuario fue enviado');
    } else if (res.statusCode == 400) {
      print('object');
    }
    notifyListeners();
  }
}