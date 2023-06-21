import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/components/style/images.dart';
import 'package:travel/components/style/size.dart';
import 'package:travel/screen/chat/controller/chat_cubit.dart';
import 'package:travel/screen/chat/controller/chat_states.dart';
import 'package:travel/utilities/routes.dart';

import '../../../components/my_navigate.dart';
import '../../../generated/locale_keys.g.dart';
import 'chat_details.dart';
import 'empty_chat.dart';
import 'item_chat.dart';
class PrivateChat extends StatelessWidget {
  const PrivateChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatStates>(builder: (context, state){
      final cubit = ChatCubit.get(context);
      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: width(context) * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return  Center(
                        child: Image.asset(AppImages.loading),
                      );
                    } else {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                              'errrrrrrrror >>>>>>>>>>>>>>> ${snapshot.error}'),
                        );
                      } else {
                        return state is GetUsersLoading
                            ?  Image.asset(AppImages.loading)
                            :cubit.users.isEmpty
                            ?  Expanded(child: ChatEmpty(img: AppImages.chatEmpty, text:LocaleKeys.NoChat.tr(),))
                            : Expanded(
                            child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                padding: EdgeInsetsDirectional.only(
                                    top: height(context) * 0.01),
                                shrinkWrap: true,
                                itemBuilder: (context, index) => ItemChat(
                                    onTapChatDetails: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context){
                                        return  ChatDetails(valueChanged: (value) { cubit.getUsers(isBack: false); },);
                                      }));
                                    },
                                    image: cubit.users[index].photoUrl.toString(),
                                    message: cubit.lastMsgList[index],
                                    name: cubit.users[index].name.toString(),
                                    numOfMessages: cubit.unReadList[index].toString(),
                                    date: cubit.lastTimeList[index]),
                                separatorBuilder: (context, index) =>
                                const Divider(),
                                itemCount: cubit.users.length));
                      }
                    }
                  },
                ),
                SizedBox(height: height(context) * 0.01)
              ],
            ),
          ),
        ),
      );

    },
        listener: (context, state){});


    //   ListView.separated(itemBuilder: (context, index){
    //   return ItemChat(image: AppImages.profile, name: 'منال حاتم', message: 'اهلا', numOfMessages: '3', date:"20:10",
    //     onTapChatDetails: () {
    //       navigateTo(context, AppRoutes.chatDetails);
    //     } ,);
    // }, itemCount: 10, separatorBuilder: (BuildContext context, int index) {
    //   return SizedBox(height: height(context)*0.02,);
    // },);
  }
}
