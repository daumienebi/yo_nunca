import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yo_nunca/src/ui/pages/pages.dart';
import 'package:yo_nunca/src/ui/widgets/round_app_bar.dart';
import 'package:yo_nunca/src/utils/constants.dart';
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
          TextButton(
              onPressed: ()=> Navigator.of(context).pop(),
              style: TextButton.styleFrom(backgroundColor: Colors.redAccent),
              child: Text(
                "Cerrar",
                style: TextStyle(color: Colors.white,),)
          )
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
    final format = DateFormat.jm();
    String formattedString = format.format(now);

    if(formattedString.endsWith('AM')){
      greetingsText = 'Buenos días,';
    }else if(formattedString.endsWith('PM') && now.hour > 8){
      greetingsText = 'Buenas noches,';
    }else{
      greetingsText = 'Buenas tardes,';
    }

    return Container(
      padding: EdgeInsets.all(7),
      height: 90,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(greetingsText,textAlign: TextAlign.left,
            style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 23,color: Colors.cyanAccent[400]
            ),),
          SizedBox(height: 5),
          Text(lastEntry.isNotEmpty ? "Jugaste por última vez el $lastEntry."
            :"Todavía no jugaste ninguna partida.",//empty space ;)
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15,color: Colors.white
            ),
          )
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
    final subTitleStyle = TextStyle(fontSize: 14);
    final titleStyle = TextStyle(fontSize: 17);

    widgets.add(InkWell(
      child: ListTile(
        title: Text("Gestionar Categorías",style: titleStyle,),
        subtitle: Text("Todas las categorías con las preguntas añadidas.",
          style: subTitleStyle,),
        leading: Icon(Icons.list_alt_outlined),
        trailing: Icon(Icons.arrow_forward_ios_sharp,size: 10,),
        onTap: ()=> Navigator.of(context).push(
            _createRoute(page: CategoryListPage()))
      ),
    ));

    widgets.add(ListTile(
        title: Text("Favoritos",style: titleStyle),
        subtitle: Text("Lista de tus preguntas destacadas.",style: subTitleStyle,),
        leading: Icon(Icons.favorite,color: Colors.red,),
        trailing: Icon(Icons.arrow_forward_ios_sharp,size: 10,),
        onTap: ()=>Navigator.of(context).push(
            _createRoute(page: FavouritesPage()))
    ));

    widgets.add(ListTile(
      title: Text("Privacidad",style: titleStyle),
      subtitle: Text("Gestion de tus datos etc...",style: subTitleStyle,),
      leading: Icon(Icons.privacy_tip_outlined),
      trailing: Icon(Icons.arrow_forward_ios_sharp,size: 10,),
      onTap: (){
        //original url: https://www.termsfeed.com/live/df65fce0-9b00-48db-b48b-0bca473a6fe0
        final url = Uri.parse('https://daumienebi.github.io/yo_nunca/');
        _launchUrl(url);
      },
    ));

    widgets.add(ListTile(
        title: Text("Valorar",style: titleStyle),
        subtitle: Text("Si te gustó la app,puedes calificarlo con 5 estrellas o sugerir mejoras.", style: subTitleStyle,),
        leading: Icon(FontAwesomeIcons.googlePlay,),
        trailing: Icon(Icons.arrow_forward_ios_sharp,size: 10,),
        onTap: () async{
          String appId = Constants.playStoreId;
          final url = Uri.parse('https://play.google.com/store/apps/details?id=$appId');
          await launchUrl(url,mode: LaunchMode.externalApplication);
        },

    ));
    widgets.add(ListTile(
      title: Text("Créditos",style: titleStyle),
      subtitle: Text("Aportaciones al proyecto.", style: subTitleStyle,),
      leading: Icon(Icons.people_outline,),
      trailing: Icon(Icons.arrow_forward_ios_sharp,size: 10,),
      onTap: ()=> Navigator.push(context, _createRoute(page: CreditsPage())),

    ));

    widgets.add(ListTile(
      title: Text("Contactar con el desarrollador",style: titleStyle),
      subtitle: Text("Sobre cualquier error o duda acerca de la app.",
        style: subTitleStyle,
      ),
      leading: Icon(Icons.contact_mail_outlined,),
      trailing: Icon(Icons.arrow_forward_ios_sharp,size: 10,),
      onTap: ()async{
        String subject = 'Usuario desde la app: Yo Nunca';
        String mailUrl = 'mailto:devdaumienebi@gmail.com?subject=$subject';
        await _launchUrl(Uri.parse(mailUrl));
      },

    ));
    return widgets;
  }

  _launchUrl(Uri url) async{
    await launchUrl(url,mode:LaunchMode.externalApplication);
  }

}