import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/profile_cubit.dart';
import '../controller/profile_states.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProfileCubit(),
        child: BlocBuilder<ProfileCubit, ProfileStates>(
            builder: (context, states) {
          final cubit = ProfileCubit.get(context);
          return SafeArea(child: Scaffold());
        }));
  }
}
