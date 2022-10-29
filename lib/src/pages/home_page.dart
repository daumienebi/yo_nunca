import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:yo_nunca/src/utils/constants.dart';
import 'package:yo_nunca/src/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //physics: const AlwaysScrollableScrollPhysics(),
    return Scaffold(
      //drawerScrimColor: Colors.red,
      drawer: MyDrawer(),
      appBar: NewGradientAppBar(
        //title: Text(Constants.title),
        centerTitle: true,
        title: Container(
          alignment: Alignment.bottomCenter,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              decoration: BoxDecoration(
                  //color: Colors.red,
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
        ),
        actions: [

          InkWell(
              child: Icon(Icons.share_outlined),
              onTap: _launchUrl
          ),
          SizedBox(width: 5,)
        ],
        gradient: const LinearGradient(colors: [
          Colors.amberAccent,
          Colors.amberAccent,
          Colors.white
        ]), //Change it later
      ),
      backgroundColor: Colors.orange[50],
      floatingActionButton: FloatingActionButton(
        tooltip: 'Añadir nueva categoría',
        child: Icon(Icons.add),
        onPressed: () {
          showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now());
        }, //Just trying it out
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child: Container(
                  alignment: Alignment.center, child: HomePageList())),
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    final Uri _url = Uri.parse(Constants.playStoreUrl);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }


  Widget _goToFavouritesBtn() {
    //?
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        'Favorítos ❤️',
        style: TextStyle(color: Colors.white),
      ),
      style: TextButton.styleFrom(
          backgroundColor: Colors.black,
          minimumSize: Size(150, 40),
          maximumSize: Size(300, 80),
          side: BorderSide(width: 10.0)),
    );
  }
}
