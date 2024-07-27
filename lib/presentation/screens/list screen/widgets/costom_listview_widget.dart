import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_product_manager/core/consts/const_widgets.dart';
import 'package:food_product_manager/data/model/food.dart';

class CostomListviewWidget extends StatelessWidget {
  const CostomListviewWidget({super.key, required this.food});
  final  Food food;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            blurRadius: 0.000,
            offset: Offset(0, 0),
            spreadRadius: 5,
            color: Color(0x0D000000),
          ),
        ],
      ),
      width: kGetWidth,
      height: kGetHeight * 0.14,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: FileImage(
                File(food.image!),
              ),
            ),
            kWidth(kGetWidth * 0.03),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food.title!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  food.category!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  food.description!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              
              ],
            ),
            const Spacer(),
            const Icon(CupertinoIcons.arrow_right)
          ],
        ),
      ),
    );
  }
}
