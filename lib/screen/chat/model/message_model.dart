import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel{
   String? message;
   String? id;
   Timestamp? createdAt;

  MessageModel({this.message, this.id, this.createdAt});

  MessageModel.fromJson(jsonData){
    message= jsonData["message"];
    id= jsonData["id"];
    createdAt= jsonData["createdAt"];
  }
}