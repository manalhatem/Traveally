import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../generated/locale_keys.g.dart';
import 'empty_chat.dart';
class StoriesChat extends StatelessWidget {
  const StoriesChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   ChatEmpty(img:"assets/images/28072-groups.gif", text:LocaleKeys.NoStories.tr(),);
  }
}
