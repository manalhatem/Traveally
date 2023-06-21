import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/components/custom_text.dart';
import 'package:travel/components/style/colors.dart';
import 'package:travel/components/style/images.dart';
import 'package:travel/components/style/size.dart';

import '../components/tab_bar.dart';
import '../controller/profile_cubit.dart';
import '../controller/profile_states.dart';
import '../components/custom_profile_img.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProfileCubit(),
        child: BlocBuilder<ProfileCubit, ProfileStates>(
            builder: (context, states) {
          final cubit = ProfileCubit.get(context);
          return SafeArea(child: Scaffold(
            body: Padding(
              padding:EdgeInsets.symmetric(horizontal: width(context)*0.04,vertical: width(context)*0.02 ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.settings_outlined,color: Colors.black,size: 28,),
                      const Spacer(),
                      CustomText(text: "نور حاتم",color: AppColors.mainColor, fontSize: AppFonts.t3,fontFamily: "Poppins", fontWeight: FontWeight.w600),
                    ],
                  ),
                  SizedBox(height: height(context)*0.02,),
                  const CustomProfileImg(backGroundImg: "assets/images/background.png", name:  "120 رحلة", profileImg: AppImages.profile,),
                  ProfileTabBarScreen(cubit: cubit),
                ],
              ),
            ),
          ));
        }));
  }
}
