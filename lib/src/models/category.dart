class CategoryFields{

  static const String id = 'id';
  static const String description = 'description';

  //Static list with the name values to easily retrieve fields values from the DB
  static final List <String> values =[id,description];
}

class Category{
  final int? id;
  final String description;
  //final String imgUrl; --maybe

  const Category({this.id,required this.description});

  factory Category.fromMap(Map<String,dynamic> value) =>
      Category(
          id: value["id"],
          description: value["description"],
      );

  Map<String,dynamic> toMap() =>{
    CategoryFields.id: id,
    CategoryFields.description: description,
  };

  @override
  String toString(){
    return 'VisitPlace{id : $id,description : $description}';
  }
}