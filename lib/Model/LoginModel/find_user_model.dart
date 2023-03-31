// To parse this JSON data, do
//
//     final findUserByEmailorPasswordModel = findUserByEmailorPasswordModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

FindUserByEmailOrPasswordModel findUserByEmailOrPasswordModelFromJson(String str) => FindUserByEmailOrPasswordModel.fromJson(json.decode(str));

String findUserByEmailOrPasswordModelToJson(FindUserByEmailOrPasswordModel data) => json.encode(data.toJson());

class FindUserByEmailOrPasswordModel {
  FindUserByEmailOrPasswordModel({
    required this.status,
    required this.user,
    required this.dbData,
    required this.challengeModes,
    required this.formatedUsername,
  });

  final String status;
  final String user;
  final List<String> dbData;
  final List<String> challengeModes;
  final String formatedUsername;

  factory FindUserByEmailOrPasswordModel.fromJson(Map<String, dynamic> json) => FindUserByEmailOrPasswordModel(
    status: json["STATUS"],
    user: json["USER"],
    dbData: List<String>.from(json["DB_DATA"].map((x) => x)),
    challengeModes: List<String>.from(json["CHALLENGE_MODES"].map((x) => x)),
    formatedUsername: json["FORMATED_USERNAME"],
  );

  Map<String, dynamic> toJson() => {
    "STATUS": status,
    "USER": user,
    "DB_DATA": List<dynamic>.from(dbData.map((x) => x)),
    "CHALLENGE_MODES": List<dynamic>.from(challengeModes.map((x) => x)),
    "FORMATED_USERNAME": formatedUsername,
  };
}
