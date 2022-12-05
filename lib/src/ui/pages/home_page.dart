import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'package:yo_nunca/src/utils/constants.dart';
import 'package:yo_nunca/src/ui/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryProvider provider = Provider.of<CategoryProvider>(context, listen: true);
    List<Category> categories = provider.categories;
    //physics: const AlwaysScrollableScrollPhysics(),
    return Scaffold(
      drawer: MyDrawer(),
      appBar: NewGradientAppBar(
        centerTitle: true,
        title: _appBarTitle(),
        actions: [
          PopupMenuButton(itemBuilder: (BuildContext ctx) {
            return [
              PopupMenuItem(
                  child: InkWell(child: Text("Compartir"), onTap: _launchUrl)),
              PopupMenuItem(
                  child: InkWell(child: Text("Valorar"), onTap: _launchUrl)),
            ];
          }),
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
                  child: Column(children: [
                    Text(
                      "Desliza para ver las categorias...",
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                    ),
                    CategoriesCardSwiper(categories: categories),
                    SizedBox(
                      height: 30,
                    ),
                    _mixedModeWidget(context)
                  ]))),
        ),
      ),
    );
  }

  Widget _mixedModeWidget(BuildContext context) {
    //guess its not advisable to pass the context like this
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 10,
                offset: Offset(0, 3))
          ]),
          child: Column(children: const [
            Text("Dudas con que categoria elegir ?  👀 ",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54, fontSize: 16)),
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
                fontSize: 17),
          ),
          style: TextButton.styleFrom(backgroundColor: Colors.greenAccent),
        )
      ],
    );
  }

  Widget _appBarTitle() {
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
