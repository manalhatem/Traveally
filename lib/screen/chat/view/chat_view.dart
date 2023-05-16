import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          return SafeArea(child: Scaffold());
        }));
  }
}
