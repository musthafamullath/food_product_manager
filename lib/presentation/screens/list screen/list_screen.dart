
import 'package:flutter/material.dart';
import 'package:food_product_manager/controller/category_contoller.dart';
import 'package:food_product_manager/controller/food_controller.dart';
import 'package:food_product_manager/core/consts/const_widgets.dart';
import 'package:food_product_manager/presentation/screens/list%20screen/widgets/costom_appbar.dart';
import 'package:food_product_manager/presentation/screens/list%20screen/widgets/costum_choichip_widget.dart';
import 'package:food_product_manager/presentation/screens/list%20screen/widgets/costum_girdview_widget.dart';
import 'package:food_product_manager/presentation/screens/list%20screen/widgets/floating_btn.dart';
import 'package:get/get.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final foodController = Get.put(FoodController());
    final categoryController = Get.put(CategoryController());

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kGetHeight * 0.1),
          child: const CustomAppBarWidget(),
        ),
        body: Column(
          children: [
            CostumChoichipWidget(foodController: foodController, categoryController: categoryController),
            CustomGridviewWidget(foodController: foodController),
          ],
        ),
        floatingActionButton:const FloatingBTN(),
      ),
    );
  }

}