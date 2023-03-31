// To parse this JSON data, do
//
//     final last30DaysModel = last30DaysModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Last30DaysModel last30DaysModelFromJson(String str) => Last30DaysModel.fromJson(json.decode(str));

String last30DaysModelToJson(Last30DaysModel data) => json.encode(data.toJson());

class Last30DaysModel {
  Last30DaysModel({
    required this.status,
    required this.data,
  });

  final String status;
  final List<Datum> data;

  factory Last30DaysModel.fromJson(Map<String, dynamic> json) => Last30DaysModel(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.date,
    required this.earned,
    required this.lateMinutes,
    required this.overtime,
    required this.timings,
  });

  final String date;
  final String earned;
  final int lateMinutes;
  final String overtime;
  final List<Timing> timings;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    date: json["date"],
    earned: json["earned"],
    lateMinutes: json["late_minutes"],
    overtime: json["overtime"],
    timings: List<Timing>.from(json["timings"].map((x) => Timing.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "earned": earned,
    "late_minutes": lateMinutes,
    "overtime": overtime,
    "timings": List<dynamic>.from(timings.map((x) => x.toJson())),
  };
}

class Timing {
  Timing({
    required this.timingIn,
    required this.out,
  });

  final String timingIn;
  final String out;

  factory Timing.fromJson(Map<String, dynamic> json) => Timing(
    timingIn: json["in"],
    out: json["out"],
  );

  Map<String, dynamic> toJson() => {
    "in": timingIn,
    "out": out,
  };
}
