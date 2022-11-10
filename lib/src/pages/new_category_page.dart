import 'package:flutter/cupertino.dart';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'package:yo_nunca/src/utils/my_decorations.dart';

class NewCategoryPage extends StatefulWidget {
  const NewCategoryPage({Key? key}) : super(key: key);

  @override
  State<NewCategoryPage> createState() => _NewCategoryPageState();
}

class _NewCategoryPageState extends State<NewCategoryPage> {
  String _category = "";
  String _question = "";
  List<Question> newQuestions = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController categoryNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text('Categoría Nueva'),
        gradient: const LinearGradient(
            colors: [Colors.amber, Colors.white70, Colors.amber]),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(children: [
          _formFields(),
          SizedBox(height: 10,),
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
        TextFormField(
            controller: categoryNameController,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Nombre',
                hintText: 'Introduce el nombre de la categoría',
                suffixIcon: Icon(Icons.category)),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Por favor, introduce un nombre valído";
              }
              return null;
            })
      ],
    );
  }

  Widget _addQuestionBtn() {
    return TextButton(
      onPressed: () => _popUpForm(),
        child: Text("Añadir Pregunta",style: TextStyle(color: Colors.black),),
        style: TextButton.styleFrom(backgroundColor: Colors.greenAccent),
    );
  }

  Future _popUpForm() {
    return showDialog(
      context: context,
      builder: (_) {
        TextEditingController _categoryController = TextEditingController();
        TextEditingController _questionController = TextEditingController();
        return AlertDialog(
          title: const Text('Añadir una nueva pregunta'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                    controller: _categoryController,
                    decoration: MyDecorations.categoryField()),
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
                _category = _categoryController.text;
                _question = _questionController.text;
                var newX = Question(description: _question, isFavourite: false,categoryId: 1);
                setState(() {
                  newQuestions.add(newX);
                });
                //int result = await provider.addVisitPlace(newName);
                //_checkResult(result);
                dispose();
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  Widget _questionsList() {
    return ListView.builder(
        itemBuilder: (context, int index){
          return _questionTile(newQuestions[index]);

        },
        itemCount: newQuestions.length,
    );
  }

  Widget _questionTile(Question question) {
    return ListTile(
      title: Text(question.description),
      //tileColor: Colors.black12,
      trailing: InkWell(
        onTap: () {
          print("TODO : Delete question");
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
        print("TODO : Edit question");
      },
      shape: Border.all(color: Colors.white),
    );
  }

  Widget _saveButton() {
    final btnStyle = ElevatedButton.styleFrom(
        textStyle: TextStyle(color: Colors.blue, fontSize: 20));
    return ElevatedButton(
        style: btnStyle,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            print(categoryNameController.text);
          }
        },
        child: Text("Guardar"));
  }

  void _checkResult(int result) {
    result > 0
        ? ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Pregunta guardada!')))
        : ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content:
                Text('No se pudo guardar la pregunta')));
    Navigator.pop(context);
  }
}
