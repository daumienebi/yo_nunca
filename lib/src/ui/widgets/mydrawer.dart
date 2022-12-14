import 'package:flutter/cupertino.dart';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yo_nunca/src/utils/constants.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: _drawerContents(context),
    );
  }

  List<Widget> _drawerList(context) {
    const drawerTextStyle = TextStyle(color: Colors.white);
    const iconColor = Colors.white;

    List<Widget> _listItems = [];

    _listItems.add(ListTile(
      title: Text(
        "Mis Categorías",
        style: drawerTextStyle,
      ),
      trailing: Icon(
        Icons.list_alt_outlined,
        color: iconColor,
      ),
      onTap: () =>
          Navigator.pushNamed(context, Constants.routes.categoryListPage),
    ));

    _listItems.add(ListTile(
      title: Text(
        "Favoritos",
        style: drawerTextStyle,
      ),
      trailing: Icon(
        Icons.favorite,
        color: Colors.red,
      ),
      onTap: () =>
          Navigator.pushNamed(context, Constants.routes.favouritesPage),
    ));

    _listItems.add(ListTile(
        title: Text(
          "Privacidad",
          style: drawerTextStyle,
        ),
        trailing: Icon(
          Icons.privacy_tip_outlined,
          color: iconColor,
        ),
        onTap: () => showLicensePage(
            context: context,
            applicationName: "YO NUNCA",
            applicationVersion: "1.O",
            applicationLegalese: "Dev D.")));

    _listItems.add(ListTile(
      title: Text(
        "Ajustes",
        style: drawerTextStyle,
      ),
      trailing: Icon(
        Icons.settings,
        color: Colors.white,
      ),
      onTap: () => _unImplementedEx(context)
    ));
    return _listItems;
  }

  Widget _drawerContents(context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
          children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/drawer_vertical.png'),
                    fit: BoxFit
                        .fill //to fit the image to the drawer  vertically and horizontally
                    )),
            //color: Colors.amberAccent[100],
            child: ListView(children: _drawerList(context)),
          ),
        ),
      ]),
    );
  }

  _unImplementedEx(context) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Lo sentimos"),
              content:
                  Text("La función elegida aun no se encuentra implementada"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancelar')),
                TextButton(
                    onPressed: () {
                      // On pressed logic
                      Navigator.pop(
                          context, 'Return value'); //Return value to the caller
                    },
                    child: Text('Aceptar')),
              ],
            ));
  }

  Future<void> _launchUrl() async {
    final Uri _url = Uri.parse(Constants.playStoreUrl);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
