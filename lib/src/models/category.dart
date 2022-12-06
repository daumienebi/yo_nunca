import 'dart:convert';

class CategoryFields{

  static const String id = 'id';
  static const String description = 'description';
  static const String imageRoute = 'imageRoute';

  //Static list with the name values to easily retrieve fields values from the DB
  static final List <String> values =[id,description,imageRoute];
}

class Category{
  int? id;
  String description;
  String imageRoute;

  Category({this.id,required this.description,required this.imageRoute});

  factory Category.fromMap(Map<String,dynamic> value) =>
      Category(
          id: value["id"],
          description: value["description"],
          imageRoute: value["imageRoute"]
      );

  Map<String,dynamic> toMap() =>{
    CategoryFields.id: id,
    CategoryFields.description: description,
    CategoryFields.imageRoute: imageRoute,
  };

  //factory Category.fromJson(String str) => Category.fromMap(json.decode(str)); ?
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