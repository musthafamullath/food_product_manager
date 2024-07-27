import 'package:flutter/material.dart';
import 'package:flutter_mdi_icons/flutter_mdi_icons.dart';
import 'package:food_product_manager/core/consts/colors.dart';
import 'package:get/get.dart';

class FloatingBTN extends StatelessWidget {
  const FloatingBTN({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      mini: true,
      onPressed: () {
        Get.toNamed('/add_screen');
      },
      tooltip: 'Add Food',
      backgroundColor: kWhite,
      child: const Icon(
        Mdi.plus,
        size: 22,
        color: kBlack,
      ),
    );
  }
}
