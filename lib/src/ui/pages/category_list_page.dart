import 'package:flutter/material.dart';
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
    List<Category> _categories,_defaultCategories = [];
    _defaultCategories = provider.defaultCategories;
    _categories = provider.newCategories;
      return DefaultTabController(
        length: tabLength,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: ()=> Navigator.pushNamed(context, Constants.routes.newCategory)
          ),
            appBar: AppBar(
              title: Text('Mis Categorías'),
              bottom: TabBar(
                indicatorColor: Colors.cyan,
                tabs: [
                  Tab(child: _categoriesCountWidget(_defaultCategories.length,'Por Defecto'),),
                  Tab(child: _categoriesCountWidget(_categories.length,'Agregados'),),
                ],
              ),
            ),
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
          color: Colors.black,
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
                return CategoryTile(category:categories[index],defaultCategory: false);
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
                    return CategoryTile(category:categories[index],defaultCategory: true);
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
            child: Text("Añadir categoria",style:
            TextStyle(color: Colors.black87),),
          style: TextButton.styleFrom(backgroundColor: Colors.greenAccent),
        )
      ],
    );
  }
}

class CategoryTile extends StatefulWidget{
  final Category category;
  final bool defaultCategory;
  const CategoryTile({Key? key,required this.category,
    required this.defaultCategory}) : super(key: key);

  @override
  State<CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  late Future<int?> countFuture;

  Future<int?> getCount() async {
    QuestionProvider provider = Provider.of<QuestionProvider>(context,listen: false);
    int count = await provider.countQuestionsPerCategory(widget.category.id!);
    return count;
  }

  @override
  void initState(){
    countFuture = getCount();
    super.initState();
  }

  @override
  void didChangeDependencies(){
    //rebuild the widget in case a change was made
    countFuture = getCount();
    super.didChangeDependencies();
}

  @override
  Widget build(BuildContext context) {
    final mainTxtStyle = TextStyle(fontSize: 20,color: Colors.cyan,fontFamily:
      'OoohBaby',fontWeight: FontWeight.bold);
    final countTxtStyle = TextStyle(fontSize: 18,color: Colors.white,fontWeight:
      FontWeight.normal);
    final editBtn = TextButton.styleFrom(backgroundColor: Colors.lightGreen);
    final deleteBtn = TextButton.styleFrom(backgroundColor: Colors.redAccent);
    CategoryProvider provider = Provider.of<CategoryProvider>(context,
        listen: true);
    // TODO: implement build
    return Center(
        child:
        Container(
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
              Text(widget.category.description,style: mainTxtStyle,textAlign: TextAlign.left,),
              FutureBuilder<int?>(
                  future: countFuture,
                  builder: (BuildContext context,AsyncSnapshot snapshot){
                    if(snapshot.hasData){
                      String text = '';
                      bool plural = snapshot.data > 1;
                      text = plural ? 'preguntas' : 'pregunta';
                      return
                        RichText(
                            text: TextSpan(text:snapshot.data > 0 ?
                            '${snapshot.data} $text' : 'sin preguntas',
                                style: countTxtStyle)
                        );
                    }else{
                      return RichText(
                          text: TextSpan(text:'cargando...' ,
                              style: TextStyle(
                                  color: Colors.lightGreen[100],
                                  fontSize: 16)
                          )
                      );
                    }
                  }
              ),
              Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: widget.defaultCategory,
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.pushNamed(context,
                                Constants.routes.categoryManagementPage,
                                arguments: widget.category
                            );//send the category to be edited to the next page
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
                        visible: widget.defaultCategory,
                        child: ElevatedButton(
                          onPressed: () async{
                            int returnValue = await _confirmDeleteWidget();
                            returnValue == 1 ?
                            await provider.deleteCategory(widget.category) : null;
                          },
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
        )
    );
  }

  Future<int> _confirmDeleteWidget () async{
    int returnValue  = 0;
    await showDialog(
        context: context,
        builder: (_) =>AlertDialog(
          title: Text("Confirmar borrado"),
          content: Text("Seguro que quieres borrar la categoría y todas las "
              "preguntas que tiene ?"),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context,'Return value');//Return value to the caller
            },
                child: Text('No',style: TextStyle(color: Colors.red),)),
            TextButton(onPressed: (){
              returnValue = 1;
              Navigator.pop(context);
            }, child: Text('Si',style: TextStyle(color: Colors.green),))

          ],
        )
    );
    return Future.value(returnValue);
  }
}