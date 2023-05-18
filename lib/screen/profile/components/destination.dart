import 'package:flutter/material.dart';
import 'package:travel/screen/profile/controller/profile_cubit.dart';
import '../../../components/custom_text.dart';
import '../../../components/style/colors.dart';
import '../../../components/style/size.dart';

class Destination extends StatelessWidget {
  final ProfileCubit cubit;

  const Destination({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      GridView.builder(
          physics:const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
              childAspectRatio: .8
          ),
          itemBuilder: (context, index){
            return Stack(
              children: [
                Image.asset(cubit.destinationImg[index], fit: BoxFit.fill,width: width(context)*0.3),
                Positioned(
                    bottom:6,
                    left:20,

                    child: CustomText(text: cubit.destinationText[index], color: AppColors.whiteColor)),
              ],
            );;
          },
          itemCount: cubit.destinationText.length
      );
  }
}