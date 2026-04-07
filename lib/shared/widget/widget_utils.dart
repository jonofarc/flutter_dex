import 'package:flutter/material.dart';
import 'package:flutter_dex/shared/utils/app_text_style.dart';
import 'package:flutter_dex/shared/utils/constants.dart';




class WidgetUtils {
  AppBar getDefaultAppbar(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(appName,
          style: AppTextStyle.headingH2.withColor(defaultTextColor)),
    );
  }

}
