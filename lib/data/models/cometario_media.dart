import 'package:meta/meta.dart';
import 'dart:convert';

ComentarioMedia comentarioMediaFromJson(String str) => ComentarioMedia.fromJson(json.decode(str));

String comentarioMediaToJson(ComentarioMedia data) => json.encode(data.toJson());

class ComentarioMedia {
    List<Datum> data;

    ComentarioMedia({
        required this.data,
    });

    factory ComentarioMedia.fromJson(Map<String, dynamic> json) => ComentarioMedia(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    DateTime fecha;
    String descripcion;
    bool estado;
    int idUsuario;
    int idRecurso;
    UsuarioNormal usuarioNormal;

    Datum({
        required this.fecha,
        required this.descripcion,
        required this.estado,
        required this.idUsuario,
        required this.idRecurso,
        required this.usuarioNormal,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        fecha: DateTime.parse(json["fecha"]),
        descripcion: json["descripcion"],
        estado: json["estado"],
        idUsuario: json["id_usuario"],
        idRecurso: json["id_recurso"],
        usuarioNormal: UsuarioNormal.fromJson(json["Usuario_normal"]),
    );

    Map<String, dynamic> toJson() => {
        "fecha": fecha.toIso8601String(),
        "descripcion": descripcion,
        "estado": estado,
        "id_usuario": idUsuario,
        "id_recurso": idRecurso,
        "Usuario_normal": usuarioNormal.toJson(),
    };
}

class UsuarioNormal {
    int idUsuario;
    Usuario usuario;

    UsuarioNormal({
        required this.idUsuario,
        required this.usuario,
    });

    factory UsuarioNormal.fromJson(Map<String, dynamic> json) => UsuarioNormal(
        idUsuario: json["id_usuario"],
        usuario: Usuario.fromJson(json["Usuario"]),
    );

    Map<String, dynamic> toJson() => {
        "id_usuario": idUsuario,
        "Usuario": usuario.toJson(),
    };
}

class Usuario {
    String correo;
    String nombreUsuario;

    Usuario({
        required this.correo,
        required this.nombreUsuario,
    });

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        correo: json["correo"],
        nombreUsuario: json["nombre_usuario"],
    );

    Map<String, dynamic> toJson() => {
        "correo": correo,
        "nombre_usuario": nombreUsuario,
    };
}