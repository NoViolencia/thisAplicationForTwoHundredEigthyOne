import 'package:meta/meta.dart';
import 'dart:convert';

UsuarioNormalModel usuarioNormalModelFromJson(String str) => UsuarioNormalModel.fromJson(json.decode(str));

String usuarioNormalModelToJson(UsuarioNormalModel data) => json.encode(data.toJson());

class UsuarioNormalModel {
    Data data;

    UsuarioNormalModel({
        required this.data,
    });

    factory UsuarioNormalModel.fromJson(Map<String, dynamic> json) => UsuarioNormalModel(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    int idUsuario;
    String estado;
    DateTime fechaRegistro;
    dynamic idAdministrador;
    DateTime createdAt;
    DateTime updatedAt;
    Usuario usuario;

    Data({
        required this.idUsuario,
        required this.estado,
        required this.fechaRegistro,
        required this.idAdministrador,
        required this.createdAt,
        required this.updatedAt,
        required this.usuario,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        idUsuario: json["id_usuario"],
        estado: json["estado"],
        fechaRegistro: DateTime.parse(json["fecha_registro"]),
        idAdministrador: json["id_administrador"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        usuario: Usuario.fromJson(json["Usuario"]),
    );

    Map<String, dynamic> toJson() => {
        "id_usuario": idUsuario,
        "estado": estado,
        "fecha_registro": fechaRegistro.toIso8601String(),
        "id_administrador": idAdministrador,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "Usuario": usuario.toJson(),
    };
}

class Usuario {
    int idUsuario;
    String ci;
    String nombre;
    DateTime fechaNac;
    String genero;
    String direccion;
    String correo;
    String telefono;
    String nombreUsuario;
    String contrasenia;
    dynamic imagenPerfil;
    DateTime createdAt;
    DateTime updatedAt;

    Usuario({
        required this.idUsuario,
        required this.ci,
        required this.nombre,
        required this.fechaNac,
        required this.genero,
        required this.direccion,
        required this.correo,
        required this.telefono,
        required this.nombreUsuario,
        required this.contrasenia,
        required this.imagenPerfil,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        idUsuario: json["id_usuario"],
        ci: json["ci"],
        nombre: json["nombre"],
        fechaNac: DateTime.parse(json["fecha_nac"]),
        genero: json["genero"],
        direccion: json["direccion"],
        correo: json["correo"],
        telefono: json["telefono"],
        nombreUsuario: json["nombre_usuario"],
        contrasenia: json["contrasenia"],
        imagenPerfil: json["Imagen_perfil"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id_usuario": idUsuario,
        "ci": ci,
        "nombre": nombre,
        "fecha_nac": fechaNac.toIso8601String(),
        "genero": genero,
        "direccion": direccion,
        "correo": correo,
        "telefono": telefono,
        "nombre_usuario": nombreUsuario,
        "contrasenia": contrasenia,
        "Imagen_perfil": imagenPerfil,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}