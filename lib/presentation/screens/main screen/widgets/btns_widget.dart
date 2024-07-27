import 'package:flutter/material.dart';
import 'package:food_product_manager/core/consts/const_widgets.dart';
import 'package:food_product_manager/presentation/screens/main%20screen/widgets/main_page_btn.dart';
import 'package:get/get.dart';

class BTNsWidget extends StatelessWidget {
  const BTNsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        kHeight(kGetHeight * 0.03),
        MainPageBTN(
          btnText: 'Add New Food',
          onPressed: () => Get.toNamed('/add_screen'),
        ),
        kHeight(kGetHeight * 0.03),
        MainPageBTN(
          btnText: 'View Available Foods',
          onPressed: () => Get.toNamed('/list_screen'),
        ),
      ],
    );
  }
}
