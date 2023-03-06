import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yo_nunca/src/ui/pages/pages.dart';
import 'package:yo_nunca/src/ui/widgets/round_app_bar.dart';
import 'package:yo_nunca/src/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yo_nunca/src/utils/shared_preferences_util.dart';
// ignore_for_file: prefer_const_constructors

class DrawerPage extends StatelessWidget{
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: RoundAppBar(
        homePage: false,
        title: Text(AppLocalizations.of(context)!.options),
      ),
        body: _mainBody(context)
    );
  }

  Widget _mainBody(context){
    return Container(
      margin: EdgeInsets.only(top: 20,left: 15, right: 15),
      child: Column(
        children: [
          _buildLastEntryWidget(context),
          _optionsWidgets(context),
          TextButton(
              onPressed: ()=> Navigator.of(context).pop(),
              style: TextButton.styleFrom(backgroundColor: Colors.redAccent),
              child: Text(
                AppLocalizations.of(context)!.close,
                style: TextStyle(color: Colors.white,),)
          )
        ],
      ),decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
    ),
    );
  }

    Widget _buildLastEntryWidget(BuildContext context){
    return FutureBuilder(
      future: SharedPreferencesUtil.getUserLastEntry(context),
      builder: (BuildContext context,AsyncSnapshot snapshot){
        if(snapshot.hasData){
          return _lastEntryWidget(snapshot.data,context);
        }else{
          return _lastEntryWidget('',context);
        }
      },
    );
  }

  Widget _lastEntryWidget(String lastEntry,BuildContext context){
    String greetingsText = '';
    final DateTime now = DateTime.now();
    final format = DateFormat.jm();
    String formattedString = format.format(now);
    if(formattedString.endsWith('AM')){
      greetingsText = AppLocalizations.of(context)!.goodMorning;
    }else if(formattedString.endsWith('PM') &&
        //Example of a formattedString could be 6:54 PM, so we split the string
        //to get the item at the first index and compare if its past 8 o'clock
        int.parse(formattedString.split(":")[0]) > 8){
      greetingsText = AppLocalizations.of(context)!.goodNight;
    }else{
      greetingsText = AppLocalizations.of(context)!.goodEvening;
    }

    return Container(
      padding: EdgeInsets.all(7),
      height: 90,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(greetingsText,textAlign: TextAlign.left,
            style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 23,color: Colors.cyanAccent[400]
            ),),
          SizedBox(height: 5),
          Text(
            lastEntry.isNotEmpty ?
            AppLocalizations.of(context)!.lastEntryText(lastEntry) :
            AppLocalizations.of(context)!.youHaveNotPlayedYet,//empty space ;)
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

  Widget _optionsWidgets(context){
    return Expanded(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: _optionsList(context),
        ),
      ),
    );
  }

  Route _createRoute({required page}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  List<Widget> _optionsList(context){
    List<Widget> widgets = [];
    final subTitleStyle = TextStyle(fontSize: 14);
    final titleStyle = TextStyle(fontSize: 17);

    widgets.add(InkWell(
      child: ListTile(
        title: Text(AppLocalizations.of(context)!.manageCategories,style: titleStyle,),
        subtitle: Text(AppLocalizations.of(context)!.questionsWithCategoriesText,
          style: subTitleStyle,),
        leading: Icon(Icons.list_alt_outlined),
        trailing: Icon(Icons.arrow_forward_ios_sharp,size: 10,),
        onTap: ()=> Navigator.of(context).push(
            _createRoute(page: CategoryListPage()))
      ),
    ));

    widgets.add(ListTile(
        title: Text(AppLocalizations.of(context)!.favourites,style: titleStyle),
        subtitle: Text(AppLocalizations.of(context)!.favouriteQuestionsList,style: subTitleStyle,),
        leading: Icon(Icons.favorite,color: Colors.red,),
        trailing: Icon(Icons.arrow_forward_ios_sharp,size: 10,),
        onTap: ()=>Navigator.of(context).push(
            _createRoute(page: FavouritesPage()))
    ));

    widgets.add(ListTile(
      title: Text(AppLocalizations.of(context)!.privacy,style: titleStyle),
      subtitle: Text(AppLocalizations.of(context)!.dataManagement,style: subTitleStyle,),
      leading: Icon(Icons.privacy_tip_outlined),
      trailing: Icon(Icons.arrow_forward_ios_sharp,size: 10,),
      onTap: (){
        //original url: https://www.termsfeed.com/live/df65fce0-9b00-48db-b48b-0bca473a6fe0
        final url = Uri.parse('https://daumienebi.github.io/yo_nunca/policy.html');
        _launchUrl(url);
      },
    ));

    widgets.add(ListTile(
        title: Text(AppLocalizations.of(context)!.rateTheApp,style: titleStyle),
        subtitle: Text(AppLocalizations.of(context)!.rateTheAppText, style: subTitleStyle,),
        leading: Icon(FontAwesomeIcons.googlePlay,),
        trailing: Icon(Icons.arrow_forward_ios_sharp,size: 10,),
        onTap: () async{
          String appId = Constants.playStoreId;
          final url = Uri.parse('https://play.google.com/store/apps/details?id=$appId');
          await launchUrl(url,mode: LaunchMode.externalApplication);
        },
    ));

    widgets.add(ListTile(
      title: Text(AppLocalizations.of(context)!.credits,style: titleStyle),
      subtitle: Text(AppLocalizations.of(context)!.contributionsToTheProject, style: subTitleStyle,),
      leading: Icon(Icons.people_outline,),
      trailing: Icon(Icons.arrow_forward_ios_sharp,size: 10,),
      onTap: ()=> Navigator.push(context, _createRoute(page: CreditsPage())),
    ));

    widgets.add(ListTile(
      title: Text(AppLocalizations.of(context)!.contactDeveloper,style: titleStyle),
      subtitle: Text(AppLocalizations.of(context)!.contactDeveloperSubtitle,
        style: subTitleStyle,
      ),
      leading: Icon(Icons.contact_mail_outlined,),
      trailing: Icon(Icons.arrow_forward_ios_sharp,size: 10,),
      onTap: ()async{
        String subject = 'Usuario desde la app: Yo Nunca';
        String mailUrl = 'mailto:devdaumienebi@gmail.com?subject=$subject';
        await _launchUrl(Uri.parse(mailUrl));
      },
    ));

    widgets.add(ListTile(
      title: Text(AppLocalizations.of(context)!.updateApp,style: titleStyle),
      subtitle: Text(AppLocalizations.of(context)!.updateAppText,
        style: subTitleStyle,
      ),
      leading: Icon(Icons.update_sharp,color: Colors.green,),
      trailing: Icon(Icons.arrow_forward_ios_sharp,size: 10,),
      onTap: () async{
        _updateAppPopUpForm(context);
      },
    ));

    return widgets;
  }

  Future _updateAppPopUpForm(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) {
          return AlertDialog(
            title: Text(
                AppLocalizations.of(context)!.updateModeText
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextButton(
                      onPressed: () async{
                        String appId = Constants.playStoreId;
                        final url = Uri.parse('https://play.google.com/store/apps/details?id=$appId');
                        await launchUrl(url,mode: LaunchMode.externalApplication);
                      },
                    child: Text(
                        AppLocalizations.of(context)!.goToPlaystore,
                        style: TextStyle(color: Colors.black87)
                    ),
                    style:TextButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                      )
                  ),
                  TextButton(
                    onPressed: () async{
                      //String apkLink = Constants.apkLink;
                      final url = Uri.parse('https://daumienebi.github.io/yo_nunca');
                      await launchUrl(url,mode: LaunchMode.externalApplication);
                    },
                    child: Text(
                        AppLocalizations.of(context)!.downloadApk,
                        style: TextStyle(color: Colors.black87)
                    ),
                    style:TextButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                      )
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                    AppLocalizations.of(context)!.cancel,
                    style: TextStyle(color: Colors.red)
                ),
              ),
            ],
          );
      },
    );
  }


  _launchUrl(Uri url) async{
    await launchUrl(url,mode:LaunchMode.externalApplication);
  }

}