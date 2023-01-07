import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yo_nunca/src/ui/widgets/round_app_bar.dart';

class CreditsPage extends StatelessWidget{
  const CreditsPage({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final txtStyle = TextStyle(color: Colors.green,fontSize: 20);
    return Scaffold(
      appBar: RoundAppBar(
        title: Text('Créditos'),
        homePage: false,
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        child: ListView(
          children: creditsList(),
        ),
      )
    );
  }

  ListTile creditTile({required String title,required String url,
    String? subtitle,String? imageAsset}){
    final titleStyle = TextStyle(color: Colors.teal,fontSize: 18);
    return ListTile(
      leading:imageAsset!.isNotEmpty ? Image.asset(imageAsset) :
      Icon(Icons.person,size: 55,),
      title: Text(title,style: titleStyle),
      subtitle: Text(subtitle!),
      trailing: InkWell(
        child: Icon(Icons.info,color: Colors.lightBlue[300],),
        onTap: () async{
          final parsedUrl = Uri.parse(url);
          await _launchUrl(parsedUrl);
        },
      ),
      onTap: () async{
        final parsedUrl = Uri.parse(url);
        await _launchUrl(parsedUrl);
      },
    );
  }

  List<Widget> creditsList(){
    List<Widget> widgets =  [];

    //Psycat Games
    widgets.add(
        creditTile(
            title: 'Psycat Games',
            url: 'https://psycatgames.com',
            subtitle: 'Aportando una enorme lista de preguntas. '
                'Visita la página web para mas juegos.',
            imageAsset:'assets/images/psycatgames.png')
    );

    //Fran Visconti
    widgets.add(
        creditTile(
            title: 'Fran Visconti',
            url: 'https://www.instagram.com/franvisconti',
            subtitle: 'Contribuidor de una lista con mas de 350 preguntas. '
                '\nInstagram: @franvisconti',
          imageAsset: ''
        )
    );

    //Flaticon
    widgets.add(
        creditTile(
            title: 'Flaticon',
            url: 'https://www.flaticon.com/',
            subtitle: 'Plataforma con distintos tipos de iconos.',
            imageAsset: 'assets/images/flaticon.png'
        )
    );

    //Mzdol
    widgets.add(
        creditTile(
            title: 'Mzdol',
            url: 'https://www.mdzol.com/sociedad/2021/3/10/yo-nunca-70-ideas-de-'
                'preguntas-para-jugar-con-tus-amigos-144225.html',
            subtitle: 'Algunas preguntas fueron recogidas de la página.',
            imageAsset: 'assets/images/mzdol.png'
        )
    );

    //Psicologia y Mente
    widgets.add(
        creditTile(
            title: 'Psicología y Mente',
            url: 'https://psicologiaymente.com/miscelanea/preguntas-yo-nunca',
            subtitle: 'Varias preguntas fueron recogidas de la página.',
            imageAsset: 'assets/images/psicologiaymente.png'
        )
    );

    //Business insider
    widgets.add(
        creditTile(
            title: 'Business Insider',
            url: 'https://www.businessinsider.es/67-preguntas-picantes-hacerle-novio-novia-1076687',
            subtitle: 'Algunas preguntas fueron recogidas de la página.',
            imageAsset: ''
        )
    );
    return widgets;
  }

  _launchUrl(Uri url) async{
    await launchUrl(url,mode:LaunchMode.externalApplication);
  }
}