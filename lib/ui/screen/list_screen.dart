import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/model/popular_food.dart';
import 'package:restaurant_app_design/ui/widgets/app_bar_widget.dart';
import 'package:restaurant_app_design/ui/widgets/custom_painter.dart';
import 'package:restaurant_app_design/ui/widgets/vertical_and_horizontal_gap.dart';
import 'package:restaurant_app_design/utils/app_text.dart';
import 'package:restaurant_app_design/utils/color.dart';


class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).bgDarkColor,
      body: CustomPaint(
        painter: CustomPainterTwo(),
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              verticalSpacing(20),
            appBarWidget(Get.arguments['title']!,true),

            Expanded(child: listFood(context,Get.arguments['model']!,controller)),
              verticalSpacing(20),
          ],),
        ),
      ),

    );
  }
}
