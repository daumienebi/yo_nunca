import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yo_nunca/src/ui/components/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreditsPage extends StatelessWidget {
  const CreditsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: Text(AppLocalizations.of(context)!.credits),
          homePage: false,
        ),
        body: Container(
          margin: EdgeInsets.all(5),
          child: ListView(
            children: creditsList(context),
            padding: EdgeInsets.all(5),
          ),
        ));
  }

  ListTile creditTile({required String title,required String url,
    String? subtitle,String? imageAsset}){
    final titleStyle = TextStyle(color: Colors.black87,fontSize: 16);
    return ListTile(
      leading:imageAsset!.isNotEmpty ? Image.asset(imageAsset) :
      Icon(Icons.person,size: 50),
      title: Text(title,style: titleStyle),
      contentPadding: EdgeInsets.all(7),
      subtitle: Text(subtitle!),
      trailing: InkWell(
        child: Icon(Icons.arrow_forward_ios,color: Colors.black87,size: 12),
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

  List<Widget> creditsList(BuildContext context) {
    List<Widget> widgets = [];

    //Psycat Games
    widgets.add(creditTile(
        title: 'Psycat Games',
        url: 'https://psycatgames.com',
        subtitle: AppLocalizations.of(context)!.psyCatGamesCredit,
        imageAsset: 'assets/images/psycatgames.png'));

    //Fran Visconti
    widgets.add(creditTile(
        title: 'Fran Visconti',
        url: 'https://www.instagram.com/franvisconti',
        subtitle: AppLocalizations.of(context)!.franViscontiCredit,
        imageAsset: ''));

    //Flaticon
    widgets.add(creditTile(
        title: 'Flaticon',
        url: 'https://www.flaticon.com/',
        subtitle: AppLocalizations.of(context)!.flatIconCredit,
        imageAsset: 'assets/images/flaticon.png'));

    //Mzdol
    widgets.add(creditTile(
        title: 'Mzdol',
        url: 'https://www.mdzol.com/sociedad/2021/3/10/yo-nunca-70-ideas-de-'
            'preguntas-para-jugar-con-tus-amigos-144225.html',
        subtitle: AppLocalizations.of(context)!.mzdolCredit,
        imageAsset: 'assets/images/mzdol.png'));

    //Psicologia y Mente
    widgets.add(creditTile(
        title: 'Psicología y Mente',
        url: 'https://psicologiaymente.com/miscelanea/preguntas-yo-nunca',
        subtitle: AppLocalizations.of(context)!.psicologiaYMenteCredit,
        imageAsset: 'assets/images/psicologiaymente.png'));

    //Business insider
    widgets.add(creditTile(
        title: 'Business Insider',
        url:
            'https://www.businessinsider.es/67-preguntas-picantes-hacerle-novio-novia-1076687',
        subtitle: AppLocalizations.of(context)!.businessInsider,
        imageAsset: ''));
    return widgets;
  }

  _launchUrl(Uri url) async {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }
}