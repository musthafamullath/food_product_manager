import 'package:flutter/material.dart';
import 'package:flutter_mdi_icons/flutter_mdi_icons.dart';
import 'package:food_product_manager/controller/theme_controller.dart';
import 'package:get/get.dart';

class LightDarkWidget extends StatelessWidget {
  const LightDarkWidget({
    super.key,
    required this.themeController,
  });

  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () => themeController.toggleTheme(),
        child: CircleAvatar(
          radius: 30,
          child: Icon(
            themeController.isDarkMode.value ? Mdi.lightbulbOff : Mdi.lightbulb,
            size: 32,
          ),
        ),
      ),
    );
  }
}
