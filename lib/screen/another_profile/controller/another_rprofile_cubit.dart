import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../chat/model/userModel.dart';
import 'another_profile_states.dart';
import 'package:flutter/material.dart';

class AnotherProfileCubit extends Cubit<AnotherProfileStates> {
  AnotherProfileCubit() : super(InitialProfileState());

  static AnotherProfileCubit get(context) => BlocProvider.of(context);

  //posts
  List<String> postsImage=[
    "assets/images/image 32.png",
    "assets/images/image 33.png",
    "assets/images/image 34.png",
    "assets/images/image 25.png",
    "assets/images/image 31.png",

  ];

  /// ***************************************  create le collection ********************************************

  void createUser({required UsersModel? receiver, required UsersModel? sender}) async {
    debugPrint(">>>>>>>>>>>>>>>>>>> ${sender.toString()} <<<<<<<<<<<<<<<<");
    debugPrint(">>>>>>>>>>>>>>> User Create <<<<<<<<<<<<<<<<<<<");
    await FirebaseFirestore.instance
        .collection('users')
        .doc("userId_${sender!.id}")
        .collection('chats')
        .doc('receiver_id_${receiver!.id}')
        .collection('messages')
        .doc('message')
        .set({});

    /// >>>>>>>>>>>>>>>>>> bmla eldata bta3t sender <<<<<<<<<<<<<<<<<
    await FirebaseFirestore.instance
        .collection("users")
        .doc("userId_${sender.id}")
        .set({
      'chattingWith': sender.chattingWith,
      'email': sender.email,
      'id': "userId_${sender.id}",
      'lastSeen': sender.lastSeen,
      'name': sender.name,
      'photoUrl': sender.photoUrl,
      'status': sender.status,
      'isTyping': sender.chattingWith,
      'unReadingCount': sender.unReadingCount,
    });

    /// bmla daata el reciver
    await FirebaseFirestore.instance
        .collection("users")
        .doc("userId_${sender.id}")
        .collection('chats')
        .doc('receiver_id_${receiver.id}')
        .get()
        .then((value) async {
      debugPrint('value.data()userId >>>>>>>>>>>>>>>>>>>> ${value.data()}');
      if (value.data() == null) {
        debugPrint(
            'receiver.id.toString() >>>>>>>>>>>>>>>>>>>>> ${receiver.id}');
        await FirebaseFirestore.instance
            .collection("users")
            .doc("userId_${sender.id}")
            .collection('chats')
            .doc('receiver_id_${receiver.id}')
            .set({
          'lastSeen': receiver.lastSeen,
          'name': receiver.name,
          'photoUrl': receiver.photoUrl,
          'status': receiver.status,
          'typingTo': receiver.typingTo,
          'userId': receiver.id,
          // 'unReadingCount' : receiver.unReadingCount,
          // 'status' : receiver.status,
          // 'isTyping' : receiver.typingTo,
        });
      }
    });

    // await FirebaseFirestore.instance.collection('users').doc("userId_" +userId).collection('chats').doc('message');
  }




}
