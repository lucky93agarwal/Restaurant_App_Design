import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/controller/product_details_contoller.dart';
import 'package:restaurant_app_design/model/popular_food.dart';
import 'package:restaurant_app_design/ui/widgets/app_bar_widget.dart';
import 'package:restaurant_app_design/ui/widgets/custom_painter.dart';
import 'package:restaurant_app_design/ui/widgets/vertical_and_horizontal_gap.dart';
import 'package:restaurant_app_design/utils/app_text.dart';
import 'package:restaurant_app_design/utils/color.dart';
import 'package:restaurant_app_design/utils/font_utils.dart';
import 'package:restaurant_app_design/utils/images.dart';



class OrderSummaryScreen extends StatefulWidget {
  const OrderSummaryScreen({super.key});

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  void onTapButton(){
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).bgDarkColor,
      body: CustomPaint(
        painter: CustomPainterTwo(),
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            verticalSpacing(10),
            appBarTwoWidget(AppText.orderSummary,true),
            verticalSpacing(30),
            orderSummaryWidget(context),

            verticalSpacing(30),
            horizontalLine(context),
            verticalSpacing(30),
            paymentDelivery(context),
            verticalSpacing(30),
            horizontalLine(context),
            verticalSpacing(30),
            promoCodeWidget(),
            verticalSpacing(50),
            promoCodeSubTotalWidget(18),
            verticalSpacing(60),
            customButton(AppText.placeOrder,context,onTapButton),
          ],
        ),
      ),
    );
  }
}
