import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text("#Test"),
        gradient: const LinearGradient(colors: [Colors.greenAccent,Colors.white60,Colors.cyan]),//Change it later
      ),
      body:  Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          height: 300,
          width: 300,
          child: Center(child: const Text("YO NUNCA",textAlign: TextAlign.justify,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30, color: Colors.grey),)),
        ),
      ),
    );
  }

}