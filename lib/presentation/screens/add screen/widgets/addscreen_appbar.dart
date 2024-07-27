import 'package:flutter/material.dart';
import 'package:food_product_manager/core/consts/assets.dart';
import 'package:food_product_manager/core/consts/colors.dart';
import 'package:food_product_manager/core/consts/const_widgets.dart';
import 'package:food_product_manager/presentation/widgets/heading_widget.dart';
import 'package:get/get.dart';

class AddScreenAppBar extends StatelessWidget {
  const AddScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: CircleAvatar(
            radius: 24,
            child: SizedBox(
              width: 22,
              child: Image.asset(
                leftArrowIcon,
                color: kOrage,
              ),
            ),
          ),
        ),
        kHeight(kGetHeight * 0.05),
        const HeadingWidget(
          text: "Add New Food",
          textColor: kOrage,
        ),
      ],
    );
  }
}
