import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/components/style/images.dart';
import '../../../components/custom_text.dart';
import '../../../components/style/colors.dart';
import '../../../components/style/size.dart';
import '../components/list_item.dart';
import '../controller/home_cubit.dart';
import '../controller/home_states.dart';
import '../model/home_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocBuilder<HomeCubit, HomeStates>(builder: (context, states) {
          final cubit = HomeCubit.get(context);
          return SafeArea(child: Scaffold(
            body: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(right: width(context)* 0.05,left: width(context)* 0.05,
                      top:width(context)* 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomText(
                              text: 'ally',
                              color: AppColors.mainColor,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              fontSize: AppFonts.h1,
                              fontStyle: FontStyle.italic),
                          CustomText(
                              text: 'Trave',
                              color: Colors.black,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              fontSize: AppFonts.h1,
                              fontStyle: FontStyle.italic),
                                          ],
                      ),
                      const CircleAvatar(
                        radius: 28,
                        backgroundImage:AssetImage(AppImages.profile),
                      )
                    ],
                  ),
                ),
                const Divider(),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                      itemCount: homeData.length,
                      itemBuilder: (context, index){
                    return ListItem(
                      name: homeData[index].name!,
                      img: homeData[index].img!,
                      profileImg: homeData[index].profileImg!,
                      location: homeData[index].location!,
                      isFav: homeData[index].isFav!,
                      numFav: homeData[index].numFav!,
                      numComments: homeData[index].numComments!,
                      isSave: homeData[index].isSave!,
                      desc: homeData[index].desc!,
                      controller: cubit.commentController,
                    );
                  }),
                ),
              ],
            ),
          ));
        }));
  }
}
