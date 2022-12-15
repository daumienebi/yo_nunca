import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
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
            //Generate a unique id for each Hero because they have to be different
            return GestureDetector(
              //onTap: () => Navigator.of(context).pushNamed(
                  //Constants.routes.questionsPage, arguments: categories[index]),
              onTap: () => Navigator.of(context).push
                (_createRoute(arguments: categories[index])),
              child: Hero(
                  tag: UniqueKey(), //or find another way to use a unique tag
                  child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(5),
                      //decoration: MyDecorations.homePageBoxDecoration(
                          //categories[index].imageRoute),
                      decoration: MyDecorations.homePageBoxDecorationWithoutImage(),
                      height: Constants.homePageWidgetHeight,
                      width: 300,
                      child: MyDecorations.homePageBoxText(
                          categories[index].description,
                          Colors.black87,
                          null))),
            );
          },
          itemCount: categories.length,
          itemHeight: size.height * 0.5, //try to calculate it depending on potrait or landscape mode
          itemWidth: size.width * 0.85, //try to calculate it depending on potrait or landscape mode
          layout: SwiperLayout.TINDER,
          //layout: SwiperLayout.STACK,
        ),
      ),
    ]);
  }

  Route _createRoute({required Object? arguments}) {
    return PageRouteBuilder(
      settings: RouteSettings(name: Constants.routes.questionsPage,arguments: arguments),
      pageBuilder: (context, animation, secondaryAnimation) => const QuestionPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.5, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        //var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
