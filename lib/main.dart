import 'package:flutter/material.dart';
import 'package:food_product_manager/presentation/screens/add%20screen/add_screen.dart';
import 'package:food_product_manager/presentation/screens/details%20screen/details_screen.dart';
import 'package:food_product_manager/presentation/screens/list%20screen/list_screen.dart';
import 'package:food_product_manager/presentation/screens/main%20screen/main_screen.dart';
import 'package:food_product_manager/presentation/screens/manage%20screen/manage_screen.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:food_product_manager/data/model/food.dart';
import 'package:food_product_manager/core/themes/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(FoodAdapter());
  await Hive.openBox<Food>('foodBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Food Product Manager",
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      // home: const MainScreen(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const MainScreen()),
        GetPage(name: '/add_screen', page: () => AddScreen()),
        GetPage(name: '/list_screen', page: () => const ListScreen()),
        GetPage(name: '/details_screen', page: () => DetailsScreen()),
        GetPage(name: '/manage_screen', page: () => const ManageScreen()),
      ],
    );
  }
}
