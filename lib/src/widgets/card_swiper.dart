import 'package:flutter/cupertino.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:yo_nunca/src/models/default_category.dart';
import 'package:yo_nunca/src/utils/constants.dart';
import 'package:yo_nunca/src/utils/my_decorations.dart';
import 'package:yo_nunca/src/utils/test_data.dart';

class CardSwiper extends StatelessWidget {
  final List<DefaultCategory> defaultCategories;
  const CardSwiper({Key? key, required this.defaultCategories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return _cardSwiper(context);
  }

  Widget _cardSwiper(context) {
    final TestData data = TestData();
    List<DefaultCategory> defaultCategories = data.getDefaultCategoriesList;
    final size = MediaQuery.of(context).size;
    return Column(children: [
      SizedBox(
        width: double.infinity,
        height: size.height * 0.45,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            //Generate a unique id for each Hero because they have to be different
            defaultCategories[index].heroId = 'card ${defaultCategories[index].id}';
            return GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(
                  Constants.routes.questionsPage,
                  arguments: defaultCategories[index]),
              child: Hero(
                  tag: defaultCategories[index].heroId!, //not going to be null here
                  child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      decoration: MyDecorations.homePageBoxDecoration(
                          defaultCategories[index].imageRoute),
                      height: Constants.homePageWidgetHeight,
                      width: 300,
                      child: MyDecorations.homePageBoxText(
                          defaultCategories[index].description,
                          Colors.white,
                          null))),
            );
          },
          itemCount: defaultCategories.length,
          itemHeight: size.height * 0.5, //try to calculate it depending on potrait or landscape mode
          itemWidth: size.width * 0.85, //try to calculate it depending on potrait or landscape mode
          //layout: SwiperLayout.TINDER,
          layout: SwiperLayout.STACK,
        ),
      ),
    ]);
  }
}
