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

  @override
  Widget build(BuildContext context) {
    TestData data = TestData();
    List<Question> _favouriteList = data.getFavouritesList;
    return Scaffold(
        appBar: NewGradientAppBar(
          title: Text('Preguntas destacadas'),
          gradient: const LinearGradient(
              colors: [Colors.amber, Colors.white70, Colors.amber]),
        ),
        body: Column(
          children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(5),
              child: ListView.builder(
                itemBuilder: (_, int index) => Dismissible(
                  child: _favListTile(_favouriteList[index]),
                  key: UniqueKey(),
                  background: Icon(Icons.star),//Try out
                  secondaryBackground: Icon(Icons.delete_forever_rounded,color: Colors.red,),//Try out
                ),
                itemCount: _favouriteList.length,
                scrollDirection: Axis.vertical,
              ),
            ),
          ),
            _newGameBtn(),
            Text("Se creará un juego con solo las preguntas destacadas",style: TextStyle(color: Colors.grey))
          ]
        ));
  }

  
  ListTile _favListTile(Question question) {
    bool _isFavourite = question.isFavourite;
    return ListTile(
      title: Text(question.description),
      subtitle: Text(
        "Nombre Categoría",
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 13),
      ),
      //tileColor: Colors.black26, -- not all titles are getting the colour
      trailing: InkWell(
          onTap: () {
            setState(() {
              //_isFavourite = false;
            });
          },
          child: Icon(Icons.delete_forever_rounded,color: Colors.red,)
      )
    );
  }

  Widget _newGameBtn() {
    final btnStyle = ElevatedButton.styleFrom(
        textStyle: TextStyle(color: Colors.blue, fontSize: 20));
    return ElevatedButton(
      onPressed: () {
        print("Cargando juego con preguntas destacadas");
      },
      child: Text('Crear juego',),
      style: btnStyle,
    );
  }
}
