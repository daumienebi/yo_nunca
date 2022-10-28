import 'package:flutter/material.dart';
import 'package:yo_nunca/src/pages/pages.dart';
import 'package:yo_nunca/src/utils/constants.dart';

void main() {
  runApp(const AppState());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Constants.routes.homepage,
      debugShowCheckedModeBanner: false,
      routes: {
        Constants.routes.homepage : (_) => const HomePage()
      },
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),
    );
  }
}
class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: MyApp()
    );
  }
}
