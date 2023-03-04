//Create simple tests
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yo_nunca/src/utils/constants.dart';

class SetSharedPreferences{

  /// Get the date the user enters a category to view the question and save it
  /// in the [SharedPreferences]
  static Future<void> setLastEntry() async{
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    String data = '';
    int year = DateTime.now().year;
    int day = DateTime.now().day;
    int month = DateTime.now().month;
    var months = Constants.monthsInSpanish;
    data = '$day de ${months.elementAt(month - 1)} del $year';
    prefs.setString('lastEntry', data);
  }
}