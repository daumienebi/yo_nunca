//Dummy data class; will be deleted later on
class TestData{
  static List<Map<String, dynamic>> categories() {
    const categories = [
      {
        'id': '1',
        'description': 'Normal'
      },
      {
        'id': '2',
        'description': 'Intermedio/Mezcla',
      },
      {
        'id': '3',
        'description': 'Caliente',
      },
    ];
    return categories;
  }
  static List<Map<String, dynamic>> questions() {
    const questions = [
      {
        'id': '1',
        'categoryId': '1',
        'description': 'Dummy text dummy text dummy text dummy 1',
        'isFavourite': '1',
      },
      {
        'id': '2',
        'categoryId': '1',
        'description': 'Dummy text dummy text dummy text dummy 2',
        'isFavourite': '1',
      },
      {
        'id': '3',
        'categoryId': '2',
        'description': 'Dummy text dummy text dummy text dummy 3',
        'isFavourite': '0',
      },
      {
        'id': '4',
        'categoryId': '3',
        'description': 'Dummy text dummy text dummy text dummy 4',
        'isFavourite': '1',
      },
      {
        'id': '5',
        'categoryId': '3',
        'description': 'Dummy text dummy text dummy text dummy 5',
        'isFavourite': '0',
      }
    ];

    return questions;
  }
}