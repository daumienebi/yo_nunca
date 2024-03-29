import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yo_nunca/src/utils/constants.dart';

class MyDecorations{

  /// Returns a [BoxDecoration] with the category image if it has an image.
  /// If the category has no image, it returns a different [BoxDecoration].
  static BoxDecoration homePageBoxDecoration (String? imgRoute){
    const double fillPercent = 56.23; // fills 56.23% for container from bottom
    const double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.3, 0.9];
    // list of colors to create the effect
    List<Color> colors = [Colors.white,Constants.primarySwatch.shade400];
    return imgRoute!.isNotEmpty ? BoxDecoration(
      image: DecorationImage(
          image: AssetImage(imgRoute),
          //colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.2), BlendMode.saturation),
          fit: BoxFit.scaleDown,
      ),
      color: Constants.primarySwatch.shade500,
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 10,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      gradient :LinearGradient(
        colors: colors,
        stops: stops,
        end: Alignment.topCenter,
        begin: Alignment.bottomCenter,
      ),
    ) : BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      gradient :LinearGradient(
        colors: colors,
        stops: stops,
        end: Alignment.bottomCenter,
        begin: Alignment.topCenter,
      ),
    );
  }

  static BoxDecoration homePageBoxDecorationWithoutImage (){
    return const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      boxShadow: [
        BoxShadow(
          spreadRadius: 0.5,
          blurRadius: 0.5,
          color: Colors.black54
          //offset: Offset(0, 0), // changes position of shadow
        ),
      ],
      color: Colors.white,
    );
  }

  static Text homePageBoxText(String content,bool addedByUser){
    return Text(content,
      textAlign: TextAlign.center,style: GoogleFonts.alegreyaSansSc(
            fontSize: 40,
            color: addedByUser ? Colors.black87 : Colors.white
        )
    );
  }

  static InputDecoration questionField(BuildContext context){
    return InputDecoration(
        labelText: AppLocalizations.of(context)!.question,
        labelStyle: TextStyle(
          color: Colors.black87
        ),
        icon: Icon(Icons.description,color: Colors.black87,),
        enabled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black87
          )
        )
    );
  }
}

