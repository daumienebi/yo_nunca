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
      borderRadius: const BorderRadius.all(Radius.circular(15)),
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

  static BoxDecoration homePageBoxDecorationWithoutImage_
      (){
    const double fillPercent = 56.23; // fills 56.23% for container from bottom
    const double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.5, 0.5];
    List<Color> colors = [Colors.white,Colors.red];
    return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      gradient :LinearGradient(
        colors: colors,
        stops: stops,
        end: Alignment.bottomCenter,
        begin: Alignment.topCenter,
      ),
    );
  }

  static BoxDecoration homePageBoxDecorationWithoutImage (){
    return const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      boxShadow: [
        BoxShadow(
          spreadRadius: 0.5,
          blurRadius: 0.5,
          //offset: Offset(0, 0), // changes position of shadow
        ),

      ],
      color: Colors.white,
      //color: Colors.white
    );
  }

  static Text homePageBoxText(String content,Color textColor){
    return Text(content,
      textAlign: TextAlign.center,style: TextStyle(
          fontWeight: FontWeight.bold,fontSize: 35,
          color: textColor,
          fontFamily: 'OoohBaby'
      ),
    );
  }

  static InputDecoration questionField(){
    return const InputDecoration(
        labelText: "Pregunta",
        labelStyle: TextStyle(
          color: Colors.black87
        ),
        icon: Icon(Icons.description,color: Colors.black87,),
        enabled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black87
          )
        )
    );
  }
}

