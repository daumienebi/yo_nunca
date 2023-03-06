import 'package:yo_nunca/src/ui/pages/pages.dart';
class AppRoutes{
    static _RouteStrings routeStrings = const _RouteStrings();
    static final allRoutes = {
      routeStrings.homepage : (_) => const HomePage(),
      routeStrings.questionsPage: (_) => const QuestionPage(),
      routeStrings.favouritesPage: (_) => const FavouritesPage(),
      routeStrings.newCategory: (_) => const NewCategoryPage(),
      routeStrings.favouriteQuestionPage: (_) => const FavouriteQuestionPage(),
      routeStrings.mixedModePage: (_) => const MixedModePage(),
      routeStrings.categoryManagementPage: (_) => const CategoryManagementPage(),
      routeStrings.categoryListPage: (_) => const CategoryListPage(),
      routeStrings.drawerPage: (_) => const DrawerPage(),
      routeStrings.creditsPage: (_) => const CreditsPage(),
  };
}

/// Class to map all the pages in the app
class _RouteStrings {
    const _RouteStrings();
    String get homepage => 'homepage';
    String get favouritesPage => 'favourites';
    String get questionsPage => 'questions';
    String get newCategory => 'newcategory';
    String get favouriteQuestionPage => 'favouritequestionpage';
    String get mixedModePage => 'mixedmodepage';
    String get categoryManagementPage => 'categorymanagementpage';
    String get categoryListPage => 'categorylistpage';
    String get drawerPage => 'drawerpage';
    String get creditsPage => 'creditspage';
    String get policyPage => 'policypage';
}

