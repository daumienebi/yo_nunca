import 'package:flutter/material.dart';

//Appbar with Wave, might be used later on
class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  const MainAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 25.0);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        child: ClipPath(
          clipper: WaveClip(),
          child: Container(
            color: Colors.indigo,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                title,
              ],
            ),
          ),
        ),
        preferredSize: const Size.fromHeight(kToolbarHeight + 100));
  }
}

class WaveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final lowPoint = size.height - 30;
    final highPoint = size.height - 60;

    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, highPoint, size.width / 2, lowPoint);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, lowPoint);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}