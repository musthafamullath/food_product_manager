import 'package:food_product_manager/data/model/food.dart';
import 'package:hive/hive.dart';

class FoodRepo {
  final Box<Food> foodBox = Hive.box<Food>('foodBox');

  Future<List<Food>> getData(String data) async {
    List<Food> food = foodBox.values.toList();
    return data == ''
        ? food
        : food.where((element) => element.title!.toLowerCase().contains(data.toLowerCase())).toList();
  }

  Future<void> addData(Food food) async {
    await foodBox.add(food);
  }

  Future<void> updateData(int index, Food food) async {
    await foodBox.putAt(index, food);
  }

  Future<void> deleteData(int index) async {
    await foodBox.deleteAt(index);
  }
}
