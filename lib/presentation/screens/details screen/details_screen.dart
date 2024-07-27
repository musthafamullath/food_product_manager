import 'package:flutter/material.dart';
import 'package:food_product_manager/controller/food_controller.dart';
import 'package:food_product_manager/data/model/food.dart';
import 'package:food_product_manager/presentation/screens/details%20screen/widgets/drowable_sheet_widget.dart';
import 'package:food_product_manager/presentation/screens/details%20screen/widgets/image_view_widget.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key, this.food});
  final int index = Get.arguments;
  final foodController = Get.put(FoodController());
  final Food? food;
  @override
  Widget build(BuildContext context) {
    final food = foodController.filteredFoodList[index];
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ImageViewWidget(food: food,index: index,),
            DrowableSheetWidget(food: food)
          ],
        ),
      ),
    );
  }
}
