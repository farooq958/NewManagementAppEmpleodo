// To parse this JSON data, do
//
//     final changePic = changePicFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ChangePic changePicFromJson(String str) => ChangePic.fromJson(json.decode(str));

String changePicToJson(ChangePic data) => json.encode(data.toJson());

class ChangePic {
  ChangePic({
    required this.status,
    required this.newDp,
  });

  final String status;
  final String newDp;

  factory ChangePic.fromJson(Map<String, dynamic> json) => ChangePic(
    status: json["status"],
    newDp: json["new_dp"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "new_dp": newDp,
  };
}
