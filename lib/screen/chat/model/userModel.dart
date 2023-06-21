
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersModel {
  String? chattingWith;
  String? email;
  String? id;
  int? userId;
  String? lastSeen;
  String? name;
  String? photoUrl;
  String? status ;
  int? unReadingCount;
  int? typingTo;
  UsersModel(
      {
        this.chattingWith,
        this.email,
        this.id,
        this.lastSeen,
        this.name,
        this.photoUrl,
        this.status,
        this.typingTo,
        this.unReadingCount,
      });
  UsersModel.fromJson(Map<String,dynamic>json){
    chattingWith = json['chattingWith'];
    email = json['email'];
    id = json['id'];
    lastSeen = json['lastSeen'];
    name = json['name'];
    photoUrl = json['photoUrl'];
    status = json['status'];
    typingTo = json['typingTo'];
    unReadingCount = json['unReadingCount'];

  }
  Map<String,dynamic> toMap(){
    return {
      'chattingWith' : chattingWith,
      'email' : email,
      'id' : id,
      'lastSeen' : lastSeen,
      'name' : name,
      'photoUrl' : photoUrl,
      'unReadingCount' : unReadingCount,
      'status' : status,
      'typingTo' : typingTo,
    };
  }
}

class ReceiverModelData {
  List<ReceiverModel>? users;

  ReceiverModelData({ this.users});

  ReceiverModelData.fromJson(Map<dynamic, dynamic> json) {
    if (json['users'] != null) {
      users = <ReceiverModel>[];
      json['users'].forEach((v) {
        users!.add( ReceiverModel.fromJson(v));
      });
    }
  }



}
class ReceiverModel {
  String? name;
  String? photoUrl;
  int? typingTo;
  String? status;
  String? content;
  String? date;
  String? allDate;
  int? userId;
  String? lastMessage;
  dynamic lastSeen;
  Timestamp? lastMessageTime;

  ReceiverModel({
    required this.lastSeen,
    required this.name,
    required this.photoUrl,
    required this.content,
    required this.typingTo,
    required this.date,
    required this.allDate,
    required this.status,
    required this.userId,
    required this.lastMessageTime,
    required this.lastMessage,
  });

  ReceiverModel.fromJson(Map<dynamic, dynamic>json){
    lastSeen = json['lastSeen'];
    content = json['content'];
    date = json['date'];
    allDate = json['allDate'];
    name = json['name'];
    photoUrl = json['photoUrl'];
    typingTo = json['typingTo'];
    status = json['status'];
    userId = json['userId'];
    lastMessageTime = json['updated_at'];

  }

  Map<String, dynamic> toMap() {
    return {
      'lastSeen': lastSeen,
      'name': name,
      'photoUrl': photoUrl,
      'allDate': allDate,
      'date': date,
      'content': content,
      'typingTo': typingTo,
      'status': status,
      'userId': userId,
      'updated_at': lastMessageTime,
    };
  }
}
