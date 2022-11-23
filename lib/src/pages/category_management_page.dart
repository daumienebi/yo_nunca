import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
// ignore_for_file: prefer_const_constructors

class CategoryManagementPage extends StatefulWidget{
  const CategoryManagementPage({Key? key}) : super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _CategoryManagementPageState();
  }
}

class _CategoryManagementPageState extends State<CategoryManagementPage>{
  @override
  Widget build(BuildContext context){
      return Scaffold(
        appBar: NewGradientAppBar(
          title: Text('Mis Categorías'),
          gradient: const LinearGradient(
              colors: [Colors.amber, Colors.white70, Colors.amber]),
        ),
        body: _catgegoryTile()
      );
  }

  Widget _catgegoryTile(){
    final mainTxtStyle = TextStyle(fontSize: 25,color: Colors.white,fontFamily: 'OoohBaby',fontWeight: FontWeight.bold);
    final countTxtSyle = TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.normal);
    final editBtn = TextButton.styleFrom(backgroundColor: Colors.lightGreen);
    return Center(
      child: Container(
        padding: EdgeInsets.all(7),
        margin: EdgeInsets.all(15),
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(7)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("NORMAL",style: mainTxtStyle,textAlign: TextAlign.left,),
            RichText(text: TextSpan(text: '78 preguntas',style: countTxtSyle)),
            Center(child: ElevatedButton(onPressed: (){}, child: Text('Editar',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),style: editBtn,))
          ],
        ),
      ),
    );
  }
}