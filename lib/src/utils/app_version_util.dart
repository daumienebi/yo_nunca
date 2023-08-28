import 'dart:convert';
import 'dart:io';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:yo_nunca/src/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as dev;

///Enum for the app versions
enum AppVersion {minimum_version,current_version}

class AppVersionUtil{
  //Check if a new version is available
  // TODO finish it
  static Future<String> getVersion(AppVersion appVersion) async{
    dynamic responseJson;
    String newVersion = '';
    try {
      final response = await http.get(Uri.parse(Constants.appVersionLink));
      print(Constants.appVersionLink);
      //Decode the response and return the json body to be mapped to any object
      responseJson = jsonDecode(response.body);
      newVersion = responseJson[appVersion.name];
    } on SocketException catch (e){
      print(responseJson.toString());
      // Handle the SocketException
      dev.log('Network connection error: $e');
    }catch(e){
      dev.log('Random Exception $e');
    }
    return newVersion;
  }

  // Checks if the user needs to update the app
  static Future<bool>isUpdateRequired() async{
    late bool update; // to decide if the user has to update
    final String latestVersion = await getVersion(AppVersion.current_version);
    final String usersVersion = await getUsersVersion();
    final String minimumVersion = await getVersion(AppVersion.minimum_version);
    // Versions are separated like this [x.y.z] so the indexes will be [0,1,2,3,4]
    // in order to get the version numbers and compare them. indexes 1 & 3 cannot
    // be parsed because they are '.'. For example usersVersion = 1.3.2 &
    // latestVersion = 1.4.0

    // X
    if(int.parse(latestVersion[0].toString()) > int.parse(usersVersion[0].toString())){
      update = true;
    }
    // Y
    if(int.parse(latestVersion[2].toString()) > int.parse(usersVersion[2].toString())){
      update = true;
    }
    // Z
    if(int.parse(latestVersion[4].toString()) > int.parse(usersVersion[4].toString())){
      update = true;
    }
    return update;
  }

  static Future<String> getUsersVersion() async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    return Future.value(version);
  }
}