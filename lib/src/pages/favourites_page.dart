import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// ignore_for_file: prefer_const_constructors
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'package:yo_nunca/src/utils/test_data.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key = const Key("favouritePage")});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {

  Icon _unFav = Icon(Icons.favorite_outline_rounded);
  Icon _fav = Icon(Icons.favorite,color: Colors.red);


  @override
  Widget build(BuildContext context) {
    TestData data = TestData();
    List<Question> _favouriteList = data.getFavouritesList;
    return Scaffold(
        appBar: NewGradientAppBar(
          title: Text('Favoritos'),
          gradient: const LinearGradient(
              colors: [Colors.amber, Colors.white70, Colors.amber]),
        ),
        body: Container(
          margin: EdgeInsets.all(5),
          child: ListView.builder(
            itemBuilder: (_, int index) => _favListTile(_favouriteList[index]),
            itemCount: _favouriteList.length,
            scrollDirection: Axis.vertical,
          ),
        ));
  }

  
  ListTile _favListTile(Question question) {
    bool _isFavourite = question.isFavourite;
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
            setState(() {
              _isFavourite = false;
            });
          },
          child: _isFavourite ? _fav : _unFav
      )
    );
  }
}
