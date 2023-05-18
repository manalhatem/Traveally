

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:travel/screen/profile/components/destination.dart';
import 'package:travel/screen/profile/components/posts.dart';
import 'package:travel/screen/profile/components/saves.dart';
import 'package:travel/screen/profile/components/visities.dart';
import 'package:travel/screen/profile/controller/profile_cubit.dart';
import '../../../components/style/colors.dart';
import '../../../components/style/size.dart';
import '../../../generated/locale_keys.g.dart';

class CourseDetailsScreen extends StatefulWidget {
  final ProfileCubit cubit;
  const CourseDetailsScreen({super.key, required this.cubit});

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
        length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height(context) * 0.05,
            child: TabBar(
                controller: tabController,
                indicatorWeight: 3,
                indicatorColor: AppColors.mainColor,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: Colors.black,
                unselectedLabelStyle:
                TextStyle(fontSize: AppFonts.t9),
                labelColor: AppColors.mainColor,
                labelStyle:
                TextStyle(fontSize: AppFonts.t8),
                tabs: [
                  Tab(text: LocaleKeys.Posts.tr()),
                  Tab(text: LocaleKeys.Saves.tr()),
                  Tab(text: LocaleKeys.Visited.tr()),
                  Tab(text: LocaleKeys.Destination.tr())
                ]),
          ),
          SizedBox(height: height(context)*0.01,),
          SizedBox(
            height: height(context) * 0.315,
            child: TabBarView(
                controller: tabController,
                physics: const BouncingScrollPhysics(),
                children:   [
                 PostsImage(cubit: widget.cubit),
                  Saves(cubit: widget.cubit),
                  Visites(cubit: widget.cubit),
                  Destination(cubit: widget.cubit),
                ]),
          ),
          SizedBox(height: height(context) * 0.02),
        ],
      ),
    );
  }
}