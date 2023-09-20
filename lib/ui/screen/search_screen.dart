import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/controller/filter_controller.dart';
import 'package:restaurant_app_design/model/popular_food.dart';
import 'package:restaurant_app_design/ui/widgets/app_bar_widget.dart';
import 'package:restaurant_app_design/ui/widgets/custom_painter.dart';
import 'package:restaurant_app_design/ui/widgets/text_field.dart';
import 'package:restaurant_app_design/ui/widgets/vertical_and_horizontal_gap.dart';
import 'package:restaurant_app_design/utils/app_text.dart';
import 'package:restaurant_app_design/utils/color.dart';
import 'package:restaurant_app_design/utils/utility.dart';




class SearchScreen extends GetView<FilterController> {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).bgDarkColor,
      body: Obx(()=> CustomPaint(
        painter: CustomPainterTwo(),
        child: ListView(children: [
          verticalSpacing(20),
          Row(
            children: [
              AppTextField(
                  ctrl: controller.searchController,
                  hintText: AppText.search,
                  textInputType: TextInputType.name,
                  icons: AppText.searchPrefixIconEditText,
                  iconsTwo: AppText.filterIconTextSuffixIconEditText,
                  checkVerify: false,
                  onChange:controller.onChangeEditText,
                  searchEdit:1),
             const Icon(Icons.close,color: Colors.white,)
            ],
          ),
          verticalSpacing(20),
          Visibility(visible: controller.checkVisibility.value,child: resendSend(context)),
          Visibility(visible: controller.checkVisibility.value==true?false:true,child: titleFilter("360+ ","Food",context)),
          Visibility(visible: controller.checkVisibility.value==true?false:true,child:        Expanded(child: listFood(context,popular,controller.controllers)),),
        ],),
      )),
    );
  }
}
