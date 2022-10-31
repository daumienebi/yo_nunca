import 'package:flutter/cupertino.dart';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:yo_nunca/src/utils/my_decorations.dart';

class NewCategoryPage extends StatefulWidget{
  const NewCategoryPage({Key? key}) : super(key: key);

  @override
  State<NewCategoryPage> createState() => _NewCategoryPageState();
}

class _NewCategoryPageState extends State<NewCategoryPage> {
  String _category = "";
  String _question = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController categoryNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Categoría nueva"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
            children: [
              _formFields(),
              _addQuestionBtn(),
              SizedBox(height: 20,),
              Expanded(child: _questionsList()),
              _addButton()
            ]
        ),
      ),
    );
  }

  Widget _formFields(){
    return Container(
      child: Column(
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
              suffixIcon: Icon(Icons.category)
          ),
          validator: (String? value){
            if(value == null || value.isEmpty){
              return "Por favor, introduce un nombre valído";
            }return null;
          }
      )
        ],
      ),
    );
  }

  Widget _addQuestionBtn(){
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: 50,
      alignment: Alignment.topRight,
        child: InkWell(
          onTap: (){
            _popUpForm();
            //setState(() {});
          },
          child: Icon(
            Icons.add,color: Colors.blue,size: 50,
          ),
        )
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
                _category = nameController.text;
                _question = _questionController.text;
                //int result = await provider.addVisitPlace(newName);
                //_checkResult(result);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Widget _questionsList(){
    return ListView(
      children: [
        _questionTiles("Yo nunca he dummy dummy dummy dummy dummy dummyyy"),
        _questionTiles("Yo nunca he dummy dummy dummy dummy dummy dummyyy"),
        _questionTiles("Yo nunca he dummy dummy dummy dummy dummy dummyyy"),
        _questionTiles("Yo nunca he dummy dummy dummy dummy dummy dummyyy"),
        //_questionTiles("Yo nunca he dummy dummy dummy dummy dummy dummyyy"),
        //_questionTiles("Yo nunca he dummy dummy dummy dummy dummy dummyyy"),
        //_questionTiles("Yo nunca he dummy dummy dummy dummy dummy dummyyy"),
        //_questionTiles("Yo nunca he dummy dummy dummy dummy dummy dummyyy"),
        //_questionTiles("Yo nunca he dummy dummy dummy dummy dummy dummyyy"),
        //_questionTiles("Yo nunca he dummy dummy dummy dummy dummy dummyyy"),
        //_questionTiles("Yo nunca he dummy dummy dummy dummy dummy dummyyy"),

      ],
    );
  }


  ListTile _questionTiles(String title){
    return ListTile(
      title: Text(title),
      tileColor: Colors.black12,
      trailing: InkWell(
        onTap: (){print("TODO : Delete question");},
        child: Icon(
          Icons.delete_forever_rounded,color: Colors.black,size: 30,
        ),
      ),
      onTap: (){print("TODO : Edit question");},
      shape: Border.all(
        color: Colors.white
      ),

    );
  }
  Widget _addButton(){
    final btnStyle = ElevatedButton.styleFrom(textStyle: TextStyle(color: Colors.blue,fontSize: 20));
    return ElevatedButton(
        style: btnStyle,
        onPressed: (){
          if(_formKey.currentState!.validate()){
              print(categoryNameController.text);
          }
        },
        child: Text("Guardar")
    );
  }

_checkResult(int result) {
  result > 0
      ? ScaffoldMessenger.of(context)
      .showSnackBar(const SnackBar(content: Text('New Location saved')))
      : ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content:
      Text('The location was not saved, introduce a valid name')));
  Navigator.pop(context);
}
}