import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:travel/screen/chat/components/groups.dart';
import 'package:travel/screen/chat/components/private.dart';
import '../../../../components/style/colors.dart';
import '../../../../components/style/size.dart';
import '../../../../generated/locale_keys.g.dart';
import 'custom_chat_textfield.dart';
import 'stories.dart';

class ChatTabBarScreen extends StatefulWidget {

  const ChatTabBarScreen({super.key});

  @override
  State<ChatTabBarScreen> createState() => _ChatTabBarScreenState();
}

class _ChatTabBarScreenState extends State<ChatTabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
        length: 3, vsync: this);
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
                  Tab(text: LocaleKeys.Private.tr()),
                  Tab(text: LocaleKeys.Groups.tr()),
                  Tab(text: LocaleKeys.Stories.tr()),
                ]),
          ),
          SizedBox(height: height(context)*0.01,),
          ChatCustomTextField(
            suffix: const Icon(Icons.search, color: AppColors.secGrayColor,),
            type: TextInputType.text,
            text: "ادخل كلمه البحث",
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: height(context) * 0.545,
              child: TabBarView(
                  controller: tabController,
                  physics: const BouncingScrollPhysics(),
                  children:const [
                    PrivateChat(),
                    GroupsChat(),
                    StoriesChat(),
                  ]),
            ),
          ),
          SizedBox(height: height(context) * 0.02),
        ],
      ),
    );
  }
}