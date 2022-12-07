import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'package:yo_nunca/src/utils/constants.dart';
import 'dart:developer' as dev;

import 'package:yo_nunca/src/utils/messages.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key = const Key("favouritePage")});//wtf

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  List<Question> _favouriteQuestions = [];
  String _categoryDesc = '';

  getCategory(int categoryId) async{
    QuestionProvider prov = Provider.of<QuestionProvider>(context,listen: true);
    Category c = await prov.getCategory(categoryId);
    dev.log(c.description);
    _categoryDesc = c.description;
  }

  Future<List<Question>> _favouriteQuestionsFuture() async{
    QuestionProvider provider = Provider.of<QuestionProvider>(context,listen: true);
    await provider.getFavouriteQuestions(); // Await on your future.
    var questions = provider.favouriteQuestions;

    return questions;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NewGradientAppBar(
          title: Text('Preguntas favoritas'),
          gradient: const LinearGradient(
              colors: [Colors.amber, Colors.white38, Colors.amber]),
        ),
        backgroundColor: Colors.orange[100],
        body:
          FutureBuilder(
            future: _favouriteQuestionsFuture(),
            builder: (BuildContext context,AsyncSnapshot snapshot){
              List<Widget> futureWidgets = [];
              if(snapshot.hasData){
                _favouriteQuestions =  snapshot.data;
              }else if(snapshot.hasError){
                futureWidgets = <Widget>[
                  Messages.errorWidget(
                      'No se pudieron cargar las preguntas :('),
                ];
              }
              return
                Column(
                    children: [
                      Expanded(
                          child: _favouriteQuestions.isNotEmpty ?
                          _favouriteQuestionsWidget(_favouriteQuestions) :
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/love.png',scale: 7,),
                                Text("Todavía no has añadido preguntas favoritas"
                                  ,style: TextStyle(
                                      fontSize: 17,
                                    color: Colors.black54
                                  ),
                                ),
                              ],
                            )
                          )
                      ),
                    ]
                );
            },
          )
    );
  }

  Widget _favouriteQuestionsWidget(List<Question>favouriteQuestions){
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.all(5),
            child: ListView.separated(
              itemBuilder: (_, int index) => Dismissible(
                child: _favListTile(favouriteQuestions[index]),
                //onDismissed: provider.removeFromFavourites(favouriteQuestions[index]),--dunno wtf is wrong with this shitty line of code
                key: UniqueKey(),
                background: Icon(Icons.delete_forever_rounded,color: Colors.red,),
              ),
              separatorBuilder: (context,index) => Divider(color: Colors.red[100],height: 1,),
              itemCount: favouriteQuestions.length,
              scrollDirection: Axis.vertical,
            ),
          ),
        ),
        _newGameBtn(),
        Text("Se creará un juego con solo las preguntas favoritas",style: TextStyle(color: Colors.blue)),
        SizedBox(height: 20,)
      ],
    );
  }

  _favListTile(Question question) {
    return Consumer(
      builder: (_, QuestionProvider provider, __) =>
      ListTile(
        title: Text(question.description,overflow: TextOverflow.ellipsis),
        subtitle: Text(_categoryDesc.toString()),
        trailing: InkWell(
            onTap: () async{
              question.isFavourite = false;
              await provider.removeFromFavourites(question);
            },
            child: Icon(Icons.delete_forever_rounded,color: Colors.red,),
        ),
      ),
    );
  }

  Widget _newGameBtn() {
    final btnStyle = TextButton.styleFrom(
        textStyle: TextStyle(color: Colors.blue, fontSize: 17),backgroundColor: Colors.greenAccent);
    return ElevatedButton(
      onPressed: () {
        //Navigator.push(context, MaterialPageRoute(builder: (context)=>FavouriteQuestionPage())); //just to remember the other way
        Navigator.pushNamed(context, Constants.routes.favouriteQuestionPage);
      },
      child: Text('Crear juego'),
      style: btnStyle,
    );
  }
}
