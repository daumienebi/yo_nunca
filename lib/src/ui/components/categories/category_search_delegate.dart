import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'package:yo_nunca/src/utils/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yo_nunca/src/utils/shared_preferences_util.dart';

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
        tooltip: AppLocalizations.of(context)!.close,
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
          return ListView.builder(
              itemBuilder: (BuildContext context,int index) {
                final suggestion = suggestions[index];
                return ListTile(
                  title: Text(suggestion.description.toLowerCase()),
                  onTap: () {
                    query = suggestion.description;
                    showResults(context);
                  },
                );
              },
              itemCount: suggestions.length
          );
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
    //Make the status bar the same as the scaffold color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent
    ));
    return Center(
      child: Column(children: [
        Container(
          padding: EdgeInsets.only(top: 10),
          height: 200,
          width: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child:
            //use the category image if it has one,if not then use the default
            //one
            widget.category!.imageRoute.isNotEmpty ?
            Card(
                //color: Theme.of(context).scaffoldBackgroundColor,
                color: Colors.white,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(widget.category!.imageRoute,
                  fit: BoxFit.cover,
                )
            ) : Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(
                  'assets/images/card-games.png',
                  fit: BoxFit.cover,
                )
            ),
          ),
        ),
        SizedBox(height: 5),
        ListTile(
            title: Text(
              AppLocalizations.of(context)!.numberOfQuestions,
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
            ElevatedButton(
              onPressed: () {
                SharedPreferencesUtil.setUserLastEntry();
                Navigator.popAndPushNamed(context,
                    AppRoutes.routeStrings.questionsPage,arguments: widget.category);
              },
              child: Text(
                AppLocalizations.of(context)!.play,
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                shape: StadiumBorder(),
                fixedSize: Size(100, 40),
              ),
            ),
            SizedBox(width: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                AppLocalizations.of(context)!.close,
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.redAccent[200],
                shape: StadiumBorder(),
                fixedSize: Size(100, 40),
              ),
            )
          ],
        )
      ])
    );
  }
}