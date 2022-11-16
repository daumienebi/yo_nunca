import 'dart:convert';

class CategoryFields{

  static const String id = 'id';
  static const String description = 'description';
  static const String imgRoute = 'imgRoute';

  //Static list with the name values to easily retrieve fields values from the DB
  static final List <String> values =[id,description,imgRoute];
}

class Category{
  final int? id;
  final String description;
  final String imageRoute;

  const Category({this.id,required this.description,required this.imageRoute});

  factory Category.fromMap(Map<String,dynamic> value) =>
      Category(
          id: value["id"],
          description: value["description"],
          imageRoute: value["imageRoute"]
      );

  Map<String,dynamic> toMap() =>{
    CategoryFields.id: id,
    CategoryFields.description: description,
    CategoryFields.imgRoute: imageRoute,
  };

  //factory Category.fromJson(String str) => Category.fromMap(json.decode(str)); check this out

  factory Category.fromJson(dynamic json) {
    return
    Category(id: json['id'], description: json['description'], imageRoute: json['imageRoute']);
  }


  String toJson() => json.encode(toMap());

  @override
  String toString(){
    return 'Category{id : $id,description : $description}';
  }
}