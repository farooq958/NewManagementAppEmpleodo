// To parse this JSON data, do
//
//     final timeAdjustmentSuccessModel = timeAdjustmentSuccessModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TimeAdjustmentSuccessModel timeAdjustmentSuccessModelFromJson(String str) => TimeAdjustmentSuccessModel.fromJson(json.decode(str));

String timeAdjustmentSuccessModelToJson(TimeAdjustmentSuccessModel data) => json.encode(data.toJson());

class TimeAdjustmentSuccessModel {
  TimeAdjustmentSuccessModel({
    required this.availedLeave,
    required this.status,
    required this.dbResp,
    required this.recordId,
    required this.message,
    required this.storyResponse,
  });

  final String availedLeave;
  final String status;
  final bool dbResp;
  final int recordId;
  final String message;
  final StoryResponse storyResponse;

  factory TimeAdjustmentSuccessModel.fromJson(Map<String, dynamic> json) => TimeAdjustmentSuccessModel(
    availedLeave: json["AVAILED_LEAVE"],
    status: json["STATUS"],
    dbResp: json["DB_RESP"],
    recordId: json["RECORD_ID"],
    message: json["MESSAGE"],
    storyResponse: StoryResponse.fromJson(json["STORY_RESPONSE"]),
  );

  Map<String, dynamic> toJson() => {
    "AVAILED_LEAVE": availedLeave,
    "STATUS": status,
    "DB_RESP": dbResp,
    "RECORD_ID": recordId,
    "MESSAGE": message,
    "STORY_RESPONSE": storyResponse.toJson(),
  };
}

class StoryResponse {
  StoryResponse({
    required this.status,
    required this.story,
    required this.storyUserLinks,
    required this.msg,
  });

  final String status;
  final String story;
  final String storyUserLinks;
  final String msg;

  factory StoryResponse.fromJson(Map<String, dynamic> json) => StoryResponse(
    status: json["status"],
    story: json["story"],
    storyUserLinks: json["story_user_links"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "story": story,
    "story_user_links": storyUserLinks,
    "msg": msg,
  };
}
