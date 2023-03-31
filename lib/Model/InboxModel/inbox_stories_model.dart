// To parse this JSON data, do
//
//     final inboxStoriesModel = inboxStoriesModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

InboxStoriesModel inboxStoriesModelFromJson(String str) => InboxStoriesModel.fromJson(json.decode(str));

String inboxStoriesModelToJson(InboxStoriesModel data) => json.encode(data.toJson());

class InboxStoriesModel {
  InboxStoriesModel({
    required this.status,
    required this.storiesCount,
    required this.stories,
    required this.nextPage,
  });

  final String status;
  final int storiesCount;
  final List<Story> stories;
  final int nextPage;

  factory InboxStoriesModel.fromJson(Map<String, dynamic> json) => InboxStoriesModel(
    status: json["status"],
    storiesCount: json["stories_count"],
    stories: List<Story>.from(json["stories"].map((x) => Story.fromJson(x))),
    nextPage: json["nextPage"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "stories_count": storiesCount,
    "stories": List<dynamic>.from(stories.map((x) => x.toJson())),
    "nextPage": nextPage,
  };
}

class Story {
  Story({
    required this.id,
    required this.storyId,
    required this.initiatorOneid,
    required this.initiatorOrgid,
    required this.appId,
    required this.title,
    required this.type,
    required this.typeRef,
    required this.typeBaseInfo,
    required this.deletable,
    required this.status,
    required this.entryTime,
    required this.users,
    required this.userInfo,
  });

  final Id id;
  final String storyId;
  final String initiatorOneid;
  final String initiatorOrgid;
  final String appId;
  final String title;
  final String type;
  final int typeRef;
  final String typeBaseInfo;
  final int deletable;
  final int status;
  final DateTime entryTime;
  final List<User> users;
  final UserInfo userInfo;

  factory Story.fromJson(Map<String, dynamic> json) => Story(
    id: Id.fromJson(json["_id"]),
    storyId: json["story_id"],
    initiatorOneid: json["initiator_oneid"],
    initiatorOrgid: json["initiator_orgid"],
    appId: json["app_id"],
    title: json["title"],
    type: json["type"],
    typeRef: json["type_ref"],
    typeBaseInfo: json["type_base_info"],
    deletable: json["deletable"],
    status: json["status"],
    entryTime: DateTime.parse(json["entry_time"]),
    users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
    userInfo: UserInfo.fromJson(json["user_info"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id.toJson(),
    "story_id": storyId,
    "initiator_oneid": initiatorOneid,
    "initiator_orgid": initiatorOrgid,
    "app_id": appId,
    "title": title,
    "type": type,
    "type_ref": typeRef,
    "type_base_info": typeBaseInfo,
    "deletable": deletable,
    "status": status,
    "entry_time": entryTime.toIso8601String(),
    "users": List<dynamic>.from(users.map((x) => x.toJson())),
    "user_info": userInfo.toJson(),
  };
}

class Id {
  Id({
    required this.storyId,
  });

  final String storyId;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
    storyId: json["story_id"],
  );

  Map<String, dynamic> toJson() => {
    "story_id": storyId,
  };
}

class UserInfo {
  UserInfo({
    required this.status,
    required this.dbData,
    required this.statusCode,
  });

  final String status;
  final DbData dbData;
  final String statusCode;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    status: json["STATUS"],
    dbData: DbData.fromJson(json["DB_DATA"]),
    statusCode: json["STATUS_CODE"],
  );

  Map<String, dynamic> toJson() => {
    "STATUS": status,
    "DB_DATA": dbData.toJson(),
    "STATUS_CODE": statusCode,
  };
}

class DbData {
  DbData({
    required this.userOneId,
    required this.fullName,
    required this.status,
    required this.countryCode,
    required this.dob,
    required this.gender,
    required this.entryTime,
    required this.countryName,
    required this.iso2,
    required this.email,
    required this.phone,
    required this.username,
    required this.organizations,
    required this.recordId,
    required this.userImage,
  });

  final String userOneId;
  final String fullName;
  final String status;
  final String countryCode;
  final DateTime dob;
  final String gender;
  final String entryTime;
  final String countryName;
  final String iso2;
  final String email;
  final String phone;
  final List<String> username;
  final Organizations organizations;
  final String recordId;
  final String userImage;

  factory DbData.fromJson(Map<String, dynamic> json) => DbData(
    userOneId: json["user_oneID"],
    fullName: json["full_name"],
    status: json["status"],
    countryCode: json["country_code"],
    dob: DateTime.parse(json["dob"]),
    gender: json["gender"],
    entryTime: json["entry_time"],
    countryName: json["country_name"],
    iso2: json["iso2"],
    email: json["email"],
    phone: json["phone"],
    username: List<String>.from(json["username"].map((x) => x)),
    organizations: Organizations.fromJson(json["ORGANIZATIONS"]),
    recordId: json["record_id"],
    userImage: json["user_image"],
  );

  Map<String, dynamic> toJson() => {
    "user_oneID": userOneId,
    "full_name": fullName,
    "status": status,
    "country_code": countryCode,
    "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "entry_time": entryTime,
    "country_name": countryName,
    "iso2": iso2,
    "email": email,
    "phone": phone,
    "username": List<dynamic>.from(username.map((x) => x)),
    "ORGANIZATIONS": organizations.toJson(),
    "record_id": recordId,
    "user_image": userImage,
  };
}

class Organizations {
  Organizations({
    required this.status,
    required this.dbData,
  });

  final String status;
  final List<dynamic> dbData;

  factory Organizations.fromJson(Map<String, dynamic> json) => Organizations(
    status: json["STATUS"],
    dbData: List<dynamic>.from(json["DB_DATA"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "STATUS": status,
    "DB_DATA": List<dynamic>.from(dbData.map((x) => x)),
  };
}

class User {
  User({
    required this.id,
    required this.orgId,
    required this.receiver,
    required this.appId,
    required this.storyId,
    required this.readStatus,
    required this.status,
    required this.typeBaseInfo,
    required this.entryTime,
  });

  final String id;
  final String orgId;
  final String receiver;
  final String appId;
  final String storyId;
  final int readStatus;
  final int status;
  final String typeBaseInfo;
  final DateTime entryTime;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    orgId: json["org_id"],
    receiver: json["receiver"],
    appId: json["app_id"],
    storyId: json["story_id"],
    readStatus: json["read_status"],
    status: json["status"],
    typeBaseInfo: json["type_base_info"],
    entryTime: DateTime.parse(json["entry_time"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "org_id": orgId,
    "receiver": receiver,
    "app_id": appId,
    "story_id": storyId,
    "read_status": readStatus,
    "status": status,
    "type_base_info": typeBaseInfo,
    "entry_time": entryTime.toIso8601String(),
  };
}
