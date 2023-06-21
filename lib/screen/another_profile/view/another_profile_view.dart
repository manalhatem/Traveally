

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/components/custom_text.dart';
import 'package:travel/components/my_navigate.dart';
import 'package:travel/components/style/images.dart';
import 'package:travel/utilities/routes.dart';

import '../../../components/custom_btn.dart';
import '../../../components/style/colors.dart';
import '../../../components/style/size.dart';
import '../../../shared/cache_helper.dart';
import '../../chat/components/chat_details.dart';
import '../../chat/model/userModel.dart';
import '../components/acustom_profile_img.dart';
import '../components/posts.dart';
import '../controller/another_profile_states.dart';
import '../controller/another_rprofile_cubit.dart';

class AnotherProfileScreen extends StatelessWidget {
 final String img;
 final String backGround;
 final String numTrip;
 final String name;


  const AnotherProfileScreen({Key? key, required this.img, required this.backGround, required this.numTrip, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AnotherProfileCubit(),
        child: BlocBuilder<AnotherProfileCubit, AnotherProfileStates>(
            builder: (context, states) {
          final cubit = AnotherProfileCubit.get(context);
          return SafeArea(child: Scaffold(
            body: Padding(
              padding:EdgeInsets.symmetric(horizontal: width(context)*0.02,vertical: width(context)*0.02 ),
              child: Column(
                children: [
                  SizedBox(height: height(context)*0.02,),
                   CustomProfileImg(backGroundImg: backGround, name:  numTrip, profileImg:img),
                  Row(children: [
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Padding(
                        padding:  EdgeInsetsDirectional.only(start: width(context)*0.12),
                        child: CustomText(text: name, fontSize: AppFonts.t2, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(end: width(context)*0.03, bottom: width(context)*0.02),
                          child:  CustomBtn(colored: true, text: 'ابدأ المحادثه', textColor: AppColors.whiteColor,
                            onTap: (){
                              ///bymla byanat elsender
                              ///ttupR0WPvbQgF0uTqjZcbljPhUi2
                              ///nour@gmail.com
                              cubit.createUser(
                                  receiver: UsersModel(
                                      id: "ttupR0WPvbQgF0uTqjZcbljPhUi2",
                                      email: "nour@gmail.com",
                                      lastSeen: "null",
                                      status: "online",
                                      typingTo: 0,
                                      unReadingCount: 0,
                                      photoUrl: img,
                                      name: name,
                                      chattingWith: CacheHelper.getData(key:"id").toString()),
                                  sender: UsersModel(
                                      id:  CacheHelper.getData(key:"id"),  /// int
                                      name:"nooor",
                                      photoUrl:AppImages.profile,
                                      chattingWith: "ttupR0WPvbQgF0uTqjZcbljPhUi2",
                                      email: "nour@gmail.com",
                                      lastSeen: "null",
                                      status: "online",
                                      typingTo: 0,
                                      unReadingCount: 0
                                  ));

                              ///bymla byanat elsender
                              cubit.createUser(
                                  sender:  UsersModel(
                                  id: "ttupR0WPvbQgF0uTqjZcbljPhUi2",
                                  email: "nour@gmail.com",
                                  lastSeen: "null",
                                  status: "online",
                                  typingTo: 0,
                                  unReadingCount: 0,
                                  photoUrl: img,
                                  name: name,
                                  chattingWith: CacheHelper.getData(key:"id").toString()),
                                  receiver:  UsersModel(
                                      id:  CacheHelper.getData(key:"id"),  /// int
                                      name:"nooor",
                                      photoUrl:AppImages.profile,
                                      chattingWith: "ttupR0WPvbQgF0uTqjZcbljPhUi2",
                                      email: "nour@gmail.com",
                                      lastSeen: "null",
                                      status: "online",
                                      typingTo: 0,
                                      unReadingCount: 0
                                  ));
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return ChatDetails(
                                    receiverImage: img,
                                    receiverName: name, valueChanged: (value) {},);
                              }));
                            },),
                        )),
                  ],),

                const Divider(color: AppColors.mainColor,thickness: 1.5,),
                SizedBox(height: height(context)*0.012),
                Expanded(child: PostsImage(cubit: cubit,)),
                //  ProfileTabBarScreen(cubit: cubit),
                ],
              ),
            ),
          ));
        }));
  }
}
