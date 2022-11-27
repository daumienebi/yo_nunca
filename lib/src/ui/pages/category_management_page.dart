import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'package:yo_nunca/src/utils/my_decorations.dart';
// ignore_for_file: prefer_const_constructors

class CategoryManagementPage extends StatefulWidget{
  const CategoryManagementPage({Key? key}) : super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _CategoryManagementPageState();
  }
}

class _CategoryManagementPageState extends State<CategoryManagementPage>{
  String _question = "";
  String _category = "";
  List<Question> newQuestions = [];
  List<Question> existingQuestions = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController categoryNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void initState(){
    for(int i = 1;i <=5;i++){
      Question q = Question(id: 0,description: 'Random Question $i',isFavourite: false,categoryId: 0);
      existingQuestions.add(q);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    Category category = ModalRoute.of(context)!.settings.arguments as Category;
    categoryNameController.text = category.description;
      return Scaffold(
        appBar: NewGradientAppBar(
          title: Text('Editar Categoría'),
          gradient: const LinearGradient(
              colors: [Colors.amber, Colors.white70, Colors.amber]),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              _formFields(category),
              _addQuestionBtn(),
              Container(
                padding: EdgeInsets.only(left: 15),
                  width: double.infinity,
                  child: Text('Pincha sobre la pregunta para modificarla',style: TextStyle(color: Colors.black54,fontSize: 15),)),
              SizedBox(height: 10,),
              Expanded(child: _temporaryQuestionsList()),
              _saveButton()
            ],
          ),
        )
      );
  }

  Widget _temporaryQuestionsList(){
    //Will be changed later
    return ListView.separated(
      itemBuilder: (context, int index) {
        return _questionTile(existingQuestions[index]);
      },
      separatorBuilder: (ctx,index)=> Divider(color: Colors.black54,height: 5,),
      itemCount: existingQuestions.length,
    );
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Nombre',
                  hintText: 'Introduce el nombre de la categoría',
                  suffixIcon: Icon(Icons.category)),
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
      onPressed: () => _popUpForm(null,false),
      child: Text(
        "Añadir Pregunta",
        style: TextStyle(color: Colors.black),
      ),
      style: TextButton.styleFrom(backgroundColor: Colors.greenAccent),
    );
  }

  Future _popUpForm(Question? question ,bool isEditMode) {
    return showDialog(
      context: context,
      builder: (_) {
        TextEditingController _questionController = TextEditingController();
        _questionController.text = question?.description ?? "";
        return Consumer(builder: (_, CategoryProvider provider, __) {
          return AlertDialog(
            title: isEditMode ? const Text('Modificar pregunta') : const Text('Añadir una nueva pregunta'),
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
                  //If the question is to be edited[edit = true], update it in the database
                  //else add a new question
                  if(isEditMode){
                    //editing an existing question
                    _question = _questionController.text;
                    //Edit the question from db
                    //setState(() {
                      //existingQuestions.add(newQuestion);
                    //});
                  }else{
                    //new question
                    _question = _questionController.text;
                    var newQuestion = Question(
                        description: _question,
                        isFavourite: false,
                        categoryId: 1 //get the real category id
                    );
                    setState(() {
                      existingQuestions.add(newQuestion);
                    });
                  }
                  //int result = await provider.addQuestion (newQuestion);
                  //_checkResult(result);
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
    return ListView.separated(
      itemBuilder: (context, int index) {
        return _questionTile(newQuestions[index]);
      },
      separatorBuilder: (ctx,index)=> Divider(color: Colors.orange,height: 5,),
      itemCount: newQuestions.length,
    );
  }

  Widget _questionTile(Question question) {
    return ListTile(
      title: Text(question.description,overflow: TextOverflow.ellipsis),
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
        _popUpForm(question, true);
        print("TODO : Edit question");
      },
      shape: Border.all(color: Colors.white),
    );
  }

  Widget _saveButton() {
    final btnStyle = ElevatedButton.styleFrom(
        textStyle: TextStyle(color: Colors.blue, fontSize: 20));
    return Consumer(builder: (_, CategoryProvider provider, __) {
      return ElevatedButton(
          style: btnStyle,
          onPressed: () async {
            int newCategoryId = provider.categoriesCount() + 1;
            //maybe add an image
            if (_formKey.currentState!.validate()) {
              _category = categoryNameController.text.toUpperCase();
              Category newCategory = Category(id : newCategoryId, description: _category, imageRoute: "assets/images/blurBW.png");
              /*
              provider.addCategory(newCategory);
              print(newCategory.toString());
              final snackBar = SnackBar(
                duration: Duration(seconds: 1),
                content: const Text('Nueva categoría añadida'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.pop(context);
              */
              print(_category);
            }
          },
          child: Text("Guardar"));
    });
  }
}