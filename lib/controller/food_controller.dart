import 'package:food_product_manager/data/model/food.dart';
import 'package:food_product_manager/data/repository/db_repo.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  var foodList = <Food>[].obs;
  var filteredFoodList = <Food>[].obs;
  final FoodRepo foodRepo = FoodRepo();
  var selectedCategory = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadFoodItems();
  }

  void loadFoodItems() async {
    var foods = await foodRepo.getData('');
    foodList.assignAll(foods);
    filteredFoodList.assignAll(foods);
  }

  void addFood(Food food) async {
    await foodRepo.addData(food);
    loadFoodItems();
  }

  void updateFood(int index, Food updatedFood) async {
    await foodRepo.updateData(index, updatedFood);
    loadFoodItems();
  }

  void deleteFood(int index) async {
    await foodRepo.deleteData(index);
    loadFoodItems();
  }

   void filterByCategory(String category) {
    selectedCategory.value = category;
    if (category.isEmpty) {
      filteredFoodList.assignAll(foodList);
    } else {
      filteredFoodList.assignAll(foodList.where((food) => food.category == category));
    }
  }
}
