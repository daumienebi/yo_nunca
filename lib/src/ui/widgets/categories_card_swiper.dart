import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/ui/pages/pages.dart';
import 'package:yo_nunca/src/utils/constants.dart';
import 'package:yo_nunca/src/utils/my_decorations.dart';

class CategoriesCardSwiper extends StatelessWidget {
  final List<Category> categories;
  const CategoriesCardSwiper({Key? key, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(children: [
      SizedBox(
        width: double.infinity,
        height: size.height * 0.45,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                //onTap: () => Navigator.of(context).pushNamed(
                //Constants.routes.questionsPage, arguments: categories[index]),
                onTap: () async {
                  //The idea is to save the date the user enters a category
                  // to view the questions
                  await _setPrefsData();
                  Navigator.of(context)
                      .push(_createRoute(arguments: categories[index]));
                },
                child: Hero(
                  tag: UniqueKey(), //or find another way to use a unique tag
                  child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(5),
                      //decoration: MyDecorations.homePageBoxDecoration(
                      //categories[index].imageRoute),
                      decoration:
                          MyDecorations.homePageBoxDecoration(
                            categories[index].imageRoute
                          ),
                      height: Constants.homePageWidgetHeight,
                      width: 300,
                      //Try the child with a future builder to simulate a fake
                      //load
                      child: MyDecorations.homePageBoxText(
                          categories[index].description, Colors.black54)),
                ));
          },
          itemCount: categories.length,
          itemHeight: size.height * 0.5,
          itemWidth: size.width * 0.80,
          //layout: SwiperLayout.TINDER,
          layout: SwiperLayout.STACK,
        ),
      ),
    ]);
  }

  Future<void> _setPrefsData() async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    String data = '';
    int year = DateTime.now().year;
    int day = DateTime.now().day;
    int month = DateTime.now().month;
    var months = Constants.monthsInSpanish;
    data = '$day de ${months.elementAt(month - 1)} del $year';
    prefs.setString('lastEntry', data);
  }

  Route _createRoute({required Object? arguments}) {
    return PageRouteBuilder(
      settings: RouteSettings(
          name: Constants.routes.questionsPage, arguments: arguments),
      pageBuilder: (context, animation, secondaryAnimation) =>
          const QuestionPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
