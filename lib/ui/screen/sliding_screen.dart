import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/controller/slider_controller.dart';
import 'package:restaurant_app_design/model/data_sources.dart';
import 'package:restaurant_app_design/ui/widgets/article_card.dart';
import 'package:restaurant_app_design/ui/widgets/custom_painter.dart';
import 'package:restaurant_app_design/ui/widgets/dot_indicators.dart';
import 'package:restaurant_app_design/ui/widgets/vertical_and_horizontal_gap.dart';
import 'package:restaurant_app_design/utils/color.dart';
import 'package:restaurant_app_design/utils/font_utils.dart';
import 'package:restaurant_app_design/utils/images.dart';

class SlidingScreen extends GetView<SliderController>  {
  const SlidingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Theme.of(context).bgDarkColor,
      body: CustomPaint(
        painter: CustomPainterTwo(),
        child: Obx(() =>Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SizedBox(
              height: Get.height * 0.58,
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: articles.length,
                itemBuilder: (context, index) => ArticleCard(
                  article: articles[index],
                  index: index,
                  page: controller.currentPage.value,
                ),
              ),
            ),
            DotIndicators(dotLength: articles.length, currentIndex: controller.currentPage.value),
            const Spacer(),
            InkWell(
              onTap: () =>  controller.changePage(),
              child: Container(
                width: 55,
                height: 55,
                decoration: const BoxDecoration(
                    color: Color(0xfffc0187), shape: BoxShape.circle),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
            verticalSpacing(100),
          ],
        )),
      ),
    );
  }

}
