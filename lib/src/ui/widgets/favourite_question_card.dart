import 'package:appinio_swiper/appinio_swiper.dart';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'package:yo_nunca/src/utils/messages.dart';

class FavouriteQuestionCard extends StatefulWidget {
  const FavouriteQuestionCard({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _FavouriteQuestionCardState();
}

class _FavouriteQuestionCardState extends State<FavouriteQuestionCard> {
  List<Widget> cards = [];
  List<Question> questions = [];
  bool visible = false;
  final ValueNotifier<bool> isPotrait = ValueNotifier<bool>(true);

  @override
  void initState() {
    _loadCards();
    super.initState();
  }

  Future<List<Question>> _getData() {
    //to simulate fake loading :)
    return Future.delayed(Duration(seconds: 2), () => questions);
  }

  void _loadCards(){
    QuestionProvider provider =
        Provider.of<QuestionProvider>(context, listen: false);
    questions = provider.favouriteQuestions;
    for (var question in questions) {
      cards.add(_questionCard(question.description));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return OrientationBuilder(
      builder: (BuildContext context,Orientation orientation){
          isPotrait.value = orientation == Orientation.portrait;
          return Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _questionAppinioSwiper(),
                  SizedBox(height: 5),
                  Center(child: Visibility(child: _restartButton(),
                      visible: visible))
                ]),
          );
      },
    );
  }

  Widget _questionAppinioSwiper() {
    // Added the future just to fake a loading screen, data will always be
    // available in the favourite list to create the new game
    final AppinioSwiperController controller = AppinioSwiperController();
    return FutureBuilder(
        future: _getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
          } else if (snapshot.hasError) {
            return Messages.errorWidget('Error: No se pudieron cargar '
                'las preguntas :(');
          } else {
            return Messages.circularLoadingWidget('Creando juego...');
          }
          //main content to return with the data
          return Column(
            children: [
              Text("Desliza en cualquier direcci??n para cambiar de pregunta.",
                style: TextStyle(fontSize: 15,color: Colors.black54),
                textAlign: TextAlign.center,),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.48,//48%
                width: isPotrait.value == true ? 370 : 500,
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

  Widget _questionCard(String question) {
    return ValueListenableBuilder(
      valueListenable: isPotrait,
      builder: (BuildContext context,_,Widget ?child){
        return Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black54)
            ],
          ),
          child: Column(children: [
            SizedBox(
              // make the questions readable in landscape mode
              height: isPotrait.value ? 200 : 100,
              width: double.infinity,
              child: Center(
                child: Text(
                  question,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Abel'),
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

  Widget _restartButton() {
    final btnStyle = TextButton.styleFrom(
        textStyle: TextStyle(color: Colors.blue, fontSize: 20),
        backgroundColor: Colors.greenAccent);
    return ElevatedButton(
      onPressed: () {
        if (cards.isEmpty) {
          setState(() {
            _loadCards();
          });
        }
        //Hide the Restart button after reloading the cards
        setState(() {
          visible = false;
        });
      },
      child: Text('Reiniciar juego',style: TextStyle(color: Colors.black87),),
      style: btnStyle,
    );
  }
}
