import 'package:yo_nunca/src/dao/category_dao.dart';
import 'package:yo_nunca/src/models/category.dart';

class CategoryRepository {

  final categoryDao = CategoryDao();

  addCategory(Category category) async => await
    categoryDao.addCategory(category);

  modifyCategory(Category category) async => await
    categoryDao.modifyCategory(category);

  deleteCategory(Category category) async => await
    categoryDao.deleteCategory(category);

  getCategory(int id) async => await categoryDao.getCategory(id);

  getDefaultCategories() async => await categoryDao.getDefaultCategories();

  getNewCategories() async => await categoryDao.getNewCategories();

  getAllCategories() async => await categoryDao.getAllCategories();

  categoryExists(String categoryName) => categoryDao.categoryExists(categoryName);
}