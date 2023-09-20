import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/controller/filter_controller.dart';
import 'package:restaurant_app_design/ui/widgets/app_bar_widget.dart';
import 'package:restaurant_app_design/ui/widgets/custom_painter.dart';
import 'package:restaurant_app_design/ui/widgets/vertical_and_horizontal_gap.dart';
import 'package:restaurant_app_design/utils/app_text.dart';
import 'package:restaurant_app_design/utils/color.dart';
import 'package:restaurant_app_design/utils/route_path.dart';
import 'package:restaurant_app_design/utils/utility.dart';



class FilterScreen extends GetView<FilterController> {
  const FilterScreen({super.key});
  void onTapButton(){
    Get.toNamed(RoutePath.createUserProfileScreen);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).bgDarkColor,
      body: CustomPaint(
        painter: CustomPainterTwo(),
        child: Obx(()=> SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [

              verticalSpacing(10),
            appBarWidget(Get.arguments['title']!,true),

              filterButton(context,controller.checkVisibility),
              verticalSpacing(20),
              Visibility(visible: controller.checkVisibility.value == true?true:false,
                  replacement: applyWidget(context,controller.list),
                  child: filterWidget(context)),
              const Spacer(),
              customButton(controller.checkVisibility.value?AppText.search:AppText.apply,context,onTapButton),
              verticalSpacing(40),
          ],),
        )),
      ),
    );
  }
}
