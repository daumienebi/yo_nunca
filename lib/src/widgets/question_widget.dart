import 'package:flutter/cupertino.dart';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'package:yo_nunca/src/utils/constants.dart';

class QuestionWidget extends StatefulWidget {
  final Category category;
  const QuestionWidget({Key? key,required this.category}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuestionWidgetState();
  }
}

class _QuestionWidgetState extends State<QuestionWidget> {
  List<Widget> questionWidgets = [];
  List<Question> questions = [];
  int _currentndex = 0;

  /*
  @override
  void initState() {
    _loadCards();
    super.initState();
  }
*/
  Future<List<Question>> _getQstData(){
    QuestionProvider provider = Provider.of<QuestionProvider>(context, listen: false);
    print(widget.category.toString() + "wtf");

    switch (widget.category.id) {
      case Constants.normalCategoryId:{
        questions = provider.normalQuestions;
        return Future<List<Question>>.delayed(const Duration(seconds: 1), () => questions);
      }
      break;
      case Constants.intermediateCategoryId:
        {
          questions = provider.intermediateQuestions;
          return Future<List<Question>>.delayed(const Duration(seconds: 1), () => questions);
        }
        break;
      case Constants.hotCategoryId:
        {
          questions = provider.hotQuestions;
          return Future<List<Question>>.delayed(const Duration(seconds: 1), () => questions);
        }
        break;
      default:
        {
          print(widget.category.id);
          return Future<List<Question>>.delayed(const Duration(seconds: 2), () => []);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    QuestionProvider provider = Provider.of<QuestionProvider>(context, listen: true);
    // TODO: implement build
    return Center(
      child: FutureBuilder(
        future: _getQstData(),
          builder: (_,AsyncSnapshot snapshot){
        List<Widget> test = [];
        if(snapshot.hasData){
          test = <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //if data is available then display the questions, else display the error page
                    snapshot.data != null && snapshot.data.length > 0 ?
                    _questionTextWidget(snapshot.data[_currentndex].description) : _noQuestionWidget(),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _prevQstButton(),
                        SizedBox(width: 25),
                        _nextQstButton(snapshot.data.length)
                      ],
                    )
                  ]
              ),
            ),
          ];
        }else if (snapshot.hasError) {
          test = <Widget>[
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: No se pudo cargar las preguntas :('),
            ),
          ];
        }else {
          test = const <Widget>[
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Cargando preguntas...'),
            ),
          ];
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: test,
          ),
        );
      }),
    );
  }

  _noQuestionWidget(){
    String msg = 'No existen preguntas para esta categoría. Ve a -> "Mis Categorias" para gestionar la categorías creadas';
    return Center(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.grey,
            size: 60,
          ),
          Text(msg,textAlign: TextAlign.center,style: TextStyle(
            fontSize: 15,
          ),),
        ],
      ),
    );
  }

  Widget _questionTextWidget(String title){
    return Column(
      children:[
        Icon(Icons.favorite_outline_rounded,size: 35,),
      SizedBox(height: 10),
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/cold_beer2.jpg'),
                fit: BoxFit.fill,
                opacity: 230
            ),
          //color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        height: 320,
        width: 320,
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontFamily: 'Abel'),
          ),
        ),
      ),
      ]
    );
  }

  Widget _prevQstButton() {
    final btnStyle = ElevatedButton.styleFrom(textStyle: TextStyle(color: Colors.blue,fontSize: 17));
    return ElevatedButton(
      onPressed: () {
        setState(() {
          if(_currentndex > 0){
            print("current index: $_currentndex");
            _currentndex --;
          }
        });
      },
      child: Text('Anterior'),
      style: btnStyle,
    );
  }

  Widget _nextQstButton(int listLength) {
    final btnStyle = ElevatedButton.styleFrom(textStyle: TextStyle(color: Colors.blue,fontSize: 17));
    return ElevatedButton(
        onPressed: () {
          setState(() {
            if(_currentndex < listLength - 1) {
              print("current index: $_currentndex");
              _currentndex ++;
            }
          });
        },
        child: Text('Siguiente'),
        style: btnStyle,
    );
  }
}
