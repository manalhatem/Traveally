import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/style/colors.dart';
import '../../../components/style/images.dart';
import '../../../components/style/size.dart';
import '../controller/onboarding_cubit.dart';
import '../controller/onboarding_states.dart';
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController? _controller;
  @override
  void initState() {
    _controller=PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(context)=> OnBoardingCubit(),
        child: BlocBuilder<OnBoardingCubit, OnBoardingStates>(
          builder: (context, states){
            final  cubit = OnBoardingCubit.get(context);
            return SafeArea(
                child:Scaffold(
                  body: Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          physics: const BouncingScrollPhysics(),
                          controller: _controller,
                          onPageChanged: (int index){
                            cubit.changeIndex(index);
                          },
                          itemBuilder: (context,index){
                            return Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(cubit.images[index]),
                                  fit: BoxFit.fill
                                ),
                              ),
                              child: Padding(
                                padding:  EdgeInsetsDirectional.only(
                                    start: width(context)*0.04,end:width(context)*0.01,bottom: width(context)*0.1),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                       children: [
                                         SizedBox(
                                           width:width(context)*0.5,
                                           child: DefaultTextStyle(
                                             style:  TextStyle(
                                               fontSize: AppFonts.h1,
                                               fontFamily: 'Bobbers',
                                               color: Colors.white
                                             ),
                                             child: AnimatedTextKit(
                                               animatedTexts: [
                                                 TypewriterAnimatedText(cubit.titles[index]),
                                               ],
                                               totalRepeatCount: 5,
                                               pause: const Duration(seconds: 2),
                                               onTap: () {
                                                 print(cubit.titles[index]);

                                               },
                                             ),
                                           ),
                                         ),
                                         const Spacer(),
                                         GestureDetector(
                                             onTap: (){
                                               _controller!.nextPage(duration: const Duration(milliseconds: 500),
                                                   curve: Curves.easeInOut);
                                             },
                                             child: context.locale.languageCode=="ar"?
                                             cubit.currentIndex==2?
                                             Image.asset(AppImages.checkIcon,scale: 5):
                                             Transform.rotate(angle: pi,
                                                 child: Image.asset(
                                                     AppImages.arrowIcon,scale: 5)):
                                                Image.asset(
                                                    cubit.currentIndex==2?
                                                    AppImages.checkIcon:
                                                    AppImages.arrowIcon,scale: 5)
                            ),
                                       ],
                                    ),
                                    SizedBox(height: height(context)*0.02),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate( cubit.images.length, (index) {
                                        return Container(
                                          width: cubit.currentIndex==index? width(context)*0.11:width(context)*0.0223,
                                          height: width(context)*0.0223,
                                          margin: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: cubit.currentIndex==index? AppColors.mainColor:Colors.white,
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },itemCount: cubit.images.length,),
                      ),




                    ],
                  ),
                )
            );
          },
        )
    );


  }

}
