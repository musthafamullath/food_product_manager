import 'package:flutter/material.dart';
import 'package:food_product_manager/controller/food_controller.dart';
import 'package:food_product_manager/data/model/food.dart';
import 'package:get/get.dart';

class ManageScreen extends StatelessWidget {
  const ManageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int? index = Get.arguments;
    final foodController = Get.find<FoodController>();

    return showFoodActions(context, index!, foodController);
  }

  Widget showFoodActions(
      BuildContext context, int index, FoodController foodController) {
    final food = foodController.filteredFoodList[index];
    return AlertDialog(
      title: const Text('Select Action'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit'),
            onTap: () {
              Navigator.of(context).pop();
              showEditDialog(context, index, foodController, food);
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Delete'),
            onTap: () {
              Navigator.of(context).pop();
              foodController.deleteFood(index);
            },
          ),
        ],
      ),
    );
  }

  void showEditDialog(BuildContext context, int index,
      FoodController foodController, Food food) {
    final titleController = TextEditingController(text: food.title);
    final categoryController = TextEditingController(text: food.category);
    final descriptionController = TextEditingController(text: food.description);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Food'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: categoryController,
                decoration: const InputDecoration(labelText: 'Category'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                final updatedFood = Food(
                  title: titleController.text,
                  category: categoryController.text,
                  description: descriptionController.text,
                  image: food.image,
                );
                foodController.updateFood(index, updatedFood);
              },
              child: const Text('Update'),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
