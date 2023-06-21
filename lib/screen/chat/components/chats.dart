

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/components/style/images.dart';
import 'package:travel/screen/chat/controller/chat_cubit.dart';
import 'package:travel/screen/chat/controller/chat_states.dart';

import '../../../components/style/size.dart';
import '../../../shared/cache_helper.dart';
import 'custom_msg.dart';

class Chats extends StatelessWidget {
  final String receiverId;

  const Chats({Key? key, required this.receiverId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return FutureBuilder(builder: (context, snapshot) {
            return state is ChatLoadingMsg
                ?  Image.asset(AppImages.loading)
                : StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc('userId_${CacheHelper.getData(key: "id")}')
                    .collection('chats')
                    .doc('receiver_id_$receiverId')
                    .collection('messages')
                    .orderBy('updated_at', descending: true)
                    .snapshots(),
                builder: (ctx, snapshot) {
                  if (!snapshot.hasData || snapshot.connectionState == ConnectionState.none) {
                    return  Image.asset(AppImages.loading);
                  } else {
                    if (snapshot.hasError) {
                      return Center(
                          child: Text(
                              'errrrrrrrror >>>>>>>>>>>>> ${snapshot.error}'));
                    } else {
                      final docs = snapshot.data!.docs;

                      return state is ChatLoadingMsg
                          ? Image.asset(AppImages.loading)
                          : ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                              horizontal: width(context) * 0.01),
                          itemCount: snapshot.data!.docs.length,
                          shrinkWrap: true,
                          reverse: true,
                          itemBuilder: (context, index) {
                            return
                              CustomMessage(isSender:
                              docs[index]['sender_id']==CacheHelper.getData(key:"id")? true:false,
                                  msg: docs[index]['message'],
                              time:docs[index]['updated_at'] ,);
                              // MessageChat(
                              //   isMe: CacheHelper.getData(
                              //       key: AppCached.userId)
                              //       .toString() ==
                              //       docs[index]['sender_id']
                              //       ? true
                              //       : false,
                              //   msg: docs[index]['message'],
                              //   time: docs[index]['updated_at'],
                              //   msgType: docs[index]['type'],
                              //   image: docs[index]['receiver_id'] !=
                              //       docs[index]['sender_id']
                              //       ? docs[index]['sender_image']
                              //       : docs[index]['receiver_image']);
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(
                                  height: height(context) * 0.005));
                    }
                  }
                });
          });
        });
  }
}
