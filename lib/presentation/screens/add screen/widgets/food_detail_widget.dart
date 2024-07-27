import 'package:flutter/material.dart';
import 'package:food_product_manager/core/consts/colors.dart';

class FoodDetailWidget extends StatelessWidget {
  const FoodDetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Food Details",
      style: TextStyle(
        fontWeight: FontWeight.w300,
        color: kOrage,
        fontSize: 16,
      ),
    );
  }
}
