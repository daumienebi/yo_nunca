import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
import 'package:provider/provider.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'package:yo_nunca/src/ui/components/components.dart';
import 'package:yo_nunca/src/ui/pages/pages.dart';
import 'package:yo_nunca/src/utils/messages.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yo_nunca/src/utils/navigator_util.dart';

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
        appBar: CustomAppBar(
          title: Text(AppLocalizations.of(context)!.favouriteQuestions),
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
                Messages.errorWidget(AppLocalizations.of(context)!.questionsCouldNotBeLoaded),
              ];
            }
            return Column(children: [
              Expanded(
                  child: _favouriteQuestions.isNotEmpty
                      ? favouriteQuestionsWidget(_favouriteQuestions)
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
                                AppLocalizations.of(context)!.noFavouriteQuestionsYet,
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

  Widget favouriteQuestionsWidget(List<Question> favouriteQuestions) {
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.all(5),
            child: ListView.separated(
              itemBuilder: (_, int index) =>
                  favouriteListTile(favouriteQuestions[index]),
              separatorBuilder: (context, index) => Divider(
                color: Colors.transparent,
                height: 2,
              ),
              itemCount: favouriteQuestions.length,
              scrollDirection: Axis.vertical,
            ),
          ),
        ),
        createGameButton(),
        Text(AppLocalizations.of(context)!.newGameWithOnlyFavourites,
            style: TextStyle(color: Colors.blue),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget favouriteListTile(Question question) {
    return Consumer(
      builder: (_, QuestionProvider provider, __) => ListTile(
        title: Text(question.description, overflow: TextOverflow.ellipsis),
        trailing: InkWell(
          onTap: () async {
            question.isFavourite = false;
            await provider.removeFromFavourites(question);
          },
          child: Icon(
            Icons.delete_outline_sharp,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget createGameButton() {
    final btnStyle = TextButton.styleFrom(
        textStyle: TextStyle(color: Colors.blue, fontSize: 16),
        backgroundColor: Colors.greenAccent,
        shape: StadiumBorder()
    );
    return ElevatedButton(
      onPressed: () {
        //Navigator.pushNamed(context, AppRoutes.routeStrings.favouriteQuestionPage);
        Navigator.of(context).push(
            NavigatorUtil.createRouteWithSlideAnimation(newPage: FavouriteQuestionPage())
        );
      },
      child: Text(
        AppLocalizations.of(context)!.createGame,
        style: TextStyle(color: Colors.black87),
      ),
      style: btnStyle,
    );
  }
}
