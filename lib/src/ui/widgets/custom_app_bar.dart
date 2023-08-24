import 'package:flutter/material.dart';
import 'package:yo_nunca/src/ui/pages/pages.dart';
import 'package:yo_nunca/src/ui/widgets/widgets.dart';
import 'package:yo_nunca/src/utils/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final double barHeight = 10;
  final Text? title;

  ///[homePage] indicates if the app bar is for the home page,(it that case, it
  ///contains the search delegate and drawer)
  final bool homePage;

  CustomAppBar({Key? key, this.title, required this.homePage}) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + barHeight);
  @override
  Widget build(BuildContext context) {
    return homePage ? homePageAppBar(context) : normalAppBar(context);
  }

  AppBar homePageAppBar(context){
    return AppBar(
      centerTitle: true,
      title: Center(child: title),
      shadowColor: Colors.transparent,
      leading: InkWell(
          child: const Icon(Icons.menu,color: Colors.white,size: 27,),
          onTap: () =>
          Navigator.of(context).push(createRouteWithSlideAnimation(page: DrawerPage()))
        //Navigator.of(context).pushNamed(Constants.routes.drawerPage)
      ),
      // Changing to a normal app bar instead of the rounded one
      //shape: const RoundedRectangleBorder(
      //  borderRadius: BorderRadius.vertical(
      //    bottom: Radius.circular(0.0),
      //  ),
      //),
      actions: [
        //Search icon
        IconButton(
          onPressed: () => Navigator.of(context).push(createRouteWithSlideAnimation(page: FavouritesPage())),
          icon: const Center(
            child:  Icon(
              Icons.favorite_border,
              size: 27,
              color: Colors.white,
            ),
          ),
          style: TextButton.styleFrom(
              minimumSize: Size(50,20)
          ),
        ),

        //Favourites icon
        IconButton(
            onPressed: () => showSearch(
                context: context,
                delegate:
                CategorySearchDelegate(hintText: AppLocalizations.of(context)!.searchCategories)),
            icon: const Center(
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
      title: appBarTitle(title!),
      shadowColor: Colors.transparent,
      // Changing to a normal app bar instead of the rounded one
      //shape: const RoundedRectangleBorder(
      //  borderRadius: BorderRadius.vertical(
      //    bottom: Radius.circular(50.0),
      //  ),
      //),
      //: Colors.amberAccent,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
  appBarTitle(Text title) {
    return Container(
      alignment: Alignment.topLeft,
      child: title,
    );
  }

  Route createRouteWithSlideAnimation({required Widget page}) {
    return PageRouteBuilder(
      settings: RouteSettings(name: AppRoutes.routeStrings.drawerPage,),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1.5, 1);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}