import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/ui/widgets/app_bar_widget.dart';
import 'package:restaurant_app_design/ui/widgets/custom_painter.dart';
import 'package:restaurant_app_design/ui/widgets/text_field.dart';
import 'package:restaurant_app_design/ui/widgets/vertical_and_horizontal_gap.dart';
import 'package:restaurant_app_design/utils/app_text.dart';
import 'package:restaurant_app_design/utils/color.dart';
import 'package:restaurant_app_design/utils/font_utils.dart';
import 'package:restaurant_app_design/utils/route_path.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController oneController = TextEditingController();
  TextEditingController twoController = TextEditingController();
  TextEditingController threeController = TextEditingController();
  TextEditingController fourController = TextEditingController();

  void onTapButton(){
    Get.toNamed(RoutePath.createUserProfileScreen);
  }
  void onTapMoveNextButton(){
    Get.toNamed(RoutePath.loginScreen);
  }
  void onTapForgotButton(){
    Get.toNamed(RoutePath.forgotScreen);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).bgDarkColor,
      body: CustomPaint(
        painter: CustomPainterTwo(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpacing(20),
                  appBarWidget(AppText.verification),
                  verticalSpacing(20),
                  subTitleWidget(AppText.weSentAVerificationCodeTo),
                  subSecondTitleWidget(AppText.demoEmail),
                  verticalSpacing(20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppTextField(
                            ctrl: oneController,
                            hintText: "-",
                            textInputType:TextInputType.number,
                            icons: AppText.hidePrefixIconEditText,
                            iconsTwo:AppText.hideSuffixIconEditText,
                            checkVerify:true,
                          style: FontUtilities.h30(
                              fontColor: Colors.white, fontWeight: FWT.semiBold),
                        ),
                        AppTextField(
                            ctrl: twoController,
                            hintText: "-",
                            textInputType:TextInputType.number,
                            icons: AppText.hidePrefixIconEditText,
                            iconsTwo:AppText.hideSuffixIconEditText,
                            checkVerify:true,
                          style: FontUtilities.h30(
                              fontColor: Colors.white, fontWeight: FWT.semiBold),
                        ),
                        AppTextField(
                            ctrl: threeController,
                            hintText: "-",
                            textInputType:TextInputType.number,
                            icons: AppText.hidePrefixIconEditText,
                            iconsTwo: AppText.hideSuffixIconEditText,
                            checkVerify:true,
                          style: FontUtilities.h30(
                              fontColor: Colors.white, fontWeight: FWT.semiBold),
                        ),
                        AppTextField(
                            ctrl: fourController,
                            hintText: "-",
                            textInputType:TextInputType.number,
                            icons: AppText.hidePrefixIconEditText,
                            iconsTwo: AppText.hideSuffixIconEditText,
                            checkVerify:true,
                          style: FontUtilities.h30(
                              fontColor: Colors.white, fontWeight: FWT.semiBold),
                        ),
                      ],
                    ),
                  ),
                  verticalSpacing(20),
                  customButton(AppText.verify,context,onTapButton),
                ],
              ),
            ),),
            customTextUnderLineButton(AppText.signIn,onTapMoveNextButton),
            verticalSpacing(40),
          ],
        ),
      ),
    );
  }
}
