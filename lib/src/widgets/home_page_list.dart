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
    padding: EdgeInsets.all(5),
    decoration: MyDecorations.homePageBoxDecoration('assets/images/cold_beer.jpg'),
    height: Constants.homePageWidgetHeight,
    width: 300,
    child: MyDecorations.homePageBoxText('NORMAL', Colors.white,null)
  );
}

/* Intermedio */
Widget _getIntermediateLevelWidget(context){
  return Container(
    margin: const EdgeInsets.all(10),
    padding: EdgeInsets.all(5),
    decoration: MyDecorations.homePageBoxDecoration('assets/images/shots.jpg'),
    height: Constants.homePageWidgetHeight,
    width: 300,
    child: MyDecorations.homePageBoxText('INTERMEDIO', Colors.white,null)
  );
}

/* Picante*/
Widget _getHotLevelWidget(context){
  return Container(
    margin: const EdgeInsets.all(10),
    padding: EdgeInsets.all(5),
    decoration: MyDecorations.homePageBoxDecoration('assets/images/smirk_face.png'),
    height: Constants.homePageWidgetHeight,
    width: 300,
    child: MyDecorations.homePageBoxText('PICANTE', Colors.red,Colors.white38)
  );
}