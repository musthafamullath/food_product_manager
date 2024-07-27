import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_product_manager/core/consts/assets.dart';
import 'package:food_product_manager/core/consts/colors.dart';
import 'package:food_product_manager/core/consts/const_widgets.dart';
import 'package:food_product_manager/data/model/food.dart';
import 'package:get/get.dart';

class ImageViewWidget extends StatelessWidget {
  const ImageViewWidget({
    super.key,
    required this.food,
    this.index,
  });

  final Food food;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: kGetHeight * 0.42,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            image: DecorationImage(
              image: food.image != null && food.image!.isNotEmpty
                  ? FileImage(File(food.image!)) as ImageProvider
                  : const AssetImage('path/to/placeholder_image.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: CircleAvatar(
            backgroundColor: kBlack.withOpacity(0.5),
            child: InkWell(
              onTap: () => Get.back(),
              child: Material(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Container(
                  margin: const EdgeInsets.only(
                    right: 12,
                    left: 10,
                    top: 10,
                    bottom: 10,
                  ),
                  width: kGetWidth * 0.04,
                  child: Image.asset(
                    leftArrowIcon,
                    color: kOrage,
                  ),
                ),
              ),
            ),
          ),
        ),
        
      ],
    );
  }
}
