import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:food_product_manager/controller/category_contoller.dart';
import 'package:food_product_manager/controller/food_controller.dart';
import 'package:food_product_manager/controller/image_controller.dart';
import 'package:food_product_manager/core/consts/assets.dart';
import 'package:food_product_manager/core/consts/colors.dart';
import 'package:food_product_manager/core/consts/const_widgets.dart';
import 'package:food_product_manager/data/model/food.dart';
import 'package:food_product_manager/presentation/screens/add%20screen/widgets/addscreen_appbar.dart';
import 'package:food_product_manager/presentation/screens/add%20screen/widgets/custom_text_field.dart';
import 'package:food_product_manager/presentation/screens/add%20screen/widgets/food_detail_widget.dart';
import 'package:get/get.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});

  final imagePickerController = Get.put(ImagePickerController());
  final categoryController = Get.put(CategoryController());
  final foodController = Get.put(FoodController());
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                kHeight(kGetHeight * 0.045),
                Obx(
                  () {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AddScreenAppBar(),
                        const Spacer(),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                imagePickerController
                                    .pickImageFromGallery()
                                    .toString();
                              },
                              child: Container(
                                width: kGetWidth * 0.38,
                                height: kGetHeight * 0.18,
                                decoration: BoxDecoration(
                                  color: kWhite,
                                  borderRadius: BorderRadius.circular(40),
                                  image: DecorationImage(
                                    image: imagePickerController
                                            .image.value.path.isEmpty
                                        ? Image.asset(
                                            mainIcon,
                                            fit: BoxFit.fill,
                                            filterQuality: FilterQuality.high,
                                            color: kOrage,
                                          ).image
                                        : Image.file(imagePickerController
                                                .image.value)
                                            .image,
                                    fit: BoxFit.cover,
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 10,
                                      offset: Offset(0, 6),
                                      spreadRadius: 0,
                                      color: Color(0x1A000000),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                                'Choose Food From Gallery',
                                style: TextStyle(color: kOrage),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                kHeight(kGetHeight * 0.04),
                const FoodDetailWidget(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    kHeight(kGetHeight * 0.04),
                    CustomTextFieldWidget(
                      labelText: 'Title',
                      controller: titleController,
                      textInputType: TextInputType.text,
                    ),
                    kHeight(kGetHeight * 0.04),
                    CustomTextFieldWidget(
                      labelText: 'Description',
                      controller: descriptionController,
                      textInputType: TextInputType.text,
                    ),
                    kHeight(kGetHeight * 0.04),
                    Obx(() {
                      return DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 18,
                          ),
                          labelText: 'Category',
                          labelStyle: const TextStyle(
                            color: kOrage,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide:
                                const BorderSide(color: kGrey, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide:
                                const BorderSide(color: kBlack, width: 2.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide:
                                const BorderSide(color: kRed, width: 2.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide:
                                const BorderSide(color: kRed, width: 2.0),
                          ),
                          errorStyle: const TextStyle(
                            fontSize: 10,
                            color: kRed,
                            height: 1,
                          ),
                        ),
                        value:
                            categoryController.selectedCategory.value.isNotEmpty
                                ? categoryController.selectedCategory.value
                                : null,
                        items: categoryController.categories
                            .map((category) => DropdownMenuItem<String>(
                                  value: category,
                                  child: Text(category),
                                ))
                            .toList(),
                        onChanged: (value) {
                          categoryController.setSelectedCategory(value ?? '');
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a category';
                          }
                          return null;
                        },
                      );
                    }),
                    kHeight(kGetHeight * 0.04),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final newFood = Food(
                            title: titleController.text,
                            description: descriptionController.text,
                            category: categoryController.selectedCategory.value,
                            image: imagePickerController.image.value.path,
                          );

                          foodController.addFood(newFood);

                          Get.offAndToNamed('/list_screen');
                          kGetSnackbar('Food added Successfully');

                          log(newFood.title.toString());
                          log(newFood.description.toString());
                          log(newFood.category.toString());
                          log(newFood.image.toString());
                        }
                      },
                      child: const Text("Add Food",
                          style: TextStyle(color: kWhite)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
