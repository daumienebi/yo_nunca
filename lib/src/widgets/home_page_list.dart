import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yo_nunca/src/utils/constants.dart';
import 'package:yo_nunca/src/utils/my_decorations.dart';

class HomePageList extends StatelessWidget{
  const HomePageList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children:[
        InkWell(child: _getNormalLevelWidget(context),onTap: (){
          Navigator.pushNamed(context, Constants.routes.questionsPage,arguments: 'NORMAL');
        },),
        InkWell(child: _getIntermediateLevelWidget(context),onTap: (){
          Navigator.pushNamed(context, Constants.routes.questionsPage,arguments: 'INTERMEDIO');
        },),
        InkWell(child: _getHotLevelWidget(context), onTap: (){
          Navigator.pushNamed(context, Constants.routes.questionsPage,arguments: 'PICANTE');
        },),
      ] 
    );
  }
}
/* Normal */
Widget _getNormalLevelWidget(context) {
  return Container(
    margin: const EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    decoration: MyDecorations.homePageBoxDecoration('assets/images/bar.jpg'),
    height: Constants.homePageWidgetHeight,
    width: double.infinity,
    child: MyDecorations.homePageBoxText('NORMAL', Colors.white,Colors.black45)
  );
}

/* Intermedio */
Widget _getIntermediateLevelWidget(context){
  return Container(
    margin: const EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    decoration: MyDecorations.homePageBoxDecoration('assets/images/smirk_face.png'),
    height: Constants.homePageWidgetHeight,
    width: double.infinity,
    child: MyDecorations.homePageBoxText('INTERMEDIO', Colors.deepOrange,Colors.white54)
  );
}

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
    child: MyDecorations.homePageBoxText('PICANTE', Colors.red,Colors.white24)
  );
}