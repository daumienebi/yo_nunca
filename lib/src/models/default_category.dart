class DefaultCategory{

  final String id;
  final String description;
  final String imageRoute;

  const DefaultCategory({required this.id,required this.description, required this.imageRoute});

  factory DefaultCategory.fromMap(Map<String,dynamic> value) =>
      DefaultCategory(
        id: value["id"],
        description: value["description"],
        imageRoute: value["imageRoute"]
      );

  Map<String,dynamic> toMap() =>{
    'id': id,
    'description': description,
    'imageRoute' : imageRoute
  };

}