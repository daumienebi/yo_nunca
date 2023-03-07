import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///Enum for the possible social medias where the app can be shared
enum SocialMedia { facebook, twitter, instagram, whatsapp,enlace}

class Constants {
  static double homePageWidgetHeight = 200;
  static String playStoreId = 'com.devdaumienebi.yonunca';
  static String apkLink = "https://github.com/daumienebi/yo_nunca/releases/download/v1.2.0/app-release.apk";

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
}