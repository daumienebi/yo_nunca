class QuestionFields{

  static const String id = 'id';
  static const String categoryId = 'categoryId';
  static const String description = 'description';
  static const String isFavourite = 'isFavourite';

  //Static list with the name values to easily retrieve fields values from the DB
  static final List <String> values =[id,description,isFavourite];
}

class Question{
  final int? id;
  final int? categoryId;
  final String description;
  final bool isFavourite; //?

  const Question({this.id,this.categoryId,required this.description,required this.isFavourite});

  factory Question.fromMap(Map<String,dynamic> value) =>
      Question(
        id: value["id"],
        categoryId: value["categoryId"],
        description: value["description"],
        isFavourite: value["isFavourite"]
      );

  Map<String,dynamic> toMap() =>{
    QuestionFields.id: id,
    QuestionFields.categoryId: categoryId,
    QuestionFields.description: description,
    QuestionFields.isFavourite: isFavourite,
  };

  @override
  String toString(){
    return 'VisitPlace{id : $id,description : $description, Favourite : $isFavourite}';
  }
}