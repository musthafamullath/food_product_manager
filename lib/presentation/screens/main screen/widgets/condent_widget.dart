import 'package:flutter/material.dart';
import 'package:food_product_manager/core/consts/assets.dart';
import 'package:food_product_manager/core/consts/colors.dart';
import 'package:food_product_manager/core/consts/const_widgets.dart';

class CondentWidget extends StatelessWidget {
  const CondentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        kHeight(kGetHeight * 0.1 / 10),
       const Text(
          'Welcome To Food Product Manager',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: kBlack,
          ),
          textAlign: TextAlign.center,
        ),
        kHeight(kGetHeight * 0.1 / 10),
       const Text(
          "Discover the ultimate dining\n experience with our app,\n where seamless food product management,\n intuitive categorization,\n and efficient local storage ensure your favorite\n dishes are always at your fingertips.",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: kBlack,
          ),
          textAlign: TextAlign.center,
        ),
        Image.asset(
          mainIcon,
          width: kGetWidth * 0.65,
          color: Theme.of(context).dividerColor,
        )
      ],
    );
  }
}