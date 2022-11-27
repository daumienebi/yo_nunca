import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yo_nunca/src/ui/pages/pages.dart';
import 'package:yo_nunca/src/providers/providers.dart';
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
        Constants.routes.homepage : (_) => const HomePage(),
        Constants.routes.questionsPage : (_) => const QuestionPage(),
        Constants.routes.favouritesPage : (_) => const FavouritesPage(),
        Constants.routes.newCategory : (_) => const NewCategoryPage(),
        Constants.routes.favouriteQuestionPage : (_) => const FavouriteQuestionPage(),
        Constants.routes.mixedModePage : (_) => const MixedModePage(),
        Constants.routes.categoryManagementPage : (_) => const CategoryManagementPage(),
        Constants.routes.categoryListPage : (_) => const CategoryListPage()
      },
      theme: ThemeData(
        primarySwatch: Colors.amber,
        backgroundColor: Colors.orange[100]
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
      child: MyApp(),
    );
  }
}
