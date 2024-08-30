import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yo_nunca/src/ui/pages/pages.dart';
import 'package:yo_nunca/src/ui/components/custom_app_bar.dart';
import 'package:yo_nunca/src/utils/app_version_util.dart';
import 'package:yo_nunca/src/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yo_nunca/src/utils/navigator_util.dart';
import 'package:yo_nunca/src/utils/shared_preferences_util.dart';
// ignore_for_file: prefer_const_constructors

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: CustomAppBar(
          homePage: false,
          title: Text(AppLocalizations.of(context)!.options),
        ),
        body: _mainBody(context));
  }

  Widget _mainBody(context) {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Column(
        children: [
          _buildLastEntryWidget(context),
          SizedBox(height: 10),
          _optionsWidgets(context),
          //Display the current app version
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 15),
            child: FutureBuilder(
                future: AppVersionUtil.getUsersVersion(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      child: Text(
                        '${AppLocalizations.of(context)!.appVersion} ${snapshot.data.toString()}',
                        style: TextStyle(fontSize: 16, color: Colors.black38),
                      ),
                    );
                  } else
                    return Text("");
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildLastEntryWidget(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferencesUtil.getUserLastEntry(context),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return _lastEntryWidget(snapshot.data, context);
        } else {
          return _lastEntryWidget('', context);
        }
      },
    );
  }

  Widget _lastEntryWidget(String lastEntry, BuildContext context) {
    String greetingsText = '';
    final DateTime now = DateTime.now();
    final format = DateFormat.jm();
    String formattedString = format.format(now);
    if (formattedString.endsWith('AM')) {
      greetingsText = AppLocalizations.of(context)!.goodMorning;
    } else if (formattedString.endsWith('PM') &&
        //Example of a formattedString could be 6:54 PM, so we split the string
        //to get the item at the first index and compare if its past 8 o'clock
        int.parse(formattedString.split(":")[0]) > 8) {
      greetingsText = AppLocalizations.of(context)!.goodNight;
    } else {
      greetingsText = AppLocalizations.of(context)!.goodEvening;
    }

    return Container(
      padding: EdgeInsets.all(7),
      height: 75,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(10),
        //backgroundBlendMode: BlendMode.clear
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            greetingsText,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 23,
                color: Colors.cyanAccent[400]),
          ),
          SizedBox(height: 5),
          Text(
            lastEntry.isNotEmpty
                ? AppLocalizations.of(context)!.lastEntryText(lastEntry)
                : AppLocalizations.of(context)!
                    .youHaveNotPlayedYet, //empty space ;)
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _optionsWidgets(context) {
    return Expanded(
      child: Container(
        child: ListView(
          children: _optionsList(context),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 15,
                offset: Offset(0, 3))
          ],
        ),
      ),
    );
  }

  List<Widget> _optionsList(BuildContext context) {
    List<Widget> widgets = [];
    final subTitleStyle = TextStyle(fontSize: 13.5);
    final titleStyle = TextStyle(fontSize: 16);

    widgets.add(InkWell(
      child: ListTile(
        title: Text(AppLocalizations.of(context)!.manageCategories,
            style: titleStyle),
        subtitle: Text(
            AppLocalizations.of(context)!.questionsWithCategoriesText,
            style: subTitleStyle),
        leading: Icon(Icons.list_alt_outlined, color: Colors.black54),
        //contentPadding: EdgeInsets.all(5),
        trailing: Icon(
          Icons.arrow_forward_ios_sharp,
          size: 12,
        ),
        onTap: () => Navigator.of(context).push(
            NavigatorUtil.createRouteWithSlideAnimation(
                newPage: CategoryListPage())),
      ),
    ));

    widgets.add(ListTile(
      title: Text(AppLocalizations.of(context)!.rateTheApp, style: titleStyle),
      subtitle: Text(AppLocalizations.of(context)!.rateTheAppText,
          style: subTitleStyle),
      leading: Icon(FontAwesomeIcons.googlePlay, color: Colors.black54),
      trailing: Icon(
        Icons.arrow_forward_ios_sharp,
        size: 12,
      ),
      onTap: () async {
        String appId = Constants.playStoreId;
        final url =
            Uri.parse('https://play.google.com/store/apps/details?id=$appId');
        await launchUrl(url, mode: LaunchMode.externalApplication);
      },
    ));

    widgets.add(ListTile(
      title: Text(AppLocalizations.of(context)!.credits, style: titleStyle),
      subtitle: Text(AppLocalizations.of(context)!.contributionsToTheProject,
          style: subTitleStyle),
      leading: Icon(
        Icons.people_outline,
        color: Colors.black54,
      ),
      trailing: Icon(Icons.arrow_forward_ios_sharp, size: 12),
      onTap: () => Navigator.of(context).push(
          NavigatorUtil.createRouteWithSlideAnimation(newPage: CreditsPage())),
    ));

    /*
    widgets.add(ListTile(
      title: Text(AppLocalizations.of(context)!.backup, style: titleStyle),
      subtitle: Text(
        AppLocalizations.of(context)!.backupText,
        style: subTitleStyle,
      ),
      leading: Icon(Icons.backup_outlined, color: Colors.black54),
      trailing: Icon(
        Icons.arrow_forward_ios_sharp,
        size: 10,
      ),
      onTap: () async {},
    ));
     */

    widgets.add(ListTile(
      title: Text(AppLocalizations.of(context)!.updateApp, style: titleStyle),
      subtitle: Text(
        AppLocalizations.of(context)!.updateAppText,
        style: subTitleStyle,
      ),
      leading: Icon(Icons.update_sharp, color: Colors.black54),
      trailing: Icon(
        Icons.arrow_forward_ios_sharp,
        size: 12,
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          barrierColor: Colors.black12,
          builder: (context) {
            return UpdateAppBottomDialog(); // Pass the required data.
          },
        );
      },
    ));

    widgets.add(ListTile(
      title: Text(AppLocalizations.of(context)!.help, style: titleStyle),
      subtitle:
          Text(AppLocalizations.of(context)!.helpText, style: subTitleStyle),
      leading: Icon(Icons.help_outline, color: Colors.black54),
      trailing: Icon(
        Icons.arrow_forward_ios_sharp,
        size: 12,
      ),
      onTap: () {
        Navigator.of(context).push(
            NavigatorUtil.createRouteWithSlideAnimation(newPage: HelpPage()));
      },
    ));

    return widgets;
  }
}

