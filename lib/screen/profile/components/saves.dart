import 'package:flutter/material.dart';
import 'package:travel/screen/profile/controller/profile_cubit.dart';
import '../../../components/custom_text.dart';
import '../../../components/style/size.dart';

class Saves extends StatelessWidget {
  final ProfileCubit cubit;

  const Saves({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      GridView.builder(
        physics:const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
              childAspectRatio: .9
          ),
          itemBuilder: (context, index){
            return Container(
              padding: EdgeInsetsDirectional.only(top: width(context)*0.025),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: cubit.badgesCol[index]
              ),
              child: Column(
                children: [
                  Image.asset(cubit.badgesImage[index], scale: 2.5,),
                  SizedBox(height: height(context)*0.01,),
                  CustomText(text: cubit.badgesText[index], fontSize: 8, fontFamily: "Poppins"),
                  CustomText(text: cubit.badgesNum[index], fontSize: AppFonts.t7, fontFamily: "Poppins", fontWeight: FontWeight.w500),
                ],
              ),
            );
          },
          itemCount: cubit.badgesNum.length
      );
  }
}