import 'package:meta/meta.dart';
import 'dart:convert';

ActividadModel ActividadModelFromJson(String str) => ActividadModel.fromJson(json.decode(str));

String ActividadModelToJson(ActividadModel data) => json.encode(data.toJson());

class ActividadModel {
    List<Datum> data;

    ActividadModel({
        required this.data,
    });

    factory ActividadModel.fromJson(Map<String, dynamic> json) => ActividadModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int idActividad;
    String nombreActividad;
    String tipo;
    String descripcion;
    DateTime fechaIni;
    DateTime fechaFin;
    DateTime hora;
    String imagen;
    int idAdministrador;
    DateTime createdAt;
    DateTime updatedAt;

    Datum({
        required this.idActividad,
        required this.nombreActividad,
        required this.tipo,
        required this.descripcion,
        required this.fechaIni,
        required this.fechaFin,
        required this.hora,
        required this.imagen,
        required this.idAdministrador,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idActividad: json["id_actividad"],
        nombreActividad: json["nombre_actividad"],
        tipo: json["tipo"],
        descripcion: json["descripcion"],
        fechaIni: DateTime.parse(json["fecha_ini"]),
        fechaFin: DateTime.parse(json["fecha_fin"]),
        hora: DateTime.parse(json["hora"]),
        imagen: json["imagen"],
        idAdministrador: json["id_administrador"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id_actividad": idActividad,
        "nombre_actividad": nombreActividad,
        "tipo": tipo,
        "descripcion": descripcion,
        "fecha_ini": fechaIni.toIso8601String(),
        "fecha_fin": fechaFin.toIso8601String(),
        "hora": hora.toIso8601String(),
        "imagen": imagen,
        "id_administrador": idAdministrador,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}