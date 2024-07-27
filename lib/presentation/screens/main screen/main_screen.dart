import 'package:flutter/material.dart';
import 'package:food_product_manager/controller/theme_controller.dart';
import 'package:food_product_manager/presentation/screens/main%20screen/widgets/btns_widget.dart';
import 'package:food_product_manager/presentation/screens/main%20screen/widgets/condent_widget.dart';
import 'package:food_product_manager/presentation/screens/main%20screen/widgets/light_dark_widget.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 50,
                right: 30,
                child: LightDarkWidget(themeController: themeController),
              ),
              const Positioned(
                top: 140,
                left: 15,
                child: CondentWidget(),
              ),
              const Positioned(
                top: 600,
                left: 40,
                child: BTNsWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
