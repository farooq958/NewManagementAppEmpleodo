// To parse this JSON data, do
//
//     final inboxChatModel = inboxChatModelFromJson(jsonString);


import 'dart:convert';

InboxChatModel inboxChatModelFromJson(String str) => InboxChatModel.fromJson(json.decode(str));

String inboxChatModelToJson(InboxChatModel data) => json.encode(data.toJson());

class InboxChatModel {
  InboxChatModel({
    required this.status,
    required this.story,
    required this.userLinks,
    required this.messages,
  });

  final String status;
  final Story story;
  final UserLinks userLinks;
  final List<Message> messages;

  factory InboxChatModel.fromJson(Map<String, dynamic> json) => InboxChatModel(
    status: json["status"],
    story: Story.fromJson(json["story"]),
    userLinks: UserLinks.fromJson(json["user_links"]),
    messages: List<Message>.from(json["messages"].map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "story": story.toJson(),
    "user_links": userLinks.toJson(),
    "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
  };
}

class Message {
  Message({
    required this.id,
    required this.storyId,
    required this.oneId,
    required this.appId,
    required this.type,
    required this.message,
    required this.file,
    required this.entryTime,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String storyId;
  final String oneId;
  final String appId;
  final String type;
  final String message;
  final dynamic file;
  final DateTime entryTime;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["_id"],
    storyId: json["story_id"],
    oneId: json["one_id"],
    appId: json["app_id"],
    type: json["type"],
    message: json["message"],
    file: json["file"],
    entryTime: DateTime.parse(json["entry_time"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "story_id": storyId,
    "one_id": oneId,
    "app_id": appId,
    "type": type,
    "message": message,
    "file": file,
    "entry_time": entryTime.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class Story {
  Story({
    required this.id,
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
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
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
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Story.fromJson(Map<String, dynamic> json) => Story(
    id: json["_id"],
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
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
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
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class UserLinks {
  UserLinks({
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

  factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
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
