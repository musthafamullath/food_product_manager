// import 'package:flutter/material.dart';
// import 'package:food_product_manager/core/consts/colors.dart';
// import 'package:get/get.dart';

// class MainPageFloatBTN extends StatelessWidget {
//   const MainPageFloatBTN({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FloatingActionButton(
//       tooltip: 'ADD FOOD',
//       onPressed: () {
//         Get.toNamed('/add_screen'); // Ensure this route matches the one in GetMaterialApp
//       },
//       mini: true,
//       elevation: 0.0,
//       foregroundColor: Theme.of(context).colorScheme.surface,
//       backgroundColor: Theme.of(context).colorScheme.surface,
//       shape: BeveledRectangleBorder(
//         borderRadius: BorderRadius.circular(9.5),
//         side: const BorderSide(color: Colors.grey),
//       ),
//       child: const Icon(
//         Icons.add,
//         color: kBlack,
//         size: 24,
//       ),
//     );
//   }
// }
