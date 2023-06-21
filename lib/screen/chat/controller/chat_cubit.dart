import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/cache_helper.dart';
import '../model/message_model.dart';
import '../model/userModel.dart';
import 'chat_states.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(InitialChatState());

  static ChatCubit get(context) => BlocProvider.of(context);
  CollectionReference messages =
      FirebaseFirestore.instance.collection("messages");
  TextEditingController messageController = TextEditingController();
  ScrollController listScrollController =  ScrollController();

  Future<void>? addMessage() {
    if (messageController.text.isNotEmpty) {
      return messages.add({
        'message': messageController.text,
        'createdAt': DateTime.now(),
        'id': CacheHelper.getData(key:"email")
      }).then((value) {
        print("message add");
      });
    }
  }
  //==============New===========

  List<ReceiverModel> users = [];
  List<String> lastMsgList = [];
  List<String> lastTimeList = [];
  int unRead = 0;
  List<int> unReadList = [];
  String? lastTime;
  String? lastDate;
  Future<void> getUsers({required bool isBack}) async {
    isBack==false? emit(GetUsersLoading()):null;
    print("000000");

    await FirebaseFirestore.instance.collection('users').doc('userId_${CacheHelper.getData(key:"id",)}').
    collection('chats').get().then((value) async {
      isBack==false? emit(GetUsersLoading()):null;
      print("1111111111111111");
      users.clear();
      lastTimeList.clear();
      lastMsgList.clear();
      unReadList.clear();
      for(int i =0 ; i< value.docs.length ; i++) {
        isBack==false? emit(GetUsersLoading()):null;
        final QuerySnapshot testLength = await FirebaseFirestore.instance.collection('users').doc('userId_${CacheHelper.getData(key:"id")}').
        collection('chats').doc("receiver_id_${value.docs[i]["userId"]}").collection("messages").get();
        print(testLength.docs.length.toString() + " messages length");
        if(testLength.docs.length>1){
          print("*-*-*-*-*--*-*-*-*-*-*-*-*-* hadedy y gamddddddddddddddddddddddddddddddddddd *-*-*-*-*--*-*-*-*-*-*-*-*-*");
          await FirebaseFirestore.instance.collection('users').doc('userId_${CacheHelper.getData(key: "id")}').collection('chats').doc("receiver_id_${value.docs[i]["userId"]}")
              .collection("messages").get().then((message) async {
            unRead = 0;
            message.docs.forEach((msg)  {
              // print(msg.data()[""])
              if (msg.data()["read"] == false &&
                  msg.data()["receiver_id"] == CacheHelper.getData(key: "id").toString()) {
                unRead++;
              }
            });
            unReadList.add(unRead);
            debugPrint("UnRead List >>>>>>>>>> $unReadList");
          });
          lastMsgList.add(value.docs[i].data()["last_message"]);
          DateTime? timm = value.docs[i].data()["last_message_time"].toDate();
          lastTime = DateFormat('hh:mm a').format(timm!);
          lastTimeList.add(DateFormat('hh:mm a').format(timm));
          lastDate = DateFormat.yMd().format(timm);
          users.add(ReceiverModel.fromJson(value.docs[i].data()));
          // emit(GetUsersSuccess());
          isBack==false? emit(GetUsersSuccess()):null;

        }else{
          print("emshi yla 8or");
        }
      };

      emit(GetUsersSuccess());
    } );
  }

  sendMsg(
      {required String? receiverId,
        required String? senderId,
        required Timestamp? dateTime,
        required BuildContext? context}) async {
    FocusScope.of(context!).unfocus();
    debugPrint("message firebase ");
    print( messageController.text);
    debugPrint(dateTime.toString());
    debugPrint(receiverId);
    debugPrint(senderId);

    FirebaseFirestore.instance
        .collection('users')
        .doc('userId_$receiverId')
        .collection('chats')
        .doc('receiver_id_$senderId')
        .collection('messages')
        .add({
      'message':  messageController.text,
      'updated_at': dateTime,
      'sender_id': senderId,
      'receiver_id': receiverId,
      'read': false
    });
    //
    // FirebaseFirestore.instance
    //     .collection('users')
    //     .doc('userId_$senderId')
    //     .collection('chats')
    //     .doc('receiver_id_$receiverId')
    //     .collection('messages')
    //     .add({
    //   'message': messageController.text,
    //   'updated_at': dateTime,
    //   'sender_id': senderId,
    //   'receiver_id': receiverId,
    //   'read': false
    // });

    FirebaseFirestore.instance
        .collection('users')
        .doc('userId_$senderId')
        .collection('chats')
        .doc('receiver_id_$receiverId')
        .update({
      'last_message': messageController.text,
      'last_message_time': dateTime
    });

    FirebaseFirestore.instance
        .collection('users')
        .doc('userId_$receiverId')
        .collection('chats')
        .doc('receiver_id_$senderId')
        .update({
      'last_message':messageController.text,
      'last_message_time': dateTime
    });
    messageController.clear();
  }


  void getMessage({required String receiverId}) async {
    emit(ChatLoadingMsg());
    FirebaseFirestore.instance
        .collection('users')
        .doc('userId_${CacheHelper.getData(key: "id")}')
        .collection('chats')
        .doc('receiver_id_$receiverId')
        .collection('messages')
        .orderBy('updated_at', descending: true)
        .snapshots();

    /// -******************************************** 3shan a3ml elread b false  **********************************************************-

    await FirebaseFirestore.instance
        .collection('users')
        .doc('userId_${CacheHelper.getData(key: "id")}')
        .collection('chats')
        .doc('receiver_id_$receiverId')
        .collection('messages')
        .get()
        .then((message) async {
      debugPrint("Sssssssssssssssssssssssss >>>>>>>>>>>>>>>> ${message.docs}");
      message.docs.forEach((msg) async {
        debugPrint(msg.data()["read"].toString());
        if (msg.data()["read"] == false &&
            msg.data()["receiver_id"] ==
                CacheHelper.getData(key: "id").toString()) {
          debugPrint("\************************************************/");

          await FirebaseFirestore.instance
              .collection('users')
              .doc('userId_${CacheHelper.getData(key:"id")}')
              .collection('chats')
              .doc('receiver_id_$receiverId')
              .collection('messages')
              .doc(msg.id)
              .update({'read': true});
        }
      });
    });
    emit(ChatSuccessMsg());
  }
}
