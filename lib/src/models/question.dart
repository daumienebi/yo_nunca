class QuestionFields{

  static const String id = 'id';
  static const String categoryId = 'categoryId';
  static const String description = 'description';
  static const String isFavourite = 'isFavourite';

  //Static list with the name values to easily retrieve fields names from the DB
  static final List <String> values =[id,categoryId,description,isFavourite];
}

class Question{
  int? id;
  int categoryId;
  String description;
  bool isFavourite;

  Question({this.id,required this.categoryId,required this.description,
    required this.isFavourite});

  factory Question.fromMap(Map<String,dynamic> value) =>
      Question(
        id: value["id"],
        categoryId: value["categoryId"],
        description: value["description"],
        isFavourite: value["isFavourite"] == 1 ? true : false
      );

  Map<String,dynamic> toMap() =>{
    //QuestionFields.id: id!,
    QuestionFields.categoryId: categoryId,
    QuestionFields.description: description,
    // the field is an INTEGER in the Database
    QuestionFields.isFavourite: isFavourite == true ? 1 : 0,
  };

  factory Question.fromJson(dynamic json) {
    return
      Question(id: json['id'],categoryId: json['categoryId'],
          description: json['description'], isFavourite: json['isFavourite']);
  }

  @override
  String toString(){
    return 'Question{id : $id,description : $description,category : $categoryId,'
        ' Favourite : $isFavourite}';
  }
}