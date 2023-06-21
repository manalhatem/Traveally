import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/components/custom_text.dart';
import 'package:travel/components/my_navigate.dart';
import 'package:travel/screen/chat/components/custom_msg.dart';
import 'package:travel/screen/chat/controller/chat_cubit.dart';
import 'package:travel/screen/chat/controller/chat_states.dart';
import 'package:travel/screen/chat/model/message_model.dart';
import 'package:travel/shared/cache_helper.dart';
import '../../../components/style/images.dart';
import '../../../components/style/size.dart';
import 'chats.dart';
import 'custom_chat_textfield.dart';

class ChatDetails extends StatelessWidget {
  final ValueChanged valueChanged;
  final String? receiverName;
  final String? receiverImage;
  const ChatDetails({Key? key,  this.receiverName,  this.receiverImage, required this.valueChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ChatCubit()..getMessage(receiverId: "ttupR0WPvbQgF0uTqjZcbljPhUi2"),
        child: BlocBuilder<ChatCubit, ChatStates>(builder: (context, states) {
      final cubit = ChatCubit.get(context);
        return WillPopScope(
          onWillPop: () async {
            valueChanged.call("");
            Navigator.of(context).pop();
            return false;
          },
          child: SafeArea(
            child: Scaffold(
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width(context) * 0.04,
                      vertical: height(context) * 0.02),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 23,
                            backgroundImage: AssetImage(receiverImage ?? "assets/images/prof3.jpg"),
                          ),
                          SizedBox(width: width(context) * 0.04,),
                          CustomText(text:receiverName ?? "نهال",
                              color: Colors.black,
                              fontSize: AppFonts.t3,
                              fontWeight: FontWeight.w500),
                          const Spacer(),
                          IconButton(onPressed: () {
                            navigatorPop(context);
                          },
                              icon: const Icon(
                                Icons.arrow_forward_outlined, size: 30,))
                        ],
                      ),
                      const Divider(),
                      // Expanded(
                      //   child: ListView.builder(
                      //     reverse: true,
                      //     physics:const BouncingScrollPhysics(),
                      //       controller: cubit.listScrollController,
                      //       itemCount: messagesList.length,
                      //       itemBuilder: (context, index) {
                      //         return CustomMessage(isSender:
                      //         messagesList[index].id==CacheHelper.getData(key:"email")? true:false,
                      //             msg:messagesList[index]);
                      //       }),
                      // ),
                      const Expanded(child: Chats(receiverId: "ttupR0WPvbQgF0uTqjZcbljPhUi2")),
                      ChatCustomTextField(
                        suffix: GestureDetector(
                            onTap: ()async{
                              // cubit.addMessage();
                              // cubit.messageController.clear();
                              // cubit.listScrollController.animateTo(
                              //     0.0,
                              //     duration: const Duration(milliseconds: 100),
                              //     curve: Curves.easeOut
                              // );
                                if (cubit.messageController.text.isNotEmpty) {
                                  await cubit.sendMsg(
                                      receiverId:"ttupR0WPvbQgF0uTqjZcbljPhUi2",
                                      senderId: CacheHelper.getData(key: "id".toString(),),
                                      dateTime: Timestamp.now(),
                                      context: context,
                                   );
                                }

                            },
                            child: Image.asset(AppImages.send, scale: 3.2,)),
                        type: TextInputType.text,
                        controller:cubit.messageController,
                      ),
                    ],
                  ),
                )
            ),
          ),
        );
        }));
  }
}


//StreamBuilder<QuerySnapshot>(
// stream: cubit.messages.orderBy('createdAt', descending: true).snapshots(),
// builder: (context, snapShot){
// if(snapShot.hasData){
// List<MessageModel> messagesList = [];
// for (int i = 0; i < snapShot.data!.docs.length; i++) {
// messagesList.add(MessageModel.fromJson(snapShot.data!.docs[i]));
// }
// //print(snapShot.data!.docs[0]["message"]);
// return WillPopScope(
// onWillPop: () async {
// valueChanged.call("");
// Navigator.of(context).pop();
// return false;
// },
// child: SafeArea(
// child: Scaffold(
// body: Padding(
// padding: EdgeInsets.symmetric(horizontal: width(context) * 0.04,
// vertical: height(context) * 0.02),
// child: Column(
// children: [
// Row(
// children: [
// CircleAvatar(
// radius: 23,
// backgroundImage: AssetImage(receiverImage ?? "assets/images/prof3.jpg"),
// ),
// SizedBox(width: width(context) * 0.04,),
// CustomText(text:receiverName ?? "نهال",
// color: Colors.black,
// fontSize: AppFonts.t3,
// fontWeight: FontWeight.w500),
// const Spacer(),
// IconButton(onPressed: () {
// navigatorPop(context);
// },
// icon: const Icon(
// Icons.arrow_forward_outlined, size: 30,))
// ],
// ),
// const Divider(),
// Expanded(
// child: ListView.builder(
// reverse: true,
// physics:const BouncingScrollPhysics(),
// controller: cubit.listScrollController,
// itemCount: messagesList.length,
// itemBuilder: (context, index) {
// return CustomMessage(isSender:
// messagesList[index].id==CacheHelper.getData(key:"email")? true:false,
// msg:messagesList[index]);
// }),
// ),
// ChatCustomTextField(
// suffix: GestureDetector(
// onTap: (){
// cubit.addMessage();
// cubit.messageController.clear();
// cubit.listScrollController.animateTo(
// 0.0,
// duration: const Duration(milliseconds: 100),
// curve: Curves.easeOut
// );
// },
// child: Image.asset(AppImages.send, scale: 3.2,)),
// type: TextInputType.text,
// controller:cubit.messageController,
// ),
// ],
// ),
// )
// ),
// ),
// );
// }
// else{
// return Scaffold(body: Center(child: Image.asset(AppImages.loading)));
// }
// });