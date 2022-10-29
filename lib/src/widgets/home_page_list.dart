import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/models/questions.dart';
import 'package:yo_nunca/src/utils/constants.dart';
import 'package:yo_nunca/src/utils/my_decorations.dart';
import 'package:yo_nunca/src/utils/test_data.dart';

class HomePageList extends StatelessWidget{
  const HomePageList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children:[
        InkWell(child: _getNormalLevelWidget(context),onTap: (){
          Navigator.pushNamed(context, Constants.routes.questionsPage,arguments: 'MODO: NORMAL');
        },),
        InkWell(child: _getIntermediateLevelWidget(context),onTap: (){
          Navigator.pushNamed(context, Constants.routes.questionsPage,arguments: 'MODO: INTERMEDIO');
        },),
        InkWell(child: _getHotLevelWidget(context), onTap: (){
          Navigator.pushNamed(context, Constants.routes.questionsPage,arguments: 'MODO: PICANTE');
        },),
      ] 
    );
  }
}
/* Normal */
Widget _getNormalLevelWidget(context) {

  //TestData data = new TestData();
  //List<Question> _questionsList = data.questionsList;
  return Container(
    margin: const EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    decoration: MyDecorations.homePageBoxDecoration('assets/images/bar.jpg'),
    height: Constants.homePageWidgetHeight,
    width: double.infinity,
    child: MyDecorations.homePageBoxText('NORMAL', Colors.white)
  );
}

/* Intermedio */
Widget _getIntermediateLevelWidget(context){
  //TestData data = new TestData();
  //List<Question> _questionsList = data.questionsList;
  return Container(
    margin: const EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    decoration: MyDecorations.homePageBoxDecoration('assets/images/smirk_face.png'),
    height: Constants.homePageWidgetHeight,
    width: double.infinity,
    child: MyDecorations.homePageBoxText('INTERMEDIO', Colors.white)
  );
}

/* Random */
/*
Widget _getLevelWidget(context){
  //TestData data = new TestData();
  //List<Question> _questionsList = data.questionsList;
  return Container(
    margin: const EdgeInsets.all(15),
    padding: EdgeInsets.all(10),
    decoration: MyDecorations.homePageBoxDecoration('assets/images/smirk_face.png'),
    height: Constants.homePageWidgetHeight,
    width: double.infinity,
    child: MyDecorations.homePageBoxText('PICANTE', Colors.red)
  );
}
*/

/* Picante*/
Widget _getHotLevelWidget(context){
  //TestData data = new TestData();
  //List<Question> _questionsList = data.questionsList;
  return Container(
    margin: const EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    decoration: MyDecorations.homePageBoxDecoration('assets/images/picante.jpg'),
    height: Constants.homePageWidgetHeight,
    width: double.infinity,
    child: MyDecorations.homePageBoxText('PICANTE', Colors.deepOrange)
  );
}