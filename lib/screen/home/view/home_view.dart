import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/home_cubit.dart';
import '../controller/home_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocBuilder<HomeCubit, HomeStates>(builder: (context, states) {
          final cubit = HomeCubit.get(context);
          return SafeArea(child: Scaffold());
        }));
  }
}
