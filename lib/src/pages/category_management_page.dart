import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:yo_nunca/src/models/category.dart';
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
    Category category = ModalRoute.of(context)!.settings.arguments as Category;
      return Scaffold(
        appBar: NewGradientAppBar(
          title: Text('Editar Categoría'),
          gradient: const LinearGradient(
              colors: [Colors.amber, Colors.white70, Colors.amber]),
        ),
        body: Container(height: 100,width: 100,color: Colors.black,)
      );
  }


}