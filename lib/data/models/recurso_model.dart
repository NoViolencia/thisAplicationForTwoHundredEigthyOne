// To parse this JSON data, do
//
//     final recursosModel = recursosModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RecursosModel recursosModelFromJson(String str) => RecursosModel.fromJson(json.decode(str));

String recursosModelToJson(RecursosModel data) => json.encode(data.toJson());

class RecursosModel {
    List<Datum> data;

    RecursosModel({
        required this.data,
    });

    factory RecursosModel.fromJson(Map<String, dynamic> json) => RecursosModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int idRecurso;
    String titulo;
    String tipo;
    String descripcion;
    String url;
    String autor;
    String contenido;
    bool visibilidad;
    int idAdministrador;
    DateTime createdAt;
    DateTime updatedAt;
    Administrador administrador;

    Datum({
        required this.idRecurso,
        required this.titulo,
        required this.tipo,
        required this.descripcion,
        required this.url,
        required this.autor,
        required this.contenido,
        required this.visibilidad,
        required this.idAdministrador,
        required this.createdAt,
        required this.updatedAt,
        required this.administrador,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idRecurso: json["id_recurso"],
        titulo: json["titulo"],
        tipo: json["tipo"],
        descripcion: json["descripcion"],
        url: json["url"],
        autor: json["autor"],
        contenido: json["contenido"],
        visibilidad: json["visibilidad"],
        idAdministrador: json["id_administrador"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        administrador: Administrador.fromJson(json["Administrador"]),
    );

    Map<String, dynamic> toJson() => {
        "id_recurso": idRecurso,
        "titulo": titulo,
        "tipo": tipo,
        "descripcion": descripcion,
        "url": url,
        "autor": autor,
        "contenido": contenido,
        "visibilidad": visibilidad,
        "id_administrador": idAdministrador,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "Administrador": administrador.toJson(),
    };
}

class Administrador {
    int idAdministrador;
    int idUsuario;
    String rol;
    DateTime createdAt;
    DateTime updatedAt;

    Administrador({
        required this.idAdministrador,
        required this.idUsuario,
        required this.rol,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Administrador.fromJson(Map<String, dynamic> json) => Administrador(
        idAdministrador: json["id_administrador"],
        idUsuario: json["id_usuario"],
        rol: json["rol"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id_administrador": idAdministrador,
        "id_usuario": idUsuario,
        "rol": rol,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
