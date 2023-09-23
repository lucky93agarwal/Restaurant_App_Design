import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/controller/product_details_contoller.dart';
import 'package:restaurant_app_design/ui/widgets/app_bar_widget.dart';
import 'package:restaurant_app_design/ui/widgets/custom_painter.dart';
import 'package:restaurant_app_design/ui/widgets/vertical_and_horizontal_gap.dart';
import 'package:restaurant_app_design/utils/app_text.dart';
import 'package:restaurant_app_design/utils/color.dart';
import 'package:restaurant_app_design/utils/font_utils.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int price = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   price = Get.arguments['price']!;
  }
  void onTapButtons(){

  }
  void onTapButton(){
    Get.bottomSheet(bottomSheetThanks(Get.context!,onTapButtons));
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
            appBarTwoWidget(AppText.paymentMethod,true),
            verticalSpacing(20),
            paymentDelivery(context),
            verticalSpacing(20),
            horizontalLine(context),
            verticalSpacing(20),
            paymentMethod(context),

            verticalSpacing(50),
            promoCodeWidget(),
            verticalSpacing(50),
            promoCodeSubTotalWidget(price),
            verticalSpacing(60),
            customButton(AppText.continues,context,onTapButton),
        ],),
      ),
    );
  }
}
