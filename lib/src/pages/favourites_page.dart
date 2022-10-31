import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:yo_nunca/src/utils/constants.dart';

class FavouritesPage extends StatefulWidget{
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  int _favourite = 1;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text('Favoritos'),
        gradient: const LinearGradient(colors: [Colors.amber,Colors.white70,Colors.amber]),
      ),

      body: Container(
        child: ListView(
          children: [
            _favListTile("Yo nunca he vista a windows XP y despues Debian sin jugar a la XBOX"),
            _favListTile("Yo nunca he vista a windows XP y despues Debian"),
            _favListTile("Yo nunca he vista a windows XP y despues Debian"),
            _favListTile("Yo nunca he vista a windows XP y despues Debian pero 1 + 7 son 5")
          ],
        ),
      ),
    );
  }

  ListTile _favListTile(String question){
    var icon = Icons.favorite;
    return ListTile(
      title: Text(question),
      subtitle: Text("NORMAL",overflow: TextOverflow.ellipsis,maxLines: 1),
      trailing: InkWell(
          onTap: (){
            _favourite = 0;
            setState(() {

            });
            },
          child: _favourite == 1 ? Icon(Icons.favorite,color: Colors.red,) : Icon(Icons.favorite_outline_rounded)

      ),
    );
  }
}