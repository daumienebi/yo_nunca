import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'package:yo_nunca/src/utils/constants.dart';
// ignore_for_file: prefer_const_constructors

class CategoryListPage extends StatelessWidget{
  const CategoryListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int tabLength = 2;
    CategoryProvider provider = Provider.of<CategoryProvider>(context, listen: true);
    List<Category> _defaultCategories = provider.defaultCategories;
    List<Category> _categories = provider.categories;
      return DefaultTabController(
        length: tabLength,
        child: Scaffold(
            appBar: NewGradientAppBar(
              title: Text('Mis Categorías'),
              bottom: TabBar(
                indicatorColor: Colors.cyan,
                tabs: [
                  Tab(child: _categoriesCountWidget(_defaultCategories.length,'Por Defecto'),),
                  Tab(child: _categoriesCountWidget(_categories.length,'Agregados'),),
                ],
              ),
              gradient: const LinearGradient(
                  colors: [Colors.amber, Colors.white70, Colors.amber]),
            ),
            backgroundColor: Colors.orange[50],
            body: TabBarView(
                children: [
                  _defaultCategoryContents(_defaultCategories),
                  _userCategoryContents(_categories,context)
                ]
            )
        ),
      );
  }

  _categoriesCountWidget(int number,String tabName){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Text(tabName),
        SizedBox(width: 5,),
        Container(
        child: Center(child: Text(number.toString(),textAlign: TextAlign.center,style: TextStyle(color: Colors.white),)),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(15),
        ),
        height: 30,
        width: 50,
      ),]
    );
  }

  Widget _defaultCategoryContents(List<Category> categories){
    return Container(
      margin: EdgeInsets.only(top: 7),
      child: Column(
        children:[
          Text("Las siguientes categorias no se pueden modificar.",style: TextStyle(color: Colors.black54,fontSize: 15),),
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index){
                return _catgegoryTile(categories[index],false);
              },
              separatorBuilder: (context,index) => Divider(height: 3,),
              itemCount: categories.length
        ),
          ),
        ]
      ),
    );
  }

  Widget _userCategoryContents(List<Category> categories,BuildContext context){
    return categories.isEmpty ? _noCategoryWidget(context) :
      Container(
      margin: EdgeInsets.only(top: 7),
      child: Column(
          children:[
            Expanded(
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int index){
                    return _catgegoryTile(categories[index],true);
                  },
                  separatorBuilder: (context,index) => Divider(height: 3,),
                  itemCount: categories.length
              ),
            ),
          ]
      ),
    );
  }

  Widget _noCategoryWidget(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("Todavía no has agregado una categoría.",style: TextStyle(color: Colors.black54,fontSize: 16),)),
        ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, Constants.routes.newCategory);
            },
            child: Text("Añadir categoria"),
          style: TextButton.styleFrom(backgroundColor: Colors.greenAccent),
        )
      ],
    );
  }

  Widget _catgegoryTile(Category category,bool defaultCategory){
    final mainTxtStyle = TextStyle(fontSize: 25,color: Colors.cyan,fontFamily: 'OoohBaby',fontWeight: FontWeight.bold);
    final countTxtSyle = TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal);
    final editBtn = TextButton.styleFrom(backgroundColor: Colors.lightGreen);
    final deleteBtn = TextButton.styleFrom(backgroundColor: Colors.redAccent);
    return Center(
      child: Consumer(
        builder: (BuildContext context, QuestionProvider provider,__){
          return Container(
            padding: EdgeInsets.all(7),
            margin: EdgeInsets.all(10),
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category.description,style: mainTxtStyle,textAlign: TextAlign.left,),
                RichText(text: TextSpan(text: '${provider.getNumberOfQuestionsPerCategory(category.id!)} preguntas',style: countTxtSyle)),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: defaultCategory,
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.pushNamed(context, Constants.routes.categoryManagementPage,arguments: category);//send the category to be edited to the next page
                          },
                          child: Text(
                            'Editar',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500
                            ),
                          ),style: editBtn,

                        ),
                      ),
                      SizedBox(width: 10,),
                      Visibility(
                        visible: defaultCategory,
                        child: ElevatedButton(
                          onPressed: (){},
                          child: Text(
                            'Borrar',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500
                            ),
                          ),style: deleteBtn,

                        ),
                      ),
                    ],
                  )
                )
              ],
            ),
          );
        },
      ),
    );
  }
}