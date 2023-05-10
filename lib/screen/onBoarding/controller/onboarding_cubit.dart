import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../components/style/images.dart';
import '../../../generated/locale_keys.g.dart';
import 'onboarding_states.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates>{
  OnBoardingCubit(): super(OnBoardingInitialState());

  static OnBoardingCubit get(context)=> BlocProvider.of(context);

  int currentIndex=0;

  void changeIndex(index){
    currentIndex=index;
    emit(OnBoardingChangeState());
  }

  List<String> images=[
    AppImages.onboardOne,
    AppImages.onboardTwo,
    AppImages.onboardThree
  ];
  List<String> titles=[
    LocaleKeys.OnBoarding1.tr(),
    LocaleKeys.OnBoarding2.tr(),
    LocaleKeys.OnBoarding3.tr()
  ];


}