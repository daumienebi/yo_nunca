import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yo_nunca/src/ui/pages/category_list_page.dart';
import 'package:yo_nunca/src/ui/pages/favourites_page.dart';
import 'package:yo_nunca/src/ui/widgets/round_app_bar.dart';
// ignore_for_file: prefer_const_constructors

class DrawerPage extends StatelessWidget{
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: RoundAppBar(
        homePage: false,
        title: Text('Opciones'),
      ),
        body: _mainBody(context)
    );
  }

  Widget _mainBody(context){
    return Container(
      margin: EdgeInsets.only(top: 20,left: 15, right: 15),
      child: Column(
        children: [
          _buildLastEntryWidget(),
          SizedBox(height: 10),
          _optionsWidgets(context),
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          },
              child: Text("Cerrar", style: TextStyle(color: Colors.red),))
        ],
      ),decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
    ),
    );
  }

    Widget _buildLastEntryWidget(){
    return FutureBuilder(
      future: getLastEntry(),
      builder: (BuildContext context,AsyncSnapshot snapshot){
        if(snapshot.hasData){
          return _lastEntryWidget(snapshot.data);
        }else{
          return _lastEntryWidget('');
        }
      },
    );
  }

  Widget _lastEntryWidget(String lastEntry){
    String greetingsText = '';
    final DateTime now = DateTime.now();
    if(now.hour < 12){
      greetingsText = 'Buenos días,';
    }else if(now.hour < 20 && now.hour > 12){
      greetingsText = 'Buenas tardes,';
    }else{
      greetingsText = 'Buenas noches,';
    }
    return Container(
      padding: EdgeInsets.all(7),
      height: 90,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(greetingsText,textAlign: TextAlign.left,
            style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 23,color: Colors.cyanAccent
            ),),
          SizedBox(height: 10),
          Text(lastEntry.isNotEmpty ? "Jugaste por ultima vez el $lastEntry."
            :"Todavía no jugaste ninguna partida",//empty space ;)
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14,color: Colors.white
            ),)
        ],
      ),
    );
  }


  Future<String> getLastEntry()async{
    SharedPreferences pref =await SharedPreferences.getInstance();
    var lastEntry = pref.getString('lastEntry') ?? '';
    return Future.value(lastEntry);
  }

  Widget _optionsWidgets(context){
    return Expanded(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: _optionsList(context),
        ),
      ),
    );
  }

  Route _createRoute({required page}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  List<Widget> _optionsList(context){
    List<Widget> widgets = [];
    final subTitleStyle = TextStyle(fontSize: 12);

    widgets.add(InkWell(
      child: ListTile(
        title: Text("Mis Categorias"),
        subtitle: Text("Las categorias con las preguntas añadidas",
          style: subTitleStyle,),
        leading: Icon(Icons.category),
        trailing: Icon(Icons.arrow_forward_ios_sharp,size: 10,),
        onTap: ()=> Navigator.of(context).push(
            _createRoute(page: CategoryListPage()))
      ),
    ));

    widgets.add(ListTile(
        title: Text("Favoritos"),
        subtitle: Text("Todas las preguntas favoritas",style: subTitleStyle,),
        leading: Icon(Icons.favorite,color: Colors.red,),
        trailing: Icon(Icons.arrow_forward_ios_sharp,size: 10,),
        onTap: ()=>Navigator.of(context).push(
            _createRoute(page: FavouritesPage()))
    ));

    widgets.add(ListTile(
        title: Text("Ayuda"),
        subtitle: Text("Como jugar, gestionar categorias etc ...",style: subTitleStyle,),
        leading: Icon(Icons.help),
        trailing: Icon(Icons.arrow_forward_ios_sharp,size: 10,),
    ));

    widgets.add(ListTile(
      title: Text("Privacidad"),
      subtitle: Text("Gestion de tus datos etc...",style: subTitleStyle,),
      leading: Icon(Icons.privacy_tip_outlined),
      trailing: Icon(Icons.arrow_forward_ios_sharp,size: 10,),
    ));

    widgets.add(ListTile(
        title: Text("Valorar"),
        subtitle: Text("Calificar o sugerir mejoras de la app", style: subTitleStyle,),
        leading: Icon(FontAwesomeIcons.googlePlay,),
        trailing: Icon(Icons.arrow_forward_ios_sharp,size: 10,),

    ));
    return widgets;
  }
}