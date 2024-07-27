import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_mdi_icons/flutter_mdi_icons.dart';
import 'package:food_product_manager/controller/food_controller.dart';
import 'package:food_product_manager/core/consts/colors.dart';
import 'package:get/get.dart';

class CustomGridviewWidget extends StatelessWidget {
  const CustomGridviewWidget({
    super.key,
    required this.foodController,
  });

  final FoodController foodController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        return foodController.filteredFoodList.isNotEmpty
            ? GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.5,
                ),
                itemCount: foodController.filteredFoodList.length,
                itemBuilder: (context, index) {
                  final food = foodController.filteredFoodList[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed('/details_screen', arguments: index);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              right: 0,
                              left: 0,
                              child: Container(
                                height: 150,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: food.image != null &&
                                            food.image!.isNotEmpty
                                        ? FileImage(File(food.image!))
                                            as ImageProvider
                                        : const AssetImage(
                                            'path/to/placeholder_image.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Container(
                                  height: 150,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                          Border.all(width: 1, color: kGrey)),
                                  child: Center(
                                    child: food.image == null ||
                                            food.image!.isEmpty
                                        ? Text(
                                            'No Image',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surface,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 40),
                                          )
                                        : null,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: CircleAvatar(
                                backgroundColor: kBlack.withOpacity(0.5),
                                child: IconButton(
                                  onPressed: () {
                                    Get.toNamed('/manage_screen',
                                        arguments: index);
                                  },
                                  icon: const Icon(Mdi.dotsVertical,
                                      color: kOrage),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 155,
                              left: 10,
                              child: Text(
                                food.title ?? '',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Positioned(
                              top: 155,
                              right: 10,
                              child: Text(
                                food.category ?? '',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Positioned(
                              top: 180,
                              left: 10,
                              child: Text(
                                food.description ?? '',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.fade,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: Text("List is Empty"),
              );
      }),
    );
  }
}
