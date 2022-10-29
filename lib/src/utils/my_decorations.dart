import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDecorations{

  static BoxDecoration homePageBoxDecoration (String imgRoute){
    return BoxDecoration(
      image: DecorationImage(
          image: AssetImage(imgRoute),
          colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.2), BlendMode.saturation),
          fit: BoxFit.fill,
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
    );
  }

  static Text homePageBoxText(String content,Color textColor){
    return Text(content,
      textAlign: TextAlign.left,style: TextStyle(
          fontWeight: FontWeight.bold,fontSize: 35,
          color: textColor,
          fontFamily: 'OoohBaby'
      ),
    );
  }
}
