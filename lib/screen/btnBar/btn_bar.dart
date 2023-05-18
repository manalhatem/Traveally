import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:travel/components/custom_text.dart';
import 'package:travel/components/style/size.dart';

import '../../components/style/colors.dart';
import '../../generated/locale_keys.g.dart';
import '../chat/view/chat_view.dart';
import '../explore/view/explore_view.dart';
import '../home/view/home_view.dart';
import '../profile/components/alert_dialog.dart';
import '../profile/view/profile_view.dart';

class ButtonNavBar extends StatefulWidget {
  const ButtonNavBar({Key? key}) : super(key: key);

  @override
  _ButtonNavBarState createState() => _ButtonNavBarState();
}

class _ButtonNavBarState extends State<ButtonNavBar> {
  int selectedPos = 0;

  double bottomNavBarHeight = 60;

  List<TabItem> tabItems = List.of([
    TabItem(
      Icons.home,
      LocaleKeys.Home.tr(),
      Colors.white,
      labelStyle: const TextStyle(
          fontWeight: FontWeight.normal, color: Colors.white, fontSize: 12),
    ),
    TabItem(
      Icons.explore_outlined,
      LocaleKeys.Explore.tr(),
      Colors.white,
      labelStyle: const TextStyle(
          fontWeight: FontWeight.normal, color: Colors.white, fontSize: 12),
    ),
    TabItem(
      Icons.chat_outlined,
      LocaleKeys.Chats.tr(),
      Colors.white,
      labelStyle: const TextStyle(
          fontWeight: FontWeight.normal, color: Colors.white, fontSize: 12),
    ),
    TabItem(
      Icons.person_outline_rounded,
      LocaleKeys.Profile.tr(),
      Colors.white,
      labelStyle: const TextStyle(
          fontWeight: FontWeight.normal, color: Colors.white, fontSize: 12),
    ),
  ]);

  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  List<Widget> screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const ChatScreen(),
    const ProfileScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedPos],
      bottomNavigationBar: bottomNav(),
      floatingActionButton:selectedPos==3? InkWell(
        onTap: (){
          showDialog(context: context, builder: (context){
            return const CustomAlertDialog();
          });
        },
        child: Padding(
          padding: EdgeInsetsDirectional.only(end: width(context)*0.012),
          child: Image.asset("assets/images/Group 216.png",width: width(context)*0.15,),
        ),
      ):null,
    );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      selectedPos: selectedPos,
      selectedIconColor: AppColors.mainColor,
      normalIconColor: AppColors.whiteColor,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: AppColors.mainColor,
      backgroundBoxShadow: const <BoxShadow>[
         BoxShadow(color: Colors.black45, blurRadius: 10.0),
      ],
      animationDuration: const Duration(milliseconds: 300),
      selectedCallback: (int? selectedPos) {
        setState(() {
          this.selectedPos = selectedPos ?? 0;
          print(_navigationController.value);
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
