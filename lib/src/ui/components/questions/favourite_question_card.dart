import 'package:appinio_swiper/appinio_swiper.dart';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'package:yo_nunca/src/utils/messages.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavouriteQuestionCard extends StatefulWidget {
  const FavouriteQuestionCard({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _FavouriteQuestionCardState();
}

class _FavouriteQuestionCardState extends State<FavouriteQuestionCard> {
  List<Widget> cards = [];
  List<Question> questions = [];
  bool visible = false;
  final ValueNotifier<bool> isPortrait = ValueNotifier<bool>(true);

  @override
  void initState() {
    loadCards();
    super.initState();
  }

  Future<List<Question>> _getData() {
    //to simulate fake loading :)
    return Future.delayed(Duration(seconds: 2), () => questions);
  }

  void loadCards(){
    QuestionProvider provider =
        Provider.of<QuestionProvider>(context, listen: false);
    questions = provider.favouriteQuestions;
    for (var question in questions) {
      cards.add(questionCard(question.description));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return OrientationBuilder(
      builder: (BuildContext context,Orientation orientation){
          isPortrait.value = orientation == Orientation.portrait;
          return Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  questionAppinioSwiper(),
                  SizedBox(height: 5),
                  Center(child: Visibility(child: restartButton(),
                      visible: visible))
                ]),
          );
      },
    );
  }

  Widget questionAppinioSwiper() {
    // Added the future just to fake a loading screen, data will always be
    // available in the favourite list to create the new game
    final AppinioSwiperController controller = AppinioSwiperController();
    return FutureBuilder(
        future: _getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
          } else if (snapshot.hasError) {
            return Messages.errorWidget(AppLocalizations.of(context)!.questionsCouldNotBeLoaded);
          } else {
            return Messages.circularLoadingWidget(AppLocalizations.of(context)!.creatingGame);
          }
          //main content to return with the data
          return Column(
            children: [
              Text(AppLocalizations.of(context)!.swipeInAnyDirection,
                style: TextStyle(fontSize: 15,color: Colors.black54),
                textAlign: TextAlign.center,),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.48,//48%
                width: isPortrait.value == true ? 370 : 500,
                child: AppinioSwiper(
                  unlimitedUnswipe: true,
                  controller: controller,
                  cards: cards,
                  onSwipe: _swipe,
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 10,
                    bottom: 30,
                  ),
                ),
              ),
            ],
          );
        });
  }

  Widget questionCard(String question) {
    return ValueListenableBuilder(
      valueListenable: isPortrait,
      builder: (BuildContext context,_,Widget ?child){
        return Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.teal[50],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(children: [
            SizedBox(
              // make the questions readable in landscape mode
              height: isPortrait.value ? 200 : 100,
              width: double.infinity,
              child: Center(
                child: Text(
                  question,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.varelaRound(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ]),
        );
      },
    );
  }

  void _swipe(int index, AppinioSwiperDirection direction) {
    if (cards.isEmpty) {
      setState(() {
        visible = true;
      });
    }
  }

  Widget restartButton() {
    final btnStyle = TextButton.styleFrom(
        textStyle: TextStyle(color: Colors.blue, fontSize: 16),
        backgroundColor: Colors.greenAccent,
        shape: StadiumBorder()
    );
    return ElevatedButton(
      onPressed: () {
        if (cards.isEmpty) {
          setState(() {
            loadCards();
          });
        }
        //Hide the Restart button after reloading the cards
        setState(() {
          visible = false;
        });
      },
      child: Text(AppLocalizations.of(context)!.restartGame,style: TextStyle(color: Colors.black87),),
      style: btnStyle,
    );
  }
}
