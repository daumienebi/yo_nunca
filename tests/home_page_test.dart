import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'package:yo_nunca/src/utils/app_routes.dart';

void main(){
  //Simple test to make sure the home page is created
  testWidgets('Home page is created', (WidgetTester tester) async{
    //Build the widget to be tested
    final homePage = MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CategoryProvider()),
          ChangeNotifierProvider(create: (_) => QuestionProvider()),
        ],
      child: MaterialApp(
        initialRoute: AppRoutes.routeStrings.homepage,
        routes: AppRoutes.allRoutes
      ),
    );
    await tester.pumpWidget(homePage);
    await tester.pumpAndSettle();
  });
}