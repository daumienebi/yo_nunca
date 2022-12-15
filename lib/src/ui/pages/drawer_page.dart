import 'package:flutter/material.dart';
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
      margin: EdgeInsets.only(top: 30,left: 15, right: 15),
      child: Column(
        children: [
          _settingsHead(),
          SizedBox(height: 10),
          _settingsWidgets(context),
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          },
              child: Text("Cerrar", style: TextStyle(color: Colors.red),))
        ],
      ),decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              Colors.white.withOpacity(0.2),
              Colors.white
            ]
        )
    ),
    );
  }

  Widget _settingsHead(){
    return Container(
      padding: EdgeInsets.all(5),
      height: 120,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const[
          SizedBox(height: 17),
          Text("Hola Derick,",textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,fontSize: 30,color: Colors.cyan
            ),),
          SizedBox(height: 10),
          Text("Jugaste por ultima vez el 21 de Octubre de 2022, hace 98 dias.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15,color: Colors.white
            ),)
        ],
      ),
    );
  }

  Widget _settingsWidgets(context){
    return Expanded(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: _settingsList(context),
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

  List<Widget> _settingsList(context){
    //devuelve la lista de widgets para el listview
    List<Widget> lista = [];
    final subTitleStyle = TextStyle(fontSize: 12);

    lista.add(InkWell(
      child: ListTile(
        title: Text("Mis Categorias"),
        subtitle: Text("Las categorias con las preguntas añadidas",
          style: subTitleStyle,),
        leading: Icon(Icons.category),
        trailing: Icon(Icons.arrow_forward_ios_sharp,size: 10,),
        onTap: ()=>Navigator.of(context).push(
            _createRoute(page: CategoryListPage()))

      ),
    ));
    lista.add(ListTile(
        title: Text("Favoritos"),
        subtitle: Text("Todas las preguntas favoritas",style: subTitleStyle,),
        leading: Icon(Icons.favorite,color: Colors.red,),
        trailing: Icon(Icons.arrow_forward_ios_sharp,size: 10,),
        onTap: ()=>Navigator.of(context).push(
            _createRoute(page: FavouritesPage()))

    ));

    lista.add(ListTile(
        title: Text("Ayuda"),
        subtitle: Text("Como jugar, crear categorias etc ...",style: subTitleStyle,),
        leading: Icon(Icons.help),
        trailing: Icon(Icons.arrow_forward_ios_sharp,size: 10,),

    ));

    lista.add(ListTile(
      title: Text("Privacidad"),
      subtitle: Text("Gestion de tus datos etc...",style: subTitleStyle,),
      leading: Icon(Icons.privacy_tip_outlined),
      trailing: Icon(Icons.arrow_forward_ios_sharp,size: 10,),


    ));

    lista.add(ListTile(
        title: Text("Valorar"),
        subtitle: Text("Calificar o sugerir mejoras de la app", style: subTitleStyle,),
        leading: Icon(Icons.shop,color: Colors.green),
        trailing: Icon(Icons.arrow_forward_ios_sharp,size: 10,),

    ));
    return lista;
  }
}