import 'dart:convert';
import 'dart:io';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:yo_nunca/src/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as dev;

///Enum for the app versions
enum AppVersion { minimum_version, latest_version }

class AppVersionUtil {
  //Check if a new version is available
  // TODO finish it
  static Future<String> getVersion(AppVersion appVersion) async {
    dynamic responseJson;
    String latestVersion = '';
    try {
      final response = await http.get(Uri.parse(Constants.appVersionLink));
      print(Constants.appVersionLink);
      //Decode the response and return the json body to be mapped to any object
      responseJson = jsonDecode(response.body);
      latestVersion = responseJson[appVersion.name];
    } on SocketException catch (e) {
      print(responseJson.toString());
      // Handle the SocketException
      dev.log('Network connection error: $e');
    } catch (e) {
      dev.log('Random Exception $e');
    }
    return latestVersion;
  }

  // Checks if the user needs to update the app
  // TODO : Implement the minimum version check
  static Future<bool> isUpdateRequired() async {
    bool update = false; // to decide if the user has to update
    late int latestVersionIndex;
    late int usersVersionIndex;
    final String latestVersion = await getVersion(AppVersion.latest_version);
    final String usersVersion = await getUsersVersion();
    final String minimumVersion = await getVersion(AppVersion.minimum_version);
    // Versions are separated like this [x.y.z] so the indexes will be [0,1,2,3,4]
    // in order to get the version numbers and compare them. indexes 1 & 3 cannot
    // be parsed to an Integer because they are '.'. For example '1.3.0'.

    // A loop can be used to iterate 5 times, but skipping an index because we
    // want to ignore the '.' so it will be index+=2 instead of index++ instead
    // of comparing the strings one by one

    // 5 because the total elements in a version is 5. For example 1.3.0
    for (int index = 0; index < 5; index += 2) {
      latestVersionIndex = int.parse(latestVersion[index].toString());
      usersVersionIndex = int.parse(usersVersion[index].toString());
      if (latestVersionIndex > usersVersionIndex) {
        dev.log('$latestVersionIndex vs $usersVersionIndex');
        update = true;
        break;
      }
    }
    return update;
  }

  static Future<String> getUsersVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    return Future.value(version);
  }
}
