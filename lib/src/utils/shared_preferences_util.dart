//Create simple tests for this stuff
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yo_nunca/src/utils/constants.dart';

class SharedPreferencesUtil{

  /// Get the date the user enters a category to view the question and save it
  /// in the [SharedPreferences]
  static Future<void> setUserLastEntry() async{
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    String data = '';
    int year = DateTime.now().year;
    int day = DateTime.now().day;
    int month = DateTime.now().month;
    //separate the date with : to later split it up and serve it on the UI
    data = '$day:$month:$year';
    prefs.setString('lastEntry', data);
  }

  /// Retrieve the user's last entry
  static Future<String> getUserLastEntry(BuildContext context) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var lastEntry = pref.getString('lastEntry') ?? '';
    var lastEntryItems = lastEntry.split(":");
    int day = int.parse(lastEntryItems[0]);
    int month = int.parse(lastEntryItems[1]);
    String of = AppLocalizations.of(context)!.of_;
    var uiText = '$day $of ${Constants.getMonthName(month,context)},'
        ' ${lastEntryItems[2]}';
    return Future.value(uiText);
  }

}