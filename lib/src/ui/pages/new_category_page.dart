import 'package:flutter/cupertino.dart';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'package:yo_nunca/src/utils/my_decorations.dart';
import 'dart:developer' as dev;

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
    //CategoryProvider xProvider = Provider.of<CategoryProvider>(context, listen: true);
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text('Categoría Nueva'),
        gradient: const LinearGradient(
            colors: [Colors.amber, Colors.white70, Colors.amber]),
      ),
      backgroundColor: Colors.orange[50],
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(children: [
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
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Nombre de la categoría',
                  hintText: 'Introduce el nombre de la categoría',
                  suffixIcon: Icon(Icons.category)),
              maxLength: 25,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Por favor, introduce un nombre de categoria valída";
                }
                return null;
              }),
        )
      ],
    );
  }

  Widget _addQuestionBtn() {
    return TextButton(
      onPressed: () => _popUpForm(),
      child: Text(
        "Añadir Pregunta",
        style: TextStyle(color: Colors.black),
      ),
      style: TextButton.styleFrom(backgroundColor: Colors.greenAccent),
    );
  }

  Future _popUpForm() {
    return showDialog(
      context: context,
      builder: (_) {
        TextEditingController _questionController = TextEditingController();
        return Consumer(builder: (_, CategoryProvider provider, __) {
          return AlertDialog(
            title: const Text('Añadir una nueva pregunta'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: _questionController,
                    decoration: MyDecorations.questionField(),
                    maxLines: null,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  _question = _questionController.text;
                  var newQuestion = Question(
                      description: _question,
                      isFavourite: false,
                      categoryId: 0//the new id will be used if its added
                  );
                  setState(() {
                    newQuestions.add(newQuestion);
                  });
                  Navigator.pop(context); // instead of dispose();
                },
                child: Text('Aceptar'),
              ),
            ],
          );
        });
      },
    );
  }

  Widget _questionsList() {
    return ListView.builder(
      itemBuilder: (context, int index) {
        return _questionTile(newQuestions[index]);
      },
      itemCount: newQuestions.length,
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
          Icons.delete_forever_rounded,
          color: Colors.red,
          size: 30,
        ),
      ),
      onTap: () {
        dev.log("TODO : Edit question");
      },
      shape: Border.all(color: Colors.white),
    );
  }

  Widget _saveButton() {
    final btnStyle = ElevatedButton.styleFrom(
        textStyle: TextStyle(color: Colors.blue, fontSize: 20));
    QuestionProvider questionProvider = Provider.of<QuestionProvider>(context,listen: false);
    return Consumer(builder: (_, CategoryProvider provider, __) {
      return ElevatedButton(
          style: btnStyle,
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              _category = categoryNameController.text.toUpperCase();
              Category newCategory = Category(
                  description: _category,
                  //image depending on the epoch ?
                  imageRoute: "assets/images/newCategoryImage.jpg");
              int id = await provider.addCategory(newCategory);
              dev.log(id.toString() + 'is the new category id');
              //If the new category was inserted correctly, set the questions
              //category to the new one
              if(id > 0){
                for(Question question in newQuestions){
                  question.categoryId = id;
                }
                await questionProvider.addQuestions(newQuestions);
              }
              dev.log(newCategory.toString());
              _showSnackBar(id);
            }
          },
          child: Text("Guardar"));
    });
  }

  ///Displays a snack bar depending on if the category was added or not
  void _showSnackBar(int id) {
    dev.log(id.toString());
    id > 0
        ? ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            duration: Duration(seconds: 1), content: Text('Categoría añadida')))
        : ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            duration: Duration(seconds: 1),
            content: Text('No se pudo añadir la categoría')));
    Navigator.pop(context);
  }
}
