import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
import 'package:provider/provider.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'package:yo_nunca/src/ui/widgets/widgets.dart';
import 'package:yo_nunca/src/utils/constants.dart';
import 'package:yo_nunca/src/utils/messages.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key = const Key("favouritePage")}); //wtf

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  List<Question> _favouriteQuestions = [];

  Future<List<Question>> _favouriteQuestionsFuture() async {
    QuestionProvider provider =
        Provider.of<QuestionProvider>(context, listen: true);
    await provider.getFavouriteQuestions(); // Await on your future.
    var questions = provider.favouriteQuestions;

    return questions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: RoundAppBar(
          title: Text('Preguntas favoritas'),
          homePage: false,
        ),
        body: FutureBuilder(
          future: _favouriteQuestionsFuture(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            List<Widget> futureWidgets = [];
            if (snapshot.hasData) {
              _favouriteQuestions = snapshot.data;
            } else if (snapshot.hasError) {
              futureWidgets = <Widget>[
                Messages.errorWidget('No se pudieron cargar las preguntas :('),
              ];
            }
            return Column(children: [
              Expanded(
                  child: _favouriteQuestions.isNotEmpty
                      ? _favouriteQuestionsWidget(_favouriteQuestions)
                      : Center(
                          child: Container(
                            padding: EdgeInsets.only(left: 7,right: 7),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/love.png',
                                scale: 7,
                              ),
                              Text(
                                "Todavía no has añadido preguntas favoritas."
                                "Pulsa el icono del corazon de una pregunta "
                                "para añadirlo a los favoritos.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black54
                                ),
                              ),
                            ],
                        ),
                          )
                  )
              ),
            ]);
          },
        ));
  }

  Widget _favouriteQuestionsWidget(List<Question> favouriteQuestions) {
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.all(5),
            child: ListView.separated(
              itemBuilder: (_, int index) =>
                  _favListTile(favouriteQuestions[index]),
              separatorBuilder: (context, index) => Divider(
                color: Colors.red[100],
                height: 1,
              ),
              itemCount: favouriteQuestions.length,
              scrollDirection: Axis.vertical,
            ),
          ),
        ),
        _newGameBtn(),
        Text("Se creará un juego con solo las preguntas favoritas",
            style: TextStyle(color: Colors.blue)),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  _favListTile(Question question) {
    return Consumer(
      builder: (_, QuestionProvider provider, __) => ListTile(
        title: Text(question.description, overflow: TextOverflow.ellipsis),
        trailing: InkWell(
          onTap: () async {
            question.isFavourite = false;
            await provider.removeFromFavourites(question);
          },
          child: Icon(
            Icons.delete_forever_rounded,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  Widget _newGameBtn() {
    final btnStyle = TextButton.styleFrom(
        textStyle: TextStyle(color: Colors.blue, fontSize: 17),
        backgroundColor: Colors.greenAccent);
    return ElevatedButton(
      onPressed: () {
        //Navigator.push(context, MaterialPageRoute(builder: (context)=>FavouriteQuestionPage())); //just to remember the other way
        Navigator.pushNamed(context, Constants.routes.favouriteQuestionPage);
      },
      child: Text(
        'Crear juego',
        style: TextStyle(color: Colors.black87),
      ),
      style: btnStyle,
    );
  }
}
