// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'package:yo_nunca/src/ui/widgets/widgets.dart';
import 'package:yo_nunca/src/utils/my_decorations.dart';

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
        title: Text('Categoría nueva'),
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
                  labelText: 'Nombre',
                  labelStyle: TextStyle(color: Colors.black87, fontSize: 17),
                  hintText: 'Introduce el nombre de la categoría',
                  suffixIcon: Icon(
                    Icons.list_alt_outlined,
                    color: Colors.black87,
                  )),
              maxLength: 25,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Por favor, introduce un nombre de categoría valído";
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
        "Añadir Pregunta",
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
            title: Text(isEditMode ? 'Modificar pregunta' : 'Añadir pregunta'),
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
                child: Text('Cancelar',style: TextStyle(color: Colors.red)),
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
                child: Text('Aceptar',style: TextStyle(color: Colors.green)),
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
          child: Text("Guardar"));
    });
  }

  ///Displays a snack bar depending on if the category was added or not
  void _showSnackBar(int id, bool categoryExists) {
    SnackBar snackBar;
    //If the category was not inserted, the id is 0, unlikely to happen
    if (id == 0 && !categoryExists) {
      snackBar = SnackBar(
          duration: Duration(seconds: 1),
          content: Text('Error interno,no se '
              'pudo añadir la categoría'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    if (categoryExists) {
      snackBar = SnackBar(
          duration: Duration(seconds: 1),
          content: Text('Ya existe una categoría'
              ' con ese nombre'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    //When the category gets inserted
    if (id > 0 && !categoryExists) {
      snackBar = SnackBar(
          duration: Duration(seconds: 1), content: Text('Categoría añadida.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
    }
  }
}
