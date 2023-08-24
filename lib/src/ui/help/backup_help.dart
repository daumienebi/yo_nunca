import 'package:flutter/material.dart';
import 'package:yo_nunca/src/ui/components/custom_app_bar.dart';

class BackupHelp extends StatelessWidget {
  const BackupHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        homePage :false,
        title: Text("How to backup"),
      ),
    );
  }
}
