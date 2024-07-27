import 'package:flutter/material.dart';
import 'package:food_product_manager/core/consts/assets.dart';
import 'package:food_product_manager/core/consts/colors.dart';
import 'package:food_product_manager/core/consts/const_widgets.dart';
import 'package:food_product_manager/presentation/widgets/heading_widget.dart';
import 'package:get/get.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.35),
                  radius: 20,
                  child: InkWell(
                    onTap: () => Get.back(),
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      width: 20,
                      child: Image.asset(
                        leftArrowIcon,
                        color: kBlack,
                      ),
                    ),
                  ),
                ),
                kWidth(kGetWidth * 0.09),
                const HeadingWidget(
                  text: "List Of Foods",
                  textColor: kBlack,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
