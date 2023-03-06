import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

/// List of custom message for centered to the screen or parent widget.
class Messages{

  static Widget errorWidget(String errorMessage){
    return Center(
      child: Column(
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 60,
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text(errorMessage),
          ),
        ],
      ),
    );
  }

  static Widget circularLoadingWidget(String loadingMessage){
    return Center(
      child: Column(
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text(loadingMessage),
          ),
        ],
      ),
    );
  }

  /// * [errorMessage] - The messages to be thrown.
  /// * [icon] - The icon for the error message, if no icon is selected, a default icon will be used.
  /// * [opacity] - Opacity to apply to the background color of the Container.It must be a double between 0.0 and 1.0.
  static Widget errorWidget2(String errorMessage,Icon ?icon,double ?opacity){
    return  Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.red[100],
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(opacity ?? 0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? Icon(Icons.error_outline,
                color: Colors.black54,
                size: 50),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}