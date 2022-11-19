import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'package:yo_nunca/src/utils/test_data.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key = const Key("favouritePage")});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {

  @override
  Widget build(BuildContext context) {
    QuestionProvider provider = Provider.of<QuestionProvider>(context, listen: false);
    List<Question> _favouriteQuestions = provider.favouriteQuestions;
    return Scaffold(
        appBar: NewGradientAppBar(
          title: Text('Preguntas favoritas'),
          gradient: const LinearGradient(
              colors: [Colors.amber, Colors.white70, Colors.amber]),
        ),
        body: Column(
          children: [
          Expanded(
            child: _favouriteQuestions != null && _favouriteQuestions.length > 0 ?
            Container(
              margin: EdgeInsets.all(5),
              child: ListView.builder(
                itemBuilder: (_, int index) => Dismissible(
                  child: _favListTile(_favouriteQuestions[index]),
                  //onDismissed: provider.removeFromFavourites(_favouriteQuestions[index]),
                  key: UniqueKey(),
                  background: Icon(Icons.delete_forever_rounded,color: Colors.red,),
                ),
                itemCount: _favouriteQuestions.length,
                scrollDirection: Axis.vertical,
              ),
            ) : Center(child: Text("No hay preguntas favoritas",style: TextStyle(fontSize: 17),),)
          ),
            _newGameBtn(),
            Text("Se creará un juego con solo las preguntas destacadas",style: TextStyle(color: Colors.black54)),
            SizedBox(height: 10,)
          ]
        ));
  }

  ListTile _favListTile(Question question) {
    return ListTile(
      title: Text(question.description,overflow: TextOverflow.ellipsis),
      trailing: InkWell(
          onTap: () {
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
      child: Text('Crear juego'),
      style: btnStyle,
    );
  }
}
