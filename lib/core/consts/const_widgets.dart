import 'package:flutter/material.dart';
import 'package:food_product_manager/core/consts/colors.dart';
import 'package:get/get.dart';

kWidth(double width) => SizedBox(width: width);
kHeight(double height) => SizedBox(height: height);


final kGetHeight = Get.height;
final kGetWidth = Get.width;


const kDivider = Divider(
  height: 2,
  color: kGrey,
  thickness: 1,
);


kGetSnackbar(String message) => Get.rawSnackbar(
      messageText: Text(
        message,
        style: const TextStyle(
          color: kWhite,
          fontWeight: FontWeight.w400,
          fontSize: 13,
        ),
      ),
      margin: const EdgeInsets.all(20),
      borderRadius: 10,
      backgroundColor: kGreen,
    );