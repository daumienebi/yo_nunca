// ignore_for_file: prefer_const_constructors
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

/*
* Not used
onTap: () => showModalBottomSheet(context: context, builder: (BuildContext ctx){
              return Container(
                  height: MediaQuery.of(context).size.height * 50,
                  child:
                  ListView(
                      children: const [
                        ListTile(title: Text('Hello'),subtitle: Text('World')),
                      ]
                  )
              );
            })
* */

class CategorySearchBar extends StatelessWidget {
  const CategorySearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10.0,),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10.0,),
            ),
          ),
          hintText: 'Search petients,transcript,contacts',
          prefixIcon: Icon(
            Icons.menu,
          ),
          suffixIcon: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 8,
                ),
                child: Icon(
                  Icons.notifications,
                  size: 30,
                ),
              ),
              Positioned(
                right: 15,
                child: Badge(
                  shape: BadgeShape.circle,
                  badgeColor: Colors.red,
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                  badgeContent: Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                10.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}