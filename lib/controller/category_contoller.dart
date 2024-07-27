import 'package:get/get.dart';

class CategoryController extends GetxController {
  var selectedCategory = ''.obs;
  List<String> categories = ['Fruits', 'Vegetables', 'Dairy', 'Meat', 'Bakery'];

  void setSelectedCategory(String category) {
    selectedCategory.value = category;
  }
}
