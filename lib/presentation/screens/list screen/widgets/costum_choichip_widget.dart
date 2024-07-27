import 'package:flutter/material.dart';
import 'package:food_product_manager/controller/category_contoller.dart';
import 'package:food_product_manager/controller/food_controller.dart';
import 'package:get/get.dart';

class CostumChoichipWidget extends StatelessWidget {
  const CostumChoichipWidget({
    super.key,
    required this.foodController,
    required this.categoryController,
  });

  final FoodController foodController;
  final CategoryController categoryController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(20),
            )),
        height: 75,
        child: Container(
          margin: const EdgeInsets.only(left: 3, right: 3),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              child: Wrap(
                key: ValueKey<String>(
                    foodController.selectedCategory.value),
                spacing: 8.0,
                runSpacing: 4.0,
                children: [
                  ChoiceChip(
                    label: const Text('All Categories'),
                    selected:
                        foodController.selectedCategory.value.isEmpty,
                    onSelected: (selected) {
                      if (selected) {
                        foodController.filterByCategory('');
                      }
                    },
                    selectedColor:
                        Theme.of(context).colorScheme.surface,
                    backgroundColor:
                        Theme.of(context).colorScheme.secondary,
                    labelStyle: TextStyle(
                      color:
                          foodController.selectedCategory.value.isEmpty
                              ? Colors.white
                              : Colors.black,
                    ),
                  ),
                  ...categoryController.categories.map((category) {
                    return ChoiceChip(
                      label: Text(category),
                      selected: foodController.selectedCategory.value ==
                          category,
                      onSelected: (selected) {
                        foodController
                            .filterByCategory(selected ? category : '');
                      },
                      selectedColor:
                          Theme.of(context).colorScheme.surface,
                      backgroundColor:
                          Theme.of(context).colorScheme.secondary,
                      labelStyle: TextStyle(
                        color: foodController.selectedCategory.value ==
                                category
                            ? Colors.white
                            : Colors.black,
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

