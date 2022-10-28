import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/models/questions.dart';
import 'package:yo_nunca/src/utils/constants.dart';
import 'package:yo_nunca/src/utils/test_data.dart';

class HomePageList extends StatelessWidget{
  const HomePageList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final int widgetHeight = 200;
    return Column(
      children:[
        _getNormalLevelWidget(context),
        _getIntermediateLevelWidget(context),
        _getHotLevelWidget(context),
      ] 
    );
  }
}
/* Normal */
Widget _getNormalLevelWidget(context) {

  //TestData data = new TestData();
  //List<Question> _questionsList = data.questionsList;
  return Container(
    margin: const EdgeInsets.all(15),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/images/bar.jpg'),
          colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.2), BlendMode.saturation),
          fit: BoxFit.fill
      ),
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),

    height: Constants.homePageWidgetHeight,
    width: double.infinity,
    child: const Text("NORMAL",
      textAlign: TextAlign.left, style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 30,
          color: Colors.white,
          fontFamily: 'OoohBaby'
      ),
    ),
  );
}

/* Intermedio */
Widget _getIntermediateLevelWidget(context){
  //TestData data = new TestData();
  //List<Question> _questionsList = data.questionsList;
  return Container(
    margin: const EdgeInsets.all(15),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/images/smirk_face.png'),
          colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.2), BlendMode.saturation),
          fit: BoxFit.fill
      ),
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),

    height: Constants.homePageWidgetHeight,
    width: double.infinity,
    child: const Text("INTERMEDIO",
      textAlign: TextAlign.left,style: TextStyle(
          fontWeight: FontWeight.bold,fontSize: 30,
          color: Colors.deepOrangeAccent,
          fontFamily: 'OoohBaby'
      ),
    ),
  );
}

/* Random */
Widget _getLevelWidget(context){
  //TestData data = new TestData();
  //List<Question> _questionsList = data.questionsList;
  return Container(
    margin: const EdgeInsets.all(15),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/images/picante.jpg'),
          colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.2), BlendMode.saturation),
          fit: BoxFit.fill
      ),
      color: Colors.red,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    height: Constants.homePageWidgetHeight,
    width: double.infinity,
    child: const Text("PICANTE",
      textAlign: TextAlign.left,style: TextStyle(
          fontWeight: FontWeight.bold,fontSize: 30,
          color: Colors.red,
          fontFamily: 'OoohBaby'
      ),
    ),
  );
}

/* Picante*/
Widget _getHotLevelWidget(context){
  //TestData data = new TestData();
  //List<Question> _questionsList = data.questionsList;
  return Container(
    margin: const EdgeInsets.all(15),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/images/picante.jpg'),
          colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.2), BlendMode.saturation),
          fit: BoxFit.fill
      ),
      color: Colors.red,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    height: Constants.homePageWidgetHeight,
    width: double.infinity,
    child: const Text("PICANTE",
      textAlign: TextAlign.left,style: TextStyle(
          fontWeight: FontWeight.w900,fontSize: 30,
          color: Colors.red,
          fontFamily: 'OoohBaby'
      ),
    ),
  );
}