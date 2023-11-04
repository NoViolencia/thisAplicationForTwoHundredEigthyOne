// To parse this JSON data, do
//
//     final institucionAyudaModel = institucionAyudaModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

InstitucionAyudaModel institucionAyudaModelFromJson(String str) => InstitucionAyudaModel.fromJson(json.decode(str));

String institucionAyudaModelToJson(InstitucionAyudaModel data) => json.encode(data.toJson());

class InstitucionAyudaModel {
    List<Datum> data;

    InstitucionAyudaModel({
        required this.data,
    });

    factory InstitucionAyudaModel.fromJson(Map<String, dynamic> json) => InstitucionAyudaModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int idInstAyuda;
    String nombreInstitucion;
    String telefono;
    String descripcion;
    String url;
    int idAdministrador;
    String imagen;
    DateTime createdAt;
    DateTime updatedAt;
    Administrador administrador;

    Datum({
        required this.idInstAyuda,
        required this.nombreInstitucion,
        required this.telefono,
        required this.descripcion,
        required this.url,
        required this.idAdministrador,
        required this.imagen,
        required this.createdAt,
        required this.updatedAt,
        required this.administrador,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idInstAyuda: json["id_inst_ayuda"],
        nombreInstitucion: json["nombre_institucion"],
        telefono: json["telefono"],
        descripcion: json["descripcion"],
        url: json["url"],
        idAdministrador: json["id_administrador"],
        imagen: json["imagen"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        administrador: Administrador.fromJson(json["Administrador"]),
    );

    Map<String, dynamic> toJson() => {
        "id_inst_ayuda": idInstAyuda,
        "nombre_institucion": nombreInstitucion,
        "telefono": telefono,
        "descripcion": descripcion,
        "url": url,
        "id_administrador": idAdministrador,
        "imagen": imagen,
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
