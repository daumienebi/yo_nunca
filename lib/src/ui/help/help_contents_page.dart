import 'package:flutter/material.dart';
import 'package:yo_nunca/src/ui/components/custom_app_bar.dart';
import 'package:yo_nunca/src/ui/pages/pages.dart';
import 'package:yo_nunca/src/utils/navigator_util.dart';

class HelpContentsPage extends StatelessWidget {
  const HelpContentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        homePage: false,
        title: Text('Help contents'),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: (){
              Navigator.of(context).push(
                  NavigatorUtil.createRouteWithSlideAnimation(newPage: AddQuestionHelp())
              );
            },
            title: Text('How to add your questions'),
            leading: Icon(Icons.help_outline),
            trailing: Icon(Icons.arrow_forward_ios_sharp,size: 10),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).push(
                  NavigatorUtil.createRouteWithSlideAnimation(newPage: BackupHelp())
              );
            },
            title: Text('How to backup your questions & categories'),
            leading: Icon(Icons.help_outline),
            trailing: Icon(Icons.arrow_forward_ios_sharp,size: 10),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).push(
                  NavigatorUtil.createRouteWithSlideAnimation(newPage: EditQuestionAndCategoryHelp())
              );
            },
            title: Text('How to edit a question & category'),
            leading: Icon(Icons.help_outline),
            trailing: Icon(Icons.arrow_forward_ios_sharp,size: 10),
          )
        ],
      ),
    );
  }
}
