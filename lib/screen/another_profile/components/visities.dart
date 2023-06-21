import 'package:flutter/material.dart';
import 'package:travel/screen/profile/controller/profile_cubit.dart';
import '../../../components/custom_text.dart';
import '../../../components/style/colors.dart';
import '../../../components/style/size.dart';

class Visites extends StatelessWidget {
  final ProfileCubit cubit;

  const Visites({Key? key, required this.cubit}) : super(key: key);

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
                Image.asset(cubit.visitedImg[index], fit: BoxFit.fill,width: width(context)*0.3),
                Container(
                  decoration:  BoxDecoration(
                      borderRadius:const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10)
                      ),
                      color: Colors.grey.withOpacity(0.8)
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: width(context)*0.03),
                      CustomText(text: cubit.visitedRate[index], color: Colors.white),
                      const Icon(Icons.star, color: Colors.yellow,size: 18),
                      SizedBox(width: width(context)*0.018),
                    ],
                  ),
                ),
                Positioned(
                    bottom:6,
                    left:20,

                    child: CustomText(text: cubit.visitedText[index], color: AppColors.whiteColor)),
              ],
            );


          },
          itemCount: cubit.visitedText.length
      );
  }
}