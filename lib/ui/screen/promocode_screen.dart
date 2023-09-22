import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/ui/widgets/app_bar_widget.dart';
import 'package:restaurant_app_design/ui/widgets/custom_painter.dart';
import 'package:restaurant_app_design/ui/widgets/text_field.dart';
import 'package:restaurant_app_design/ui/widgets/vertical_and_horizontal_gap.dart';
import 'package:restaurant_app_design/utils/app_text.dart';
import 'package:restaurant_app_design/utils/color.dart';


class PromoCodeScreen extends StatefulWidget {
  const PromoCodeScreen({super.key});

  @override
  State<PromoCodeScreen> createState() => _PromoCodeScreenState();
}

class _PromoCodeScreenState extends State<PromoCodeScreen> {
  void onTapButton(){
    Get.back();
  }
  TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.text = AppText.enterPromoCode;
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
            appBarTwoWidget(AppText.promoCode,true),
            verticalSpacing(50),
            promoCodeTitleWidget(),
            verticalSpacing(20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: AppTextField(
                  ctrl: emailController,
                  hintText: AppText.enterPromoCode,
                  textInputType:TextInputType.emailAddress,
                  icons: AppText.hideSuffixIconEditText,
                  iconsTwo: AppText.hidePrefixIconEditText,
                  checkVerify:true,
                  checkPayment:true,
              ),
            ),
            verticalSpacing(50),
            customButton(AppText.apply,context,onTapButton),
          ],
        ),
      ),
    );
  }
}
