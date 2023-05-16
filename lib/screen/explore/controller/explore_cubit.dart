import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'explore_states.dart';

class ExploreCubit extends Cubit<ExploreStates> {
  ExploreCubit() : super(InitialExploreState());

  static ExploreCubit get(context) => BlocProvider.of(context);
}
