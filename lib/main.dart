import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'package:yo_nunca/src/utils/app_routes.dart';
import 'package:yo_nunca/src/utils/constants.dart';
import 'package:yo_nunca/src/utils/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// The landscape idea for the app has been scrapped for now, some classes still
  /// have the code for landscape mode like [QuestionWidget], for future purposes
  /// Setup preferred orientations before running the app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const AppState()));
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //Make the status bar the same as the scaffold color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Constants.primarySwatch.shade500,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Colors.white
    ));
    return MaterialApp(
      initialRoute: AppRoutes.routeStrings.homepage,
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.allRoutes,
      supportedLocales: L10n.all,
      // setup the localization stuffs
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Constants.primarySwatch,
        textTheme: GoogleFonts.varelaRoundTextTheme(),
        useMaterial3: false //It was automatically being used
      ),
    );
  }
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => QuestionProvider()),
      ],
      child: const MyApp(),
    );
  }
}
