import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'package:yo_nunca/src/providers/providers.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key = const Key("favouritePage")});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {

  @override
  Widget build(BuildContext context) {
    QuestionProvider provider = Provider.of<QuestionProvider>(context, listen: true);
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
            child: _favouriteQuestions.isNotEmpty ?
            _favouriteQuestionsWidget(_favouriteQuestions,provider) :
            Center(
              child: Text(
                "No hay preguntas favoritas"
                ,style: TextStyle
                  (fontSize: 17
                  ),
              ),
            )
          ),
          ]
        ));
  }

  Widget _favouriteQuestionsWidget(List<Question> favouriteQuestions,QuestionProvider provider){
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.all(5),
            child: ListView.builder(
              itemBuilder: (_, int index) => Dismissible(
                child: _favListTile(favouriteQuestions[index],provider),
                //onDismissed: provider.removeFromFavourites(favouriteQuestions[index]),--dunno wtf is wrong with this shitty line of code
                key: UniqueKey(),
                background: Icon(Icons.delete_forever_rounded,color: Colors.red,),
              ),
              itemCount: favouriteQuestions.length,
              scrollDirection: Axis.vertical,
            ),
          ),
        ),
        _newGameBtn(),
        Text("Se creará un juego con solo las preguntas destacadas",style: TextStyle(color: Colors.black87)),
        SizedBox(height: 20,)
      ],
    );
  }

  ListTile _favListTile(Question question,QuestionProvider prov) {
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
    final btnStyle = TextButton.styleFrom(
        textStyle: TextStyle(color: Colors.blue, fontSize: 17),backgroundColor: Colors.greenAccent);
    return ElevatedButton(
      onPressed: () {
        print("Cargando juego con preguntas destacadas.");
      },
      child: Text('Crear juego'),
      style: btnStyle,
    );
  }
}
