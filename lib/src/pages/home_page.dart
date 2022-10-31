import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:yo_nunca/src/models/default_category.dart';
import 'package:yo_nunca/src/utils/constants.dart';
import 'package:yo_nunca/src/utils/my_decorations.dart';
import 'package:yo_nunca/src/utils/test_data.dart';
import 'package:yo_nunca/src/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TestData data = TestData();
    List<DefaultCategory> _defaultCategories = data.getDefaultCategoriesList;
    //physics: const AlwaysScrollableScrollPhysics(),
    return Scaffold(
        //drawerScrimColor: Colors.red,
        drawer: MyDrawer(),
        appBar: NewGradientAppBar(
          //title: Text(Constants.title),
          centerTitle: true,
          title: _appBarTitle(),
          actions: [
            InkWell(child: Icon(Icons.share_rounded), onTap: _launchUrl),
            SizedBox(
              width: 5,
            )
          ],
          gradient: const LinearGradient(colors: [
            Colors.amber,
            Colors.white70,
            Colors.amber
          ]), //Change it later
        ),
        backgroundColor: Colors.orange[50],
        floatingActionButton: FloatingActionButton(
          tooltip: 'Añadir nueva categoría',
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, Constants.routes.newCategory);
          }, //Just trying it out
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                  margin: EdgeInsets.only(top: 50),
                  //alignment: Alignment.center, child: HomePageList()),// not used anymore for now. Might change my mind later  :)
                  alignment: Alignment.center,
                  child: CardSwiper(defaultCategories: _defaultCategories)),
            ),
          ),
        ));
  }

  Widget _appBarTitle(){
    return Container(
      alignment: Alignment.bottomCenter,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/beer.png'),
                fit: BoxFit.contain,
              )),
          height: 50,
          width: 40,
        ),
        Container(
          decoration: BoxDecoration(
            //color: Colors.red,
              image: DecorationImage(
                image: AssetImage('assets/images/gin3.png'),
                fit: BoxFit.contain,
              )),
          height: 40,
          width: 40,
        ),
      ]),
    );
  }

  Future<void> _launchUrl() async {
    final Uri _url = Uri.parse(Constants.playStoreUrl);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
