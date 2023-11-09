// To parse this JSON data, do
//
//     final contactosModel = contactosModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ContactosModel contactosModelFromJson(String str) => ContactosModel.fromJson(json.decode(str));

String contactosModelToJson(ContactosModel data) => json.encode(data.toJson());

class ContactosModel {
    List<Datum> data;

    ContactosModel({
        required this.data,
    });

    factory ContactosModel.fromJson(Map<String, dynamic> json) => ContactosModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int idContacto;
    String nombreContacto;
    dynamic fechaAc;
    String telefono;
    int idUsuario;
    DateTime createdAt;
    DateTime updatedAt;

    Datum({
        required this.idContacto,
        required this.nombreContacto,
        required this.fechaAc,
        required this.telefono,
        required this.idUsuario,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idContacto: json["id_contacto"],
        nombreContacto: json["nombre_contacto"],
        fechaAc: json["fecha_ac"],
        telefono: json["telefono"],
        idUsuario: json["id_usuario"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id_contacto": idContacto,
        "nombre_contacto": nombreContacto,
        "fecha_ac": fechaAc,
        "telefono": telefono,
        "id_usuario": idUsuario,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
