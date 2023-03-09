import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'package:yo_nunca/src/ui/widgets/round_app_bar.dart';
import 'package:yo_nunca/src/utils/messages.dart';
import 'package:yo_nunca/src/utils/my_decorations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// ignore_for_file: prefer_const_constructors

class CategoryManagementPage extends StatefulWidget {
  final VoidCallback? onClose;
  const CategoryManagementPage({Key? key,this.onClose}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CategoryManagementPageState();
  }
}

class _CategoryManagementPageState extends State<CategoryManagementPage> {
  String _question = "";
  String _category = "";
  List<Question> newQuestions = [];
  List<Question> questions = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController categoryNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  Future<List<Question>> getQuestions(Category category) async {
    QuestionProvider questionProvider =
    Provider.of<QuestionProvider>(context, listen: false);
    var data = await questionProvider.getQuestionsPerCategory(category.id!);
    questions = data;
    return data;
  }

  @override
  Widget build(BuildContext context) {
    final Category category = ModalRoute.of(context)!.settings.arguments as Category;

    categoryNameController.text = category.description;
    return Scaffold(
        appBar: RoundAppBar(title: Text(AppLocalizations.of(context)!.editCategory),homePage: false,),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              _formFields(category),
              _addQuestionBtn(category),
              Container(
                  padding: EdgeInsets.only(left: 15),
                  width: double.infinity,
                  child: Text(AppLocalizations.of(context)!.modifyQuestionText,
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  )),
              SizedBox(
                height: 10,
              ),
              Expanded(child:_questionsList(category)),
              _saveButton(category)
            ],
          ),
        ));

  }

  Widget _formFields(Category category) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: TextFormField(
              controller: categoryNameController,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black87
                  )
                ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: AppLocalizations.of(context)!.name,
                  labelStyle: TextStyle(color: Colors.black87,fontSize: 20),
                  hintText: AppLocalizations.of(context)!.introduceCategoryName,
                  suffixIcon: Icon(Icons.category)),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.introduceCategoryNameValidator;
                }
                return null;
              }),
        )
      ],
    );
  }

  Widget _addQuestionBtn(Category category) {
    return TextButton(
      onPressed: () => _popUpForm(null,category, false),
      child: Text(
        AppLocalizations.of(context)!.addQuestion,
        style: TextStyle(color: Colors.black),
      ),
      style: TextButton.styleFrom(backgroundColor: Colors.greenAccent),
    );
  }

  Future _popUpForm(Question? question,Category? category, bool isEditMode) {
    return showDialog(
      context: context,
      builder: (_) {
        TextEditingController _questionController = TextEditingController();
        _questionController.text = question?.description ?? "";
        return Consumer(builder: (_, CategoryProvider provider, __) {
          QuestionProvider questionProvider =
          Provider.of<QuestionProvider>(context, listen: true);
          return AlertDialog(
            title: isEditMode
                ? Text(AppLocalizations.of(context)!.modifyQuestion)
                : Text(AppLocalizations.of(context)!.addQuestion),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: _questionController,
                    decoration: MyDecorations.questionField(context),
                    maxLines: null,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  AppLocalizations.of(context)!.cancel,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () async {
                  //If the question is to be edited[edit = true], update it in the database
                  //else add a new question
                  if (isEditMode) {
                    //edit an existing question
                    _question = _questionController.text;
                   if(_question.isNotEmpty){
                     question!.description = _question;
                     int count = await questionProvider.modifyQuestion(question);
                   }
                  } else {
                    //new question
                    _question = _questionController.text;

                    if(_question.isNotEmpty){
                      var newQuestion = Question(
                          description: _question,
                          isFavourite: false,
                          categoryId: category!.id! //get the real category id
                      );
                      int count = await questionProvider.addQuestion(newQuestion);
                    }
                  }
                  Navigator.pop(context); // instead of dispose();
                },
                child: Text(
                    AppLocalizations.of(context)!.accept,
                    style: TextStyle(color: Colors.green)
                ),
              ),
            ],
          );
        });
      },
    );
  }

  _questionsList(Category category) {
    return FutureBuilder(
      future: getQuestions(category),
        builder: (BuildContext context,AsyncSnapshot snapshot){
          List<Widget> futureWidgets = [];
          if(snapshot.hasData){
            questions =  snapshot.data;
          }else if(snapshot.hasError){
            futureWidgets = <Widget>[
              Messages.errorWidget(
                  AppLocalizations.of(context)!.questionsCouldNotBeLoaded),
            ];
          }
          return ListView.separated(
            itemBuilder: (context, int index) {
              return _questionTile(questions[index]);
            },
            separatorBuilder: (ctx, index) => Divider(
              color: Colors.orange[50],//same as the background color
              height: 5,
            ),
            itemCount: questions.length,
          );
        }
    );
  }

  Widget _questionTile(Question question) {
    return ListTile(
      title: Text(question.description, overflow: TextOverflow.ellipsis),
      trailing: Consumer(
        builder: (BuildContext context,QuestionProvider provider,_){
          return InkWell(
            onTap: () async{
              await provider.deleteQuestion(question);
              setState(() {});
            },
            child: Icon(
              Icons.delete,
              color: Colors.red,
              size: 30,
            ),
          );
        },
      ),
      onTap: () {
        _popUpForm(question,null, true);
      },
      shape: Border.all(color: Colors.black26),
    );
  }

  Widget _saveButton(Category category) {
    final btnStyle = ElevatedButton.styleFrom(
      textStyle: TextStyle(fontSize: 17),
    );
    return Consumer(builder: (_, CategoryProvider provider, __) {
      return ElevatedButton(
          style: btnStyle,
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              _category = categoryNameController.text;
              String oldName = category.description;
              bool categoryExists = await provider.categoryExists(_category);
              int affectedRows = 0;
              if(!categoryExists || (categoryExists && oldName == _category)){
                category.description = _category;
                affectedRows = await provider.modifyCategory(category);
              }
              //dev.log(category.toString());
              _showSnackBar(affectedRows,categoryExists,oldName,_category);
            }
          },
          child: Text(AppLocalizations.of(context)!.save));
    });
  }

  ///[count] - The number of modified rows
  ///
  ///[categoryExists] - *True* if the category exists and *False* if not.
  ///
  ///[oldName] - The old name of the category
  ///
  ///[newName] - The new name to be assigned
  void _showSnackBar(int count,bool categoryExists,String oldName,String newName) {
    SnackBar snackBar;
    //If the category was not inserted, the id is 0,unlikely to happen
    if(count == 0 && !categoryExists){
      snackBar = SnackBar(
          duration: Duration(seconds: 1),
          content: Text(AppLocalizations.of(context)!.categoryNotModifiedError)
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    if(categoryExists && oldName != newName){
      snackBar = SnackBar(
          duration: Duration(seconds: 1),
          content: Text(AppLocalizations.of(context)!.categoryNameExists)
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    //When the category gets inserted
    if(count > 0 && (!categoryExists || oldName == newName)){
      snackBar = SnackBar(
          duration: Duration(seconds: 1),
          content: Text(AppLocalizations.of(context)!.categoryModified)
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
      widget.onClose!();
    }
  }
}
