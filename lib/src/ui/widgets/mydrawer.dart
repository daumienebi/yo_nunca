import 'package:flutter/cupertino.dart';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:yo_nunca/src/utils/constants.dart';


class MyDrawer extends StatelessWidget{
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Drawer(

      child: _drawerContents(context),
    );
  }

  List<Widget> _drawerList(context){
    const drawerTextStyle = TextStyle(color: Colors.white);
    const iconColor = Colors.white;

    List<Widget> _listItems = [];

    _listItems.add(ListTile(
      title: Text("Mis Categorías",style: drawerTextStyle,),
      trailing: Icon(Icons.list_alt_outlined,color: iconColor,),
      onTap: ()=>Navigator.pushNamed(context, Constants.routes.categoryListPage),
    ));

    _listItems.add(ListTile(
      title: Text("Favoritos",style: drawerTextStyle,),
      trailing: Icon(Icons.favorite_outline_rounded,color: iconColor,),
      onTap: ()=>Navigator.pushNamed(context, Constants.routes.favouritesPage),
    ));

    _listItems.add(ListTile(
        title: Text("Privacidad",style: drawerTextStyle,),
        trailing: Icon(Icons.privacy_tip_outlined,color: iconColor,),
        onTap: ()=>showLicensePage(context: context,applicationIcon:_privacyWidget(),applicationName: "YO NUNCA",applicationVersion: "1.O",applicationLegalese: "Dev D.")
    ));

    _listItems.add(ListTile(
        title: Text("Ayuda",style: drawerTextStyle,),
        trailing: Icon(Icons.help, color: iconColor,),
        onTap: ()=>_unImplementedEx(context)
    ));
    return _listItems;
  }

  Widget _drawerContents(context){
    return Container(
      color: Colors.amber[300],
      child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 40),
              child: Row(
                children:[
                  //foto
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Image.asset("assets/images/question.png",scale: 6,),
                        SizedBox(width: 20),
                        _howToPlayButton()
                      ],
                    )
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/drawer_vertical.png'),
                    fit: BoxFit.fill //to fit the image to the drawer  vertically and horizontally
                  )
                ),
                //color: Colors.amberAccent[100],
                child: ListView(
                    children:
                    _drawerList(context)
                ),
              ),
            ),
          ]),
    );
  }

  Widget _privacyWidget(){
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
    ]);
  }

  //o declararlo como un Future : Future _funcionNoImplementada (context){}
  _unImplementedEx (context){
    return showDialog(
        context: context,
        builder: (_) =>AlertDialog(
          title: Text("Lo sentimos"),
          content: Text("La función elegida aun no se encuentra implementada"),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancelar')), // Cerramos el diálogo
            TextButton(onPressed: (){
              // Pondríamos el código que queramos
              Navigator.pop(context,'Valor de vuelta');     // Envío de vuelta a quien llamó la información que quiera. NO ES OBLIGATORIO
            },
                child: Text('Aceptar')),
          ],
        )
    );
  }

  _howToPlayButton(){
    return ElevatedButton(onPressed: (){
    }, child: Text('Ajustes'),
        style: TextButton.styleFrom(backgroundColor: Colors.greenAccent),
    );
  }

}