import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/custom_row.dart';
import '../../../components/custom_text.dart';
import '../../../components/my_navigate.dart';
import '../../../components/style/colors.dart';
import '../../../components/style/images.dart';
import '../../../components/style/size.dart';
import '../../../utilities/routes.dart';
import '../components/chat_tab_bar.dart';
import '../components/empty_chat.dart';
import '../components/item_chat.dart';
import '../controller/chat_cubit.dart';
import '../controller/chat_states.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ChatCubit(),
        child: BlocBuilder<ChatCubit, ChatStates>(builder: (context, states) {
          final cubit = ChatCubit.get(context);
          return SafeArea(
              child: Scaffold(
                body:
                SingleChildScrollView(
                  child: Column(children: [
                    const CustomMainRow(),
                    const Divider(),
                    SizedBox(height: height(context)*0.01),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: width(context)*0.05),
                      child: const SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: ChatTabBarScreen()),
                    ),



                  ]),
                ),
              ));
        }));
  }
}


//=======

//===
