import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_states.dart';
import 'package:flutter/material.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(InitialProfileState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  //posts
  List<String> postsImage=[
    "assets/images/image 25.png",
    "assets/images/image 31.png",
    "assets/images/image 32.png",
    "assets/images/image 33.png",
    "assets/images/image 34.png"
  ];

  //Badges
  List<String> badgesImage=[
    "assets/images/Vectyor.png",
    "assets/images/fire.png",
    "assets/images/grommet-icons_swim.png",
    "assets/images/mountain.png",
  ];
  List<String> badgesText=[
    "Badges Earned",
    "Travel Streak",
    "Swimmer of the week",
    "Trekker of the week",
  ];
  List<String> badgesNum=[
    "7",
    "15",
    "2",
    "1",
  ];
  List<Color> badgesCol=[
    const Color(0xffFFE7E7),
    const Color(0xffFBF3CA),
    const Color(0xffE6EEFE),
    const Color(0xffFFE7FE),
  ];

  //visited
List<String> visitedImg=[
  "assets/images/Group 3188.png",
  "assets/images/Group 319.png",
  "assets/images/Group 320.png",
  "assets/images/Group 321.png"
];
  List<String> visitedText=[
    "Kerala",
    "Abu Dabi",
    "Goa🌴",
    "Hawaii"
  ];
  List<String> visitedRate=[
    "4.8",
    "4.9",
    "4.9",
    "4,6"
  ];

  //visited
  List<String> destinationImg=[
    "assets/images/Group 31800.png",
    "assets/images/Group 31900.png",
    "assets/images/Group 32000.png",
    "assets/images/Group 32100.png"
  ];
  List<String> destinationText=[
    "Han River",
    "Charminar",
    "New York",
    "Singapore"
  ];



}
