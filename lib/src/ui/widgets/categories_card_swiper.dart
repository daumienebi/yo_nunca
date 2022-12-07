import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:yo_nunca/src/models/category.dart';
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
              onTap: () => Navigator.of(context).pushNamed(
                  Constants.routes.questionsPage,
                  arguments: categories[index]),
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
                          Colors.white,
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
}
