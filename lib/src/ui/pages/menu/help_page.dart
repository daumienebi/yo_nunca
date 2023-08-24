import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yo_nunca/src/ui/components/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HelpPage extends StatelessWidget{
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        homePage: false,
        title: Text(AppLocalizations.of(context)!.help),
      ),
      body: helpOptions(context),
    );
  }

  Widget helpOptions(BuildContext context){
    return ListView(
      children: [
        _HelpListTile(
            title: AppLocalizations.of(context)!.helpContents,
            subtitle: AppLocalizations.of(context)!.helpContentsText,
            iconData: Icons.help_outline,
            onTap: (){}
        ),
        _HelpListTile(
          title: AppLocalizations.of(context)!.privacy,
          subtitle: AppLocalizations.of(context)!.dataManagement,
          iconData: Icons.privacy_tip_outlined,
          onTap: (){
            //original url: https://www.termsfeed.com/live/df65fce0-9b00-48db-b48b-0bca473a6fe0
            final url = Uri.parse('https://daumienebi.github.io/yo_nunca/policy.html');
            _launchUrl(url);
          },
        ),
        _HelpListTile(
          title: AppLocalizations.of(context)!.termsAndConditions,
          subtitle: AppLocalizations.of(context)!.termsAndConditionsText,
          iconData: Icons.file_present,
          onTap: () async{
            final url = Uri.parse('https://daumienebi.github.io/yo_nunca/policy.html');
            await launchUrl(url,mode: LaunchMode.externalApplication);
          },
        ),
        _HelpListTile(
            title: AppLocalizations.of(context)!.contactDeveloper,
            subtitle: AppLocalizations.of(context)!.contactDeveloperSubtitle ,
            iconData: Icons.email_outlined,
            onTap: ()async{
              String subject = 'Usuario desde la app: Yo Nunca';
              String mailUrl = 'mailto:devdaumienebi@gmail.com?subject=$subject';
              await _launchUrl(Uri.parse(mailUrl));
          },
        ),
      ],
    );
  }

  socialButton({required String socialMedia,required Icon icon,
    Function()? onClicked}) {
    const listTextStyle = TextStyle(color: Colors.black54);
    return Column(
      children: [
        InkWell(
          onTap: onClicked,
          child: icon,
        ),
        Text(socialMedia, style: listTextStyle,),
      ],
    );
  }

  _launchUrl(Uri url) async{
    await launchUrl(url,mode:LaunchMode.externalApplication);
  }
}

class _HelpListTile extends StatelessWidget{
  final String title;
  final String subtitle;
  final IconData iconData;
  final bool dangerZone;
  final Function()? onTap;

  const _HelpListTile({super.key, required this.title, required this.subtitle, required this.iconData, this.onTap, this.dangerZone = false});

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(fontSize: 16,color: dangerZone ? Colors.red : Colors.black87);
    final Color iconColor = Colors.grey.shade700;
    // TODO: implement build
    return ListTile(
        title: Text(title,style: titleStyle),
        subtitle: Text(subtitle),
        leading: Icon(iconData,color: iconColor),
        trailing: const Icon(Icons.arrow_forward_ios_sharp,size: 10),
        onTap: onTap ?? (){}
    );
  }
}
