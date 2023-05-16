import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/explore_cubit.dart';
import '../controller/explore_states.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ExploreCubit(),
        child: BlocBuilder<ExploreCubit, ExploreStates>(
            builder: (context, states) {
          final cubit = ExploreCubit.get(context);
          return SafeArea(child: Scaffold());
        }));
  }
}
