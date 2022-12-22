class Constants {
  static Routes routes = const Routes();
  static double homePageWidgetHeight = 200;
  static String playStoreUrl = "https://www.youtube.com";
  static List<String> monthsInSpanish = [
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Octubre',
    'Noviembre',
    'Diciembre',
  ];
}

/// Class to map all the pages in the app
class Routes {
  const Routes();
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
