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
        title: Text('Creditos'),
        homePage: false,
      ),
      body: ListView(
        children: creditsList(),
      )
    );
  }

  ListTile creditTile({required String title,required String url,
    String? subtitle,String? imageAsset}){
    return ListTile(
      leading:imageAsset!.isNotEmpty ? Image.asset(imageAsset) :
      Icon(Icons.people_outline,size: 60,),
      title: Text(title),
      subtitle: Text(subtitle!),
      trailing: InkWell(
        child: Icon(Icons.arrow_forward),
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
                'Visita su página web para mas juegos.',
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
            subtitle: 'Una plataforma con una variedad que iconos.',
            imageAsset: 'assets/images/flaticon.png'
        )
    );

    //Mzdol
    widgets.add(
        creditTile(
            title: 'Mzdol',
            url: 'https://www.mdzol.com/sociedad/2021/3/10/yo-nunca-70-ideas-de-'
                'preguntas-para-jugar-con-tus-amigos-144225.html',
            subtitle: '',
            imageAsset: 'assets/images/mzdol.png'
        )
    );

    return widgets;
  }

  _launchUrl(Uri url) async{

    await launchUrl(url,mode:LaunchMode.externalApplication);
  }
}