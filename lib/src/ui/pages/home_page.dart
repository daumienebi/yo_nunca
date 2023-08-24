import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'package:yo_nunca/src/ui/pages/pages.dart';
import 'package:yo_nunca/src/utils/app_routes.dart';
import 'package:yo_nunca/src/utils/constants.dart';
import 'package:yo_nunca/src/ui/components/components.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yo_nunca/src/utils/shared_preferences_util.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryProvider provider =
        Provider.of<CategoryProvider>(context, listen: true);
    List<Category> categories = provider.categories;
    //physics: const AlwaysScrollableScrollPhysics(),

    return Scaffold(
      appBar: CustomAppBar(
        homePage: true,
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Icon(Icons.share_sharp),
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              barrierColor: Colors.black26,
              context: context,
              builder: (BuildContext context) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(left: 7, right: 7),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  height: 120,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.shareApp,textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20
                          ),
                        ),
                        const SizedBox(height: 5),
                        Expanded(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: socialMediaButtons(context),
                          ),
                        ),
                      ]),
                );
              });
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        AppLocalizations.of(context)!.swipeToViewCategories,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                      ),
                    ),
                    CategoriesCardSwiper(categories: categories),
                    ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).push(
                          _createRoute(
                              settingsName: AppRoutes.routeStrings.newCategory,
                              page: const NewCategoryPage()
                          )
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.addCategory,
                        style: TextStyle(color: Colors.black87,fontSize: 14.5),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.greenAccent,
                          shape: StadiumBorder()
                          //shape: RoundedRectangleBorder(
                            //borderRadius: BorderRadius.circular(7)
                          //)
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    mixedModeWidget(context)
                  ]))),
        ),
      ),
    );
  }

  List<Widget> socialMediaButtons(context) {
    //Very shitty work around
    // TODO : Change it later on
    List<Widget> items = [];
    items.add(SizedBox(
      width: 10,
    ));
    items.add(socialButton(
        socialMedia: SocialMedia.Whatsapp.name,
        icon: Icon(
          FontAwesomeIcons.whatsapp,
          color: Colors.green,
          size: 40,
        ),
        onClicked: (){
          Navigator.pop(context);
          share(SocialMedia.Whatsapp,context);
        }));
    items.add(SizedBox(
      width: 15,
    ));
    items.add(socialButton(
        socialMedia: SocialMedia.Twitter.name,
        icon: Icon(
          FontAwesomeIcons.twitter,
          color: Colors.lightBlueAccent,
          size: 40,
        ),
        onClicked: (){
          Navigator.pop(context);
          share(SocialMedia.Twitter,context);
        }));
    items.add(SizedBox(
      width: 15,
    ));
    items.add(socialButton(
        socialMedia: SocialMedia.Facebook.name,
        icon: Icon(
          FontAwesomeIcons.facebook,
          color: Colors.indigo,
          size: 40,
        ),
        onClicked: (){
          Navigator.pop(context);
          share(SocialMedia.Facebook,context);
        }));
    items.add(SizedBox(
      width: 15,
    ));
    // add the translation
    items.add(socialButton(
        socialMedia: SocialMedia.Email.name,
        icon: const Icon(
          Icons.email,
          color: Colors.redAccent,
          size: 40,
        ),
        onClicked: (){
          Navigator.pop(context);
          share(SocialMedia.Facebook,context);
        }));
    items.add(SizedBox(
      width: 15,
    ));
    items.add(
        socialButton(
        socialMedia: AppLocalizations.of(context)!.copyLink,
        icon: Icon(
          Icons.copy,
          color: Colors.grey,
          size: 40,
        ),
        onClicked: () async{
          String appId = Constants.playStoreId;
          final urlString = 'https://play.google.com/store/apps/details?id=$appId';
          await Clipboard.setData(ClipboardData(text:urlString));
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppLocalizations.of(context)!.linkCopied),
                duration: Duration(seconds: 2)
              )
          );
        }
      )
    );
    return items;
  }

  socialButton({required String socialMedia,required Icon icon,
      Function()? onClicked}) {
    final listTextStyle = TextStyle(color: Colors.black54);
    return Container(
      child: Column(
        children: [
          InkWell(
            child: icon,
            onTap: onClicked,
          ),
          Text(socialMedia, style: listTextStyle,),
        ],
      ),
    );
  }

  Route _createRoute({required page,required String settingsName, Object? arguments}) {
    return PageRouteBuilder(
      settings: RouteSettings(name: settingsName,
          arguments: arguments),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  Widget mixedModeWidget(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 25,
                    offset: Offset(0, 3))
              ]),
          child: Column(
              children: [
            Text(
                AppLocalizations.of(context)!.mixedModeText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54, fontSize: 16)
            ),
          ]),
        ),
        ElevatedButton(
          onPressed: () async{
            //Set the date the user enters to view the questions
            SharedPreferencesUtil.setUserLastEntry();
            //The page receives a category with id : 0,because it is only going
            //to be used for this mode
            Navigator.of(context).push(
                _createRoute(
                  settingsName: AppRoutes.routeStrings.mixedModePage,
                    page: const MixedModePage(),
                    arguments:
            Category(
              //This category will not actually be added
                id: 0,
                description: AppLocalizations.of(context)!.mixedMode,
                imageRoute: ''
            )
            ));
          },
          child: mixedModeRichText(context),
          style: TextButton.styleFrom(backgroundColor: Colors.black87),
        ),
      ],
    );
  }

  /// Return the Mixed Mode text depending on the language but paints the
  /// characters with different colours and also makes the first letters bigger
  RichText mixedModeRichText(BuildContext context){
    String mixedModeText = AppLocalizations.of(context)!.mixedMode;
    // Get the length of the text to be able to loop through it and create the
    // TextSpans
    var textLength = mixedModeText.length;
    List<TextSpan> textSpans = [];
    // Variable to check if the text has been separated, after a space i.e " "
    // the next letter should have a larger font size
    bool spaceFound = false;
    late int spacePosition;
    for(int i = 0; i < textLength; i++){
      //If it's the first character, make the font larger
      if(i == 0){
        textSpans.add(
            TextSpan(
                text: mixedModeText[i],
                style: GoogleFonts.varelaRound(
                    color:Constants.mixedModeColors[i],
                    fontSize: 30,
                    //fontWeight: FontWeight.bold
                )
            )
        );
      }
      if(mixedModeText[i] == " "){
        // Add a TextSpan without any colour or size, set the spaceFound
        // value to "true" so that the next character can be uppercase
        spaceFound = true;
        // Obtain the position in the text where the space " " was found
        spacePosition = i;
        textSpans.add(
            TextSpan(text: mixedModeText[i])
        );
      }
      // Set the next character after the " " to a larger fontSize
      // (spacePosition + 1 == i) is just to make sure the larger font size is
      // only applied to the next character after the space " "
      if(spaceFound && (spacePosition + 1 == i)){
        textSpans.add(
            TextSpan(
                text: mixedModeText[i],
                style: GoogleFonts.varelaRound(
                    color:Constants.mixedModeColors[i],
                    fontSize: 30,
                    //fontWeight: FontWeight.bold
                )
            )
        );
      // Last case where its not the first character of the text
      }else if(i != 0){
        textSpans.add(
            TextSpan(
                text: mixedModeText[i],
                style: GoogleFonts.varelaRound(
                    color:Constants.mixedModeColors[i],
                    fontSize: 20,
                    //fontWeight: FontWeight.bold
                )
            )
        );
      }
    }
    return RichText(
      text: TextSpan(children: textSpans),
    );
  }
  
  /// Method to launch each share option for the [SocialMedia]
  Future share(SocialMedia platform,BuildContext context) async {
    String text = AppLocalizations.of(context)!.shareAppText;
    String appId = Constants.playStoreId;
    final urlString = 'https://play.google.com/store/apps/details?id=$appId';
    final urlShare = Uri.encodeComponent(urlString);
    final urls = {
      SocialMedia.Facebook:
          'https://www.facebook.com/sharer/sharer.php?u=$urlShare&t=$text',
      SocialMedia.Twitter:
          'https://twitter.com/intent/tweet?url=$urlShare&text=$text',
      SocialMedia.Whatsapp: 'https://api.whatsapp.com/send?text=$text $urlShare',
    };
    final url = Uri.parse(urls[platform]!);
      await launchUrl(url,mode: LaunchMode.externalApplication);
  }
}
