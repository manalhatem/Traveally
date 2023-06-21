import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:travel/generated/locale_keys.g.dart';

import 'empty_chat.dart';
class GroupsChat extends StatelessWidget {
  const GroupsChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ChatEmpty(img:"assets/images/28072-groups.gif", text:LocaleKeys.NoGroup.tr(),);
  }
}
