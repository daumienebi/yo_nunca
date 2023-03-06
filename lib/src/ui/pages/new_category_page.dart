// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'package:yo_nunca/src/ui/widgets/widgets.dart';
import 'package:yo_nunca/src/utils/my_decorations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewCategoryPage extends StatefulWidget {
  const NewCategoryPage({Key? key}) : super(key: key);

  @override
  State<NewCategoryPage> createState() => _NewCategoryPageState();
}

class _NewCategoryPageState extends State<NewCategoryPage> {
  String _question = "";
  String _category = "";
  List<Question> newQuestions = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController categoryNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoundAppBar(
        title: Text(AppLocalizations.of(context)!.newCategory),
        homePage: false,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
            children: [
          _formFields(),
          SizedBox(
            height: 10,
          ),
          _addQuestionBtn(),
          SizedBox(
            height: 20,
          ),
          Expanded(child: _questionsList()),
          _saveButton()
        ]),
      ),
    );
  }

  Widget _formFields() {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: TextFormField(
              controller: categoryNameController,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: AppLocalizations.of(context)!.name,
                  labelStyle: TextStyle(color: Colors.black87, fontSize: 17),
                  hintText: AppLocalizations.of(context)!.introduceCategoryName,
                  suffixIcon: Icon(
                    Icons.list_alt_outlined,
                    color: Colors.black87,
                  )),
              maxLength: 25,
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

  Widget _addQuestionBtn() {
    return TextButton(
      onPressed: () => _popUpForm(isEditMode: false),
      child: Text(
        AppLocalizations.of(context)!.addQuestion,
        style: TextStyle(color: Colors.black),
      ),
      style: TextButton.styleFrom(backgroundColor: Colors.greenAccent),
    );
  }

  Future _popUpForm({required bool isEditMode, Question? question}) {
    return showDialog(
      context: context,
      builder: (_) {
        TextEditingController _questionController = TextEditingController();
        _questionController.text = question?.description ?? "";
        return Consumer(builder: (_, CategoryProvider provider, __) {
          return AlertDialog(
            title: Text(
                isEditMode ? AppLocalizations.of(context)!.modifyQuestion :
                AppLocalizations.of(context)!.addQuestion
            ),
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
                    style: TextStyle(color: Colors.red)
                ),
              ),
              TextButton(
                onPressed: () async {
                  _question = _questionController.text;
                  if (isEditMode && _question.isNotEmpty) {
                    setState(() {
                        question!.description = _question;
                    });
                  } else {
                    _question = _questionController.text;
                    var newQuestion = Question(
                        description: _question,
                        isFavourite: false,
                        categoryId: 0 //the new id will be used if its added
                        );
                    if(_question.isNotEmpty){
                      setState(() {
                        newQuestions.add(newQuestion);
                      });
                    }
                  }
                  Navigator.pop(context);
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

  Widget _questionsList() {
    return ListView.separated(
      itemBuilder: (context, int index) {
        return _questionTile(newQuestions[index]);
      },
      itemCount: newQuestions.length,
      separatorBuilder: (BuildContext context, int index){
        return Divider(color: Colors.orange[50],);
      },
    );
  }

  Widget _questionTile(Question question) {
    return ListTile(
      title: Text(question.description, overflow: TextOverflow.ellipsis),
      trailing: InkWell(
        onTap: () {
          setState(() {
            newQuestions.remove(question);
          });
        },
        child: Icon(
          Icons.delete,
          color: Colors.red,
          size: 30,
        ),
      ),
      onTap: () {
        _popUpForm(question: question, isEditMode: true);
      },
      shape: Border.all(color: Colors.black26),
    );
  }

  Widget _saveButton() {
    final btnStyle = ElevatedButton.styleFrom(
        textStyle: TextStyle(color: Colors.blue, fontSize: 20));
    QuestionProvider questionProvider =
        Provider.of<QuestionProvider>(context, listen: false);
    return Consumer(builder: (_, CategoryProvider provider, __) {
      return ElevatedButton(
          style: btnStyle,
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              _category = categoryNameController.text;
              Category newCategory = Category(
                  description: _category,
                  imageRoute: '');
              bool categoryExists = await provider.categoryExists(_category);
              int categoryId = 0;
              //If the new category was inserted correctly, set the questions
              //category to the new one
              if (!categoryExists) {
                categoryId = await provider.addCategory(newCategory);
                if (categoryId > 0) {
                  for (Question question in newQuestions) {
                    question.categoryId = categoryId;
                  }
                  await questionProvider.addQuestions(newQuestions);
                }
              }
              _showSnackBar(categoryId, categoryExists);
            }
          },
          child: Text(AppLocalizations.of(context)!.save));
    });
  }

  ///Displays a snack bar depending on if the category was added or not
  void _showSnackBar(int id, bool categoryExists) {
    SnackBar snackBar;
    //If the category was not inserted, the id is 0, unlikely to happen
    if (id == 0 && !categoryExists) {
      snackBar = SnackBar(
          duration: Duration(seconds: 1),
          content: Text(AppLocalizations.of(context)!.categoryNotAdded));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    if (categoryExists) {
      snackBar = SnackBar(
          duration: Duration(seconds: 1),
          content: Text(AppLocalizations.of(context)!.categoryNameExists));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    //When the category gets inserted
    if (id > 0 && !categoryExists) {
      snackBar = SnackBar(
          duration: Duration(seconds: 1), content: Text(AppLocalizations.of(context)!.categoryAdded));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
    }
  }
}
