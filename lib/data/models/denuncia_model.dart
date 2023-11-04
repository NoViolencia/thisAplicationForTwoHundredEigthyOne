// To parse this JSON data, do
//
//     final denunciaModel = denunciaModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DenunciaModel denunciaModelFromJson(String str) => DenunciaModel.fromJson(json.decode(str));

String denunciaModelToJson(DenunciaModel data) => json.encode(data.toJson());

class DenunciaModel {
    List<Datum> data;

    DenunciaModel({
        required this.data,
    });

    factory DenunciaModel.fromJson(Map<String, dynamic> json) => DenunciaModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int idDenuncia;
    String nombreVictima;
    String nombreAgresor;
    String tipoViolencia;
    String tipoDenuncia;
    DateTime fecha;
    String descripcion;
    String pruebas;
    String ubicacion;
    bool estado;
    int idUsuario;
    DateTime createdAt;
    DateTime updatedAt;
    //UsuarioNormal usuarioNormal;

    Datum({
        required this.idDenuncia,
        required this.nombreVictima,
        required this.nombreAgresor,
        required this.tipoViolencia,
        required this.tipoDenuncia,
        required this.fecha,
        required this.descripcion,
        required this.pruebas,
        required this.ubicacion,
        required this.estado,
        required this.idUsuario,
        required this.createdAt,
        required this.updatedAt,
        //required this.usuarioNormal,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idDenuncia: json["id_denuncia"],
        nombreVictima: json["nombre_victima"],
        nombreAgresor: json["nombre_agresor"],
        tipoViolencia: json["tipo_violencia"],
        tipoDenuncia: json["tipo_denuncia"],
        fecha: DateTime.parse(json["fecha"]),
        descripcion: json["descripcion"],
        pruebas: json["pruebas"],
        ubicacion: json["ubicacion"],
        estado: json["estado"],
        idUsuario: json["id_usuario"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        //usuarioNormal: UsuarioNormal.fromJson(json["Usuario_normal"]),
    );

    Map<String, dynamic> toJson() => {
        "id_denuncia": idDenuncia,
        "nombre_victima": nombreVictima,
        "nombre_agresor": nombreAgresor,
        "tipo_violencia": tipoViolencia,
        "tipo_denuncia": tipoDenuncia,
        "fecha": fecha.toIso8601String(),
        "descripcion": descripcion,
        "pruebas": pruebas,
        "ubicacion": ubicacion,
        "estado": estado,
        "id_usuario": idUsuario,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        //"Usuario_normal": usuarioNormal.toJson(),
    };
}




