import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'package:yo_nunca/src/utils/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async{
  TestWidgetsFlutterBinding.ensureInitialized();
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
        routes: AppRoutes.allRoutes,
        //Add the locale delegates so that the test can work
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
      ),
    );
    await tester.pumpWidget(homePage);
    await tester.pumpAndSettle();

    //Expect to find a specific widget on the page
    expect(find.byType(AppBar), findsOneWidget);
    //expect(find.byType(ElevatedButton), findsOneWidget);
  });
}