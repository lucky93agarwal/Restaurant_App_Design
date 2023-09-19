import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/model/category.dart';
import 'package:restaurant_app_design/ui/widgets/app_bar_widget.dart';
import 'package:restaurant_app_design/ui/widgets/custom_painter.dart';
import 'package:restaurant_app_design/ui/widgets/text_field.dart';
import 'package:restaurant_app_design/ui/widgets/vertical_and_horizontal_gap.dart';
import 'package:restaurant_app_design/utils/app_text.dart';
import 'package:restaurant_app_design/utils/color.dart';
import 'package:restaurant_app_design/utils/font_utils.dart';
import 'package:restaurant_app_design/utils/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController firstNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).bgDarkColor,
      body: CustomPaint(
          painter: CustomPainterTwo(),
          child: ListView(
            children: [
              verticalSpacing(20),
              AppTextField(
                  ctrl: firstNameController,
                  hintText: AppText.search,
                  textInputType: TextInputType.name,
                  icons: AppText.searchPrefixIconEditText,
                  iconsTwo: AppText.filterIconTextSuffixIconEditText,
                  checkVerify: false),
              verticalSpacing(20),
              menuCategory(context),
              verticalSpacing(20),
              popularFood(),
              verticalSpacing(20),
              horizontalLine(context),
              verticalSpacing(20),
              nearbyRestaurantFood(),

            ],
          )),
    );
  }
}
