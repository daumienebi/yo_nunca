import 'package:flutter/material.dart';
import 'package:yo_nunca/src/ui/widgets/widgets.dart';
import 'package:yo_nunca/src/utils/constants.dart';

class RoundAppBar extends StatelessWidget with PreferredSizeWidget {
  final double barHeight = 10;
  final Text? title;

  ///[homePage] indicates if the app bar is for the home page,(it that case, it
  ///contains the search delegate and drawer)
  final bool homePage;

  RoundAppBar({Key? key, this.title, required this.homePage}) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + barHeight);
  @override
  Widget build(BuildContext context) {
    return homePage ? homePageAppBar(context) : normalAppBar(context);
  }

  AppBar homePageAppBar(context) {
    return AppBar(
      centerTitle: true,
      title: Center(child: title),
      leading: InkWell(
          child: const Icon(Icons.menu),
          onTap: () =>
              Navigator.of(context).pushNamed(Constants.routes.drawerPage)),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(60.0),
        ),
      ),
      //: Colors.amberAccent,
      actions: [
        TextButton(
            onPressed: () => showSearch(
                context: context,
                delegate:
                    CategorySearchDelegate(hintText: 'Buscar categorias')),
            child: const Center(
              child:  Icon(
                Icons.search,
                size: 27,
                color: Colors.white,
              ),
            ),
          style: TextButton.styleFrom(
            minimumSize: Size(50,20)
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  AppBar normalAppBar(context) {
    return AppBar(
      centerTitle: true,
      title: _appBarTitle(title!),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(60.0),
        ),
      ),
      //: Colors.amberAccent,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  _appBarTitle(Text title) {
    return Container(
      alignment: Alignment.topLeft,
      child: title,
    );
  }
}
