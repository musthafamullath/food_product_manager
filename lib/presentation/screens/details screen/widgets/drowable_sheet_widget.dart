import 'package:flutter/material.dart';
import 'package:food_product_manager/core/consts/colors.dart';
import 'package:food_product_manager/core/consts/const_widgets.dart';
import 'package:food_product_manager/data/model/food.dart';
import 'package:get/get.dart';

class DrowableSheetWidget extends StatelessWidget {
  const DrowableSheetWidget({
    super.key,
    required this.food,
  });

  final Food food;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.8,
      minChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: kBlack,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 4,
                      width: 30,
                      decoration: BoxDecoration(
                        color: kOrage,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  kHeight(kGetHeight * 0.02),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.title!,
                        style: const TextStyle(
                          color: kWhite,
                          fontSize: 40,
                          height: 1.2,
                          overflow: TextOverflow.clip
                        ),
                      ),
                        kHeight(Get.height* .03),
                      Text(
                        food.category!,
                        style:const TextStyle(
                          color: kWhite,
                          fontSize: 20,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                  kHeight(kGetHeight * 0.03),
                  kDivider,
                  kHeight(kGetHeight * 0.005),
                  kDivider,
                  kHeight(kGetHeight * 0.02),
                  Text(
                    food.description!,
                    style: const TextStyle(
                      color: kWhite,
                      fontSize: 16,
                      height: 1.4,
                    ),
                  ),
                  kHeight(kGetHeight * 0.05),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

