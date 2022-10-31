import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'package:yo_nunca/src/utils/constants.dart';
import 'package:yo_nunca/src/utils/test_data.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key = const Key("favouritePage")});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    TestData data = TestData();
    List<Question> _favouriteList = data.getFavouritesList;
    var x = Question(description: "Prueba", isFavourite: true);
    var y = Question(description: "Prueba2", isFavourite: false);
    var z = Question(description: "Prueba3", isFavourite: true);
    return Scaffold(
        appBar: NewGradientAppBar(
          title: Text('Favoritos'),
          gradient: const LinearGradient(
              colors: [Colors.amber, Colors.white70, Colors.amber]),
        ),
        body:
        /*Container(
          child: ListView.separated(
            itemBuilder: (BuildContext ctx, index) =>
                _favListTile(_favouriteList.elementAt(index)),
            scrollDirection: Axis.horizontal,
            itemCount: _favouriteList.length,
            separatorBuilder: (_, int pos) => SizedBox(
              height: 10,
            ),
          ),
        )*/

        Container(
        child: ListView(
          children: [
            _favListTile(x),
            _favListTile(y),
            _favListTile(z),
          ],
        ),
      ),
        );
  }

  ListTile _favListTile(Question question) {
    var icon = Icons.favorite;
    return ListTile(
      title: Text(question.description),
      subtitle: Text(
        "Categoría",
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(fontSize: 13),
      ),
      trailing: InkWell(
          onTap: () {
            question.isFavourite = false;
            setState(() {});
          },
          child: question.isFavourite == true
              ? Icon(Icons.favorite, color: Colors.red)
              : Icon(Icons.favorite_outline_rounded)),
    );
  }
}
