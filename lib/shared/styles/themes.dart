import 'package:flutter/material.dart';
import 'package:project/shared/const/const.dart';
import 'package:project/shared/styles/colors.dart';
import 'package:project/shared/const/integers.dart';

ThemeData lightTheme =  ThemeData(
        scaffoldBackgroundColor: AppColor.backgroundColor[listIndex] ,
        appBarTheme: AppBarTheme(
          color: AppColor.backgroundColor[0],
          elevation: Integers.aPPBarElevation,
          centerTitle: true,
          titleSpacing: Integers.paddingWidth ,
          iconTheme: IconThemeData(
            color: AppColor.appBarIconColor[0],
            size: Integers.appBarTextSize,
          ),
          titleTextStyle:TextStyle(
            color: AppColor.textColor[0],
            fontSize: Integers.appBarTextSize
          ),
        ),
      );