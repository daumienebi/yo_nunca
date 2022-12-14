import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'package:yo_nunca/src/utils/constants.dart';
import 'package:yo_nunca/src/ui/widgets/widgets.dart';

///Create an enum for the possible social medias where the app can be shared
enum SocialMedia { facebook, twitter, instagram, whatsapp, }

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const _actionTitles = ['Valor la app en la Playstore'];
  @override
  Widget build(BuildContext context) {
    CategoryProvider provider =
        Provider.of<CategoryProvider>(context, listen: true);
    List<Category> categories = provider.categories;
    //physics: const AlwaysScrollableScrollPhysics(),
    return Scaffold(
      drawer: MyDrawer(),
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
                      //Set the height to 50% of the available size
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
            onPressed: () => _showAction(context, 0),
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
                      "Desliza para ver las categorias...",
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

  List<Widget> socialMediaButtons(context) {
    //Very shitty work around
    // TODO : change it later on
    final listTextStyle = TextStyle(color: Colors.black87);
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
      width: 10,
    ));
    items.add(socialButton(
        socialMedia: SocialMedia.instagram,
        icon: Icon(
          FontAwesomeIcons.instagram,
          color: Colors.pink,
          size: 40,
        ),
        onClicked: () => share(SocialMedia.instagram)));
    items.add(SizedBox(
      width: 10,
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
      width: 10,
    ));
    items.add(socialButton(
        socialMedia: SocialMedia.facebook,
        icon: Icon(
          FontAwesomeIcons.facebook,
          color: Colors.indigo,
          size: 40,
        ),
        onClicked: () => share(SocialMedia.facebook)));
    return items;
  }

  socialButton({required SocialMedia socialMedia,required Icon icon,
      Function()? onClicked}) {
    return Container(
      child: Column(
        children: [
          InkWell(
            child: icon,
            onTap: onClicked,
          ),
          Text(socialMedia.name.toUpperCase()),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }

  void _showAction(BuildContext context, int index) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(_actionTitles[index]),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('CLOSE'),
            ),
          ],
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
          child: Column(children: const [
            Text("Dudas con que categoria elegir ?  👀 ",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black45, fontSize: 16)),
          ]),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, Constants.routes.mixedModePage,
                arguments:
                    Category(id: 0, description: 'MODO MIXTO', imageRoute: ''));
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
    const subject = 'Aplicación de YO NUNCA con la opcion de personalizarla ';
    const text = 'Descarga y prueba esta app de YO NUNCA personalizable desde'
        'la Playstore';
    final urlShare = Uri.encodeComponent(Constants.playStoreUrl);

    final urls = {
      SocialMedia.facebook:
          'https://www.facebook.com/sharer/sharer.php?u=$urlShare&t=$text',
      SocialMedia.twitter:
          'https://twitter.com/intent/tweet?url=$urlShare&text=$text',
      SocialMedia.whatsapp: 'https:/api.whatsapp.com/send?text=$text$urlShare',
    };
    final url = Uri.parse(urls[platform]!);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
