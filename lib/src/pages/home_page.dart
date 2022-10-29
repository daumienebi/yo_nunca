import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:yo_nunca/src/utils/constants.dart';
import 'package:yo_nunca/src/widgets/widgets.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //physics: const AlwaysScrollableScrollPhysics(),
    return Scaffold(
      //drawerScrimColor: Colors.red,
      drawer: MyDrawer(),
      appBar: NewGradientAppBar(
        //title: Text(Constants.title),
        centerTitle: true,
        title:
        Container(
          decoration: BoxDecoration(
            //color: Colors.red,
            image: DecorationImage(
              image: AssetImage('assets/images/beer.png'),
              fit: BoxFit.contain,
            )
          ),
          height: 40,
          width: 150,
          //child: Text('YO NUNCA')
        ),
        gradient: const LinearGradient(colors: [Colors.amberAccent,Colors.amberAccent,Colors.white]),//Change it later
      ),
      backgroundColor: Colors.orange[50],
      floatingActionButton: FloatingActionButton(
        tooltip: 'Añadir nueva categoría',
        child: Icon(Icons.add),
        onPressed: (){showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now());},//Just trying it out
      ),
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomePageList(),
              _goToFavouritesBtn()
            ],
          ),
        ),
      ),
    );
  }

  Widget _goToFavouritesBtn(){
    //?
    return ElevatedButton(onPressed: (){},
        child: Text('Favorítos ❤️',style: TextStyle(color: Colors.white),),
      style: TextButton.styleFrom(
        backgroundColor: Colors.black,
        minimumSize: Size(150,40),
        maximumSize: Size(300,80),
        side: BorderSide(width: 10.0)
      ),
    );
  }
}