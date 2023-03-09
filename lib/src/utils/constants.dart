import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///Enum for the possible social medias where the app can be shared
enum SocialMedia { Facebook, Twitter, Instagram, Whatsapp,Enlace}

class Constants {
  static double homePageWidgetHeight = 200;

  static String playStoreId = 'com.devdaumienebi.yonunca';

  static String apkLink = "https://github.com/daumienebi/yo_nunca/releases/download/v1.2.0/app-release.apk";

  static List<Color> mixedModeColors = [
    Colors.orange, Colors.pink, Colors.white, Colors.cyan, Colors.green,
    Colors.blue,Colors.grey, Colors.lime,Colors.yellow,Colors.teal
  ];

  static String getMonthName(int month,BuildContext context){
    Map<int,String> months = {
      1 : AppLocalizations.of(context)!.january,
      2 : AppLocalizations.of(context)!.february,
      3 : AppLocalizations.of(context)!.march,
      4 : AppLocalizations.of(context)!.april,
      5 : AppLocalizations.of(context)!.may,
      6 : AppLocalizations.of(context)!.june,
      7 : AppLocalizations.of(context)!.july,
      8 : AppLocalizations.of(context)!.august,
      9 : AppLocalizations.of(context)!.september,
      10 : AppLocalizations.of(context)!.october,
      11 : AppLocalizations.of(context)!.november,
      12 : AppLocalizations.of(context)!.december,
    };
    return months[month].toString();
  }

  static MaterialColor primarySwatch = MaterialColor(0xFF004e95,
      {
        50  : const Color(0xFF004e95),
        100 : const Color(0xFF004e95),
        200 : const Color(0xFF004e95),
        300 : const Color(0xFF004e95),
        400 : const Color(0xFF004e95),
        500 : const Color(0xFF004e95),
        600 : const Color(0xFF004e95),
        700 : const Color(0xFF004e95),
        800 : const Color(0xFF004e95),
        900 : const Color(0xFF004e95)
      });

}