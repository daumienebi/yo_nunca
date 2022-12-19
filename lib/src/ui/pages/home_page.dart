import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'package:yo_nunca/src/ui/pages/mixed_mode_page.dart';
import 'package:yo_nunca/src/ui/pages/pages.dart';
import 'package:yo_nunca/src/utils/constants.dart';
import 'package:yo_nunca/src/ui/widgets/widgets.dart';

///Create an enum for the possible social medias where the app can be shared
enum SocialMedia { facebook, twitter, instagram, whatsapp,enlace}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryProvider provider =
        Provider.of<CategoryProvider>(context, listen: true);
    List<Category> categories = provider.categories;
    //physics: const AlwaysScrollableScrollPhysics(),

    return Scaffold(
      appBar: RoundAppBar(
        homePage: true,
      ),
      floatingActionButton: ExpandableFab(
        distance: 112.0,
        children: [
          ActionButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext ctx) {
                    return Container(
                      height: 110,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Compartir',textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 20),
                            ),
                            SizedBox(height: 5,),
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
            icon: const Icon(Icons.share_sharp),
          ),
          ActionButton(
            onPressed: () => print('Datetime :' + DateTime.now().toString()),
            icon: const Icon(Icons.star_border),
          ),
          ActionButton(
            onPressed: () =>
                {Navigator.pushNamed(context, Constants.routes.newCategory)},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child: Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Column(children: [
                    Text(
                      "Desliza para ver las categorias y pulsa "
                          "\n para seleccionar ...",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                    ),
                    CategoriesCardSwiper(categories: categories),
                    SizedBox(
                      height: 15,
                    ),
                    _mixedModeWidget(context),
                  ]))),
        ),
      ),
    );
  }

  Future<void> _setPrefsData() async {
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

  List<Widget> socialMediaButtons(context) {
    //Very shitty work around
    // TODO : change it later on
    List<Widget> items = [];
    items.add(SizedBox(
      width: 10,
    ));
    items.add(socialButton(
        socialMedia: SocialMedia.whatsapp,
        icon: Icon(
          FontAwesomeIcons.whatsapp,
          color: Colors.green,
          size: 40,
        ),
        onClicked: () => share(SocialMedia.whatsapp)));
    items.add(SizedBox(
      width: 15,
    ));
    items.add(socialButton(
        socialMedia: SocialMedia.twitter,
        icon: Icon(
          FontAwesomeIcons.twitter,
          color: Colors.lightBlueAccent,
          size: 40,
        ),
        onClicked: () => share(SocialMedia.twitter)));
    items.add(SizedBox(
      width: 15,
    ));
    items.add(socialButton(
        socialMedia: SocialMedia.facebook,
        icon: Icon(
          FontAwesomeIcons.facebook,
          color: Colors.indigo,
          size: 40,
        ),
        onClicked: () => share(SocialMedia.facebook)));
    items.add(SizedBox(
      width: 15,
    ));
    items.add(
        socialButton(
        socialMedia: SocialMedia.enlace,
        icon: Icon(
          Icons.copy,
          color: Colors.grey,
          size: 40,
        ),
        onClicked: () async{
          await Clipboard.setData(ClipboardData(text:'playstoreurlwithappid'));
        }
      )
    );
    return items;
  }

  socialButton({required SocialMedia socialMedia,required Icon icon,
      Function()? onClicked}) {
    final listTextStyle = TextStyle(color: Colors.black54);
    return Container(
      child: Column(
        children: [
          InkWell(
            child: icon,
            onTap: onClicked,
          ),
          Text(socialMedia.name.toUpperCase(),style: listTextStyle,),
        ],
      ),
    );
  }

  Route _createRoute({required Object? arguments}) {
    return PageRouteBuilder(
      settings: RouteSettings(name: Constants.routes.mixedModePage,
          arguments: arguments),
      pageBuilder: (context, animation, secondaryAnimation) => const MixedModePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  Widget _mixedModeWidget(BuildContext context) {
    //guess its not advisable to pass the context like this
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
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 3))
              ]),
          child: Column(
              children: const [
            Text("Dudas con que categoria elegir ?  👀 ",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black45, fontSize: 16)),
          ]),
        ),
        ElevatedButton(
          onPressed: () async{
            //Set the date the user enters to view the questions
            _setPrefsData();
            //The page receives a category with id : 0,because it is only going
            //to be used for this mode
            Navigator.of(context).push(_createRoute(arguments:
            Category(id: 0, description: 'MODO MIXTO', imageRoute: '')));
          },
          child: Text(
            'MODO MIXTO',
            style: TextStyle(
                fontFamily: 'OoohBaby',
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.black87),
          ),
          style: TextButton.styleFrom(backgroundColor: Colors.greenAccent),
        )
      ],
    );
  }

  Future share(SocialMedia platform) async {
    const text = 'Descarga esta aplicación de Yo Nunca personalizable para jugar'
        ' de fiesta con los amigos';
    final urlShare = Uri.encodeComponent(Constants.playStoreUrl);

    final urls = {
      SocialMedia.facebook:
          'https://www.facebook.com/sharer/sharer.php?u=$urlShare&t=$text',
      SocialMedia.twitter:
          'https://twitter.com/intent/tweet?url=$urlShare&text=$text',
      SocialMedia.whatsapp: 'https://api.whatsapp.com/send?text=$text$urlShare',
    };
    final url = Uri.parse(urls[platform]!);
      await launchUrl(url,mode: LaunchMode.externalApplication);
  }
}