class UpdateAppBottomDialog extends StatefulWidget {
  const UpdateAppBottomDialog({Key? key}) : super(key: key);

  @override
  State<UpdateAppBottomDialog> createState() => _UpdateAppBottomDialogState();
}

class _UpdateAppBottomDialogState extends State<UpdateAppBottomDialog> {
  late Future<bool> isUpdateRequiredFuture;

  Future<bool> checkForUpdates() async {
    bool isUpdateRequired;
    isUpdateRequired = await AppVersionUtil.isUpdateRequired();
    // Delay the Future
    return Future.delayed(Duration(seconds: 2), () {
      return isUpdateRequired;
    });
  }

  @override
  void initState() {
    isUpdateRequiredFuture = checkForUpdates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: isUpdateRequiredFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            bool isUpdateRequired = snapshot.data;
            return isUpdateRequired
                ? updateRequiredDialog()
                : updateNotRequiredDialog();
          } else {
            return Container(
              padding: const EdgeInsets.all(10),
              //margin: const EdgeInsets.only(left: 7, right: 7,bottom: 7),
              height: MediaQuery.of(context).size.height * 0.20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  color: Colors.white),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  //LinearProgressIndicator(),
                  SizedBox(height: 7),
                  Text(AppLocalizations.of(context)!.checkingForUpdates)
                ],
              )),
            );
          }
        });
  }

  //Dialog to be shown is an update is required
  Widget updateRequiredDialog() {
    return Container(
      padding: const EdgeInsets.all(10),
      //margin: const EdgeInsets.only(left: 7, right: 7,bottom: 7),
      height: MediaQuery.of(context).size.height * 0.27,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          color: Colors.white),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(AppLocalizations.of(context)!.latestVersion,
                      style: TextStyle(color: Colors.blue)),
                  style: TextButton.styleFrom(backgroundColor: Colors.white),
                ),
                FutureBuilder(
                    future:
                        AppVersionUtil.getVersion(AppVersion.latest_version),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          child: Text(
                            '${snapshot.data.toString()}',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                                fontWeight: FontWeight.w500),
                          ),
                        );
                      } else
                        return Text("");
                    }),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 7, bottom: 7),
              child: Column(
                children: [
                  Text(AppLocalizations.of(context)!.newUpdateAvailable),
                  TextButton(
                    onPressed: () async {
                      String appId = Constants.playStoreId;
                      final url = Uri.parse(
                          'https://play.google.com/store/apps/details?id=$appId');
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.updateApp,
                      style: TextStyle(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: StadiumBorder(),
                        minimumSize: Size(double.infinity, 20)),
                  ),
                  Text(AppLocalizations.of(context)!.usersWithoutGooglePlay),
                  TextButton(
                    onPressed: () async {
                      final url =
                          Uri.parse('https://daumienebi.github.io/yo_nunca/');
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.downloadApk,
                      style: TextStyle(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.black87,
                        shape: StadiumBorder(),
                        minimumSize: Size(double.infinity, 20)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  //Dialog to be shown if no update is required
  Widget updateNotRequiredDialog() {
    return Container(
      padding: const EdgeInsets.all(10),
      //margin: const EdgeInsets.only(left: 7, right: 7,bottom: 7),
      height: MediaQuery.of(context).size.height * 0.20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          color: Colors.white),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(AppLocalizations.of(context)!.latestVersion,
                      style: TextStyle(color: Colors.blue)),
                  style: TextButton.styleFrom(backgroundColor: Colors.white),
                ),
                FutureBuilder(
                    future: AppVersionUtil.getUsersVersion(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          child: Text(
                            '${snapshot.data.toString()}',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                                fontWeight: FontWeight.w500),
                          ),
                        );
                      } else
                        return Text("");
                    }),
              ],
            ),
            Container(
              //margin: EdgeInsets.only(top: 7, bottom: 7),
              child: Column(
                children: [
                  Text(AppLocalizations.of(context)!.appUpToDate),
                  SizedBox(height: 7),
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 50,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
