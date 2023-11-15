import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nueva_app/data/models/usuario_normal_model.dart';

class UsuarioNormalServices extends ChangeNotifier {
    Data usuarioNormalResult = Data(
    idUsuario: 0,
    estado: '',
    fechaRegistro: DateTime.now(),
    idAdministrador: 0,
    createdAt: DateTime.now(),
    updatedAt:DateTime.now(),
    usuario: Usuario(
      idUsuario: 0,
      ci: '',
      nombre: '',
      fechaNac: DateTime.now(),
      genero: '',
      direccion: '',
      correo: '',
      telefono: '',
      nombreUsuario: '',
      contrasenia: '',
      imagenPerfil: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),

    ), // Puedes necesitar ajustar según tu modelo de Usuario
  );
  UsuarioNormalServices() {
    // if (idUser != null) {
  }
  Future<bool> getUsuarioNormal(int idUsuario) async {
    //print(idUsuario);
    var url = 'https://render-proyecto281-backend.onrender.com/api/usuario_normal/$idUsuario';
    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      final resultResponses = usuarioNormalModelFromJson(res.body);
      usuarioNormalResult = resultResponses.data;
     // print('el usuario fue enviado');
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}