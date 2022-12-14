import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'package:yo_nunca/src/ui/pages/category_management_page.dart';
import 'package:yo_nunca/src/utils/constants.dart';
// ignore_for_file: prefer_const_constructors

class CategoryListPage extends StatelessWidget {
  const CategoryListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int tabLength = 2;
    CategoryProvider provider =
        Provider.of<CategoryProvider>(context, listen: true);
    List<Category> _categories, _defaultCategories = [];
    _defaultCategories = provider.defaultCategories;
    _categories = provider.newCategories;
    return DefaultTabController(
      length: tabLength,
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () =>
                  Navigator.pushNamed(context, Constants.routes.newCategory)),
          appBar: AppBar(
            title: Text('Gestionar Categorías'),
            bottom: TabBar(
              indicatorColor: Colors.orange[50],
              tabs: [
                Tab(
                  child:
                      categoryTabHeader(_categories.length, 'Mis Categorías'),
                ),
                Tab(
                  child: categoryTabHeader(
                      _defaultCategories.length, 'Por Defecto'),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            userCategoryContents(_categories, context),
            defaultCategoryContents(_defaultCategories)
          ])),
    );
  }

  categoryTabHeader(int number, String tabName) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(tabName),
      SizedBox(
        width: 5,
      ),
      Container(
        child: Center(
            child: Text(
          number.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        )),
        decoration: BoxDecoration(
          color: Colors.red[600],
          borderRadius: BorderRadius.circular(15),
        ),
        height: 30,
        width: 50,
      ),
    ]);
  }

  Widget defaultCategoryContents(List<Category> categories) {
    return Container(
      margin: EdgeInsets.only(top: 7),
      child: Column(children: [
        Text(
          "Las siguientes categorías no se pueden modificar.",
          style: TextStyle(color: Colors.black54, fontSize: 15),
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return CategoryTile(
                    category: categories[index], defaultCategory: false);
              },
              separatorBuilder: (context, index) => Divider(
                    height: 3,
                  ),
              itemCount: categories.length),
        ),
      ]),
    );
  }

  Widget userCategoryContents(List<Category> categories, BuildContext context) {
    return categories.isEmpty
        ? noCategoryWidget(context)
        : Container(
            margin: EdgeInsets.only(top: 7),
            child: Column(children: [
              Expanded(
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return CategoryTile(
                          category: categories[index], defaultCategory: true);
                    },
                    separatorBuilder: (context, index) => Divider(
                          height: 3,
                        ),
                    itemCount: categories.length),
              ),
            ]),
          );
  }

  Widget noCategoryWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
          "Todavía no has agregado una categoría.",
          style: TextStyle(color: Colors.black54, fontSize: 16),
        )),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, Constants.routes.newCategory);
          },
          child: Text(
            "Añadir categoría",
            style: TextStyle(color: Colors.black87),
          ),
          style: TextButton.styleFrom(backgroundColor: Colors.greenAccent),
        )
      ],
    );
  }
}

class CategoryTile extends StatefulWidget {
  final Category category;
  final bool defaultCategory;
  const CategoryTile(
      {Key? key, required this.category, required this.defaultCategory})
      : super(key: key);

  @override
  State<CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  late Future<int> countFuture;

  Future<int> getCount() async {
    QuestionProvider provider =
        Provider.of<QuestionProvider>(context, listen: false);
    int count = await provider.countQuestionsPerCategory(widget.category.id!);
    return count;
  }

  @override
  void initState() {
    countFuture = getCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mainTxtStyle = TextStyle(
        fontSize: 30,
        color: Colors.cyan[400],
        fontFamily: 'OoohBaby',
        //fontWeight: FontWeight.w500
    );
    final countTxtStyle = TextStyle(
        fontSize: 18, color: Colors.white, fontWeight: FontWeight.normal);
    final editBtn = TextButton.styleFrom(backgroundColor: Colors.lightGreen);
    final deleteBtn = TextButton.styleFrom(backgroundColor: Colors.redAccent);
    CategoryProvider provider =
        Provider.of<CategoryProvider>(context, listen: true);
    // TODO: implement build
    return Center(
        child: Container(
      padding: EdgeInsets.all(7),
      margin: EdgeInsets.all(10),
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.black87, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.category.description,
            style: mainTxtStyle,
            textAlign: TextAlign.left,
          ),
          FutureBuilder<int>(
              future: countFuture,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  String text = '';
                  bool plural = snapshot.data > 1;
                  text = plural ? 'preguntas' : 'pregunta';
                  return RichText(
                      text: TextSpan(
                          text: snapshot.data > 0
                              ? '${snapshot.data} $text'
                              : 'sin preguntas',
                          style: countTxtStyle));
                } else {
                  return RichText(
                      text: TextSpan(
                          text: 'cargando...',
                          style: TextStyle(
                              color: Colors.lightGreen[100], fontSize: 16)));
                }
              }),
          Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: widget.defaultCategory,
                child: ElevatedButton(
                  //Using MaterialPageRoute because a callBack function needs to
                  // be passed to the category management page in order to
                  // refresh the number of user categories in the second tab
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CategoryManagementPage(
                            onClose: () => countFuture = getCount()),
                        settings: RouteSettings(arguments: widget.category)));
                  },
                  child: Text(
                    'Editar',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  style: editBtn,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Visibility(
                visible: widget.defaultCategory,
                child: ElevatedButton(
                  onPressed: () async {
                    int returnValue = await confirmDeleteWidget();
                    returnValue == 1
                        ? await provider.deleteCategory(widget.category)
                        : null;
                  },
                  child: Text(
                    'Borrar',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  style: deleteBtn,
                ),
              ),
            ],
          ))
        ],
      ),
    ));
  }

  /// Shows a dialog to confirm if the user wants to carry-out the action
  Future<int> confirmDeleteWidget() async {
    int returnValue = 0;
    await showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Confirmar borrado"),
              content:
                  Text("Seguro que quieres borrar la categoría y todas las "
                      "preguntas que tiene ?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(
                          context, 'Return value'); //Return value to the caller
                    },
                    child: Text(
                      'No',
                      style: TextStyle(color: Colors.red),
                    )),
                TextButton(
                    onPressed: () {
                      returnValue = 1;
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Si',
                      style: TextStyle(color: Colors.green),
                    ))
              ],
            ));
    return Future.value(returnValue);
  }
}
