import 'package:newscloud/models/category_model.dart';

class CategoryServices {
  List<CategoryModel> getCategories() {
    return [
      CategoryModel(
          categoryName: 'general',
          arabicName: 'أخبار عامة',
          imageUrl: 'assets/images/general.jpg'),
      CategoryModel(
          categoryName: 'health',
          arabicName: 'الصحة',
          imageUrl: 'assets/images/health.jpg'),
      CategoryModel(
          categoryName: 'science',
          arabicName: 'العلوم',
          imageUrl: 'assets/images/science.jpg'),
      CategoryModel(
          categoryName: 'sports',
          arabicName: 'الرياضة',
          imageUrl: 'assets/images/sports.jpg'),
      CategoryModel(
          categoryName: 'technology',
          arabicName: 'التكنولوجيا',
          imageUrl: 'assets/images/tech.jpeg'),
      CategoryModel(
          categoryName: 'business',
          arabicName: 'إدارة الأعمال',
          imageUrl: 'assets/images/business.png'),
      CategoryModel(
          categoryName: 'entertainment',
          arabicName: 'الفن',
          imageUrl: 'assets/images/entertainment.jpg'),
    ];
  }
}
