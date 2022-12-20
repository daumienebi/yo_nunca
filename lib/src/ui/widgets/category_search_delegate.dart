import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'dart:developer' as dev;
import 'package:yo_nunca/src/utils/constants.dart';
// ignore_for_file: prefer_const_constructors

class CategorySearchDelegate extends SearchDelegate {
  //Add a hint text to override the default one
  final String? hintText;
  CategorySearchDelegate({required this.hintText});

  @override
  String ? get searchFieldLabel => hintText;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
        tooltip: 'Cerrar',
        highlightColor: Colors.redAccent,
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); //close the search bar
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    CategoryProvider provider =
        Provider.of<CategoryProvider>(context, listen: true);
    //get the category names from the database
    List<Category> suggestions = provider.categories;
    late Category category;
    final suggestionList = query.isEmpty
        ? []
        : suggestions
            .where((category) => category.description.contains(query))
            .toList();
    if(suggestionList.isNotEmpty){
      category = suggestionList[0];
    }else{
      //To avoid an error that showed up whe trying to close the detail page
      category = Category(id:0,description: '',imageRoute: '');
    }

    return SingleChildScrollView(child: CategoryDetail(category: category));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    CategoryProvider provider =
        Provider.of<CategoryProvider>(context, listen: false);
    //get the category names from the database to use them as suggestions
    List<Category> categoryList = provider.categories;
    List<Category> suggestions = categoryList.where((category) {
      final categoryName = category.description.toLowerCase();
      final userInput = query.toLowerCase();
      return categoryName.contains(userInput);
    }).toList();
    return FutureBuilder(
        future: provider.getCategories(),
        builder: (_, AsyncSnapshot data) {
          return ListView.separated(
              itemBuilder: (BuildContext context,int index) {
                final suggestion = suggestions[index];
                return ListTile(
                  leading: Icon(
                    Icons.category,
                    color: Colors.amber,
                    size: 35,
                  ),
                  title: Text(suggestion.description),
                  onTap: () {
                    query = suggestion.description;
                    showResults(context);
                  },
                );
              },
              separatorBuilder: (context, index) => Divider(height: 20),
              itemCount: suggestions.length);
        });
  }
}

class CategoryDetail extends StatefulWidget {
  final Category? category;
  const CategoryDetail({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  int _questionsCount = 0;

  Future<void> getCount() async {
    QuestionProvider provider = Provider.of<QuestionProvider>(context,listen: false);
    List<Question> questionsPerCategory = await provider.getQuestionsPerCategory(widget.category!.id!);
    int count = questionsPerCategory.length;
    _questionsCount = count;
    dev.log('category :' + widget.category.toString());
    dev.log('count :' + count.toString());
    dev.log('_questionsCount :' + _questionsCount.toString());

  }

  @override
  void initState(){
    getCount();
    super.initState();
  }

  @override
  void didChangeDependencies(){
    //rebuild the widget in case a change was made
    getCount();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(children: [
        Container(
          padding: EdgeInsets.only(top: 10),
          height: 200,
          width: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(
                  'assets/images/question2.png',
                  fit: BoxFit.cover,
                )),
          ),
        ),
        SizedBox(height: 5,),
        ListTile(
            title: Text(
              'Número de preguntas :',
              style: TextStyle(fontSize: 17, color: Colors.white),
            ),
            tileColor: Colors.black87,
            leading: Icon(
              Icons.question_answer_outlined,
              color: Colors.white,
            ),
            trailing: Text('$_questionsCount',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        SizedBox(height: 25),
        //Play and close button
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context,
                    Constants.routes.questionsPage,arguments: widget.category);
              },
              child: Text(
                "Jugar",
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                fixedSize: Size(100, 40),
              ),
            ),
            SizedBox(width: 15),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cerrar",
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.redAccent[200],
                fixedSize: Size(100, 40),
              ),
            )
          ],
        )
      ])
    );
  }
}
