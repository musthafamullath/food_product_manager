import 'package:flutter/material.dart';
import 'package:food_product_manager/core/consts/colors.dart';

// ignore: must_be_immutable
class MainPageBTN extends StatelessWidget {
  final String? btnText;
  void Function()? onPressed;
  MainPageBTN({super.key, this.btnText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.fromLTRB(100, 15, 100, 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Theme.of(context).dividerColor.withOpacity(0.5),
      textColor: kBlack,
      onPressed: onPressed,
      child: Text(
        btnText!,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: kBlack,
        ),
      ),
    );
  }
}
