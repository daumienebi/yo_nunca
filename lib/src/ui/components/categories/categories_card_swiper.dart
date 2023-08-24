import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/ui/pages/pages.dart';
import 'package:yo_nunca/src/utils/app_routes.dart';
import 'package:yo_nunca/src/utils/constants.dart';
import 'package:yo_nunca/src/utils/my_decorations.dart';
import 'package:yo_nunca/src/utils/shared_preferences_util.dart';

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
                  // The idea is to save the date the user enters a category
                  // to view the questions
                  await SharedPreferencesUtil.setUserLastEntry();
                  Navigator.of(context)
                      .push(_createRoute(arguments: categories[index]));
                },
                child: Hero(
                  tag : UniqueKey(),//or find another way to use a unique tag
                  child: Container(
                      margin: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                      ),
                      padding: const EdgeInsets.all(5),
                      decoration:
                          MyDecorations.homePageBoxDecoration(
                            categories[index].imageRoute
                          ),
                      height: Constants.homePageWidgetHeight,
                      width: 300,
                      //Try the child with a future builder to simulate a fake
                      //load
                      child: MyDecorations.homePageBoxText(
                          categories[index].description,
                          //if the image route is empty, that means the category
                          //was added by the user
                          categories[index].imageRoute.isEmpty
                      )
                  ) ,
                ));
            },
          itemCount: categories.length,
          scrollDirection: Axis.vertical,
          itemHeight: size.height * 0.40,
          itemWidth: size.width * 0.80,
          layout: SwiperLayout.STACK//strange behaviour sometimes on start
          //layout: SwiperLayout.TINDER,//strange behaviour sometimes on start
        ),
      ),
    ]);
  }

  Route _createRoute({required Object? arguments}) {
    return PageRouteBuilder(
      settings: RouteSettings(
          name: AppRoutes.routeStrings.questionsPage,
          arguments: arguments
      ),
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
