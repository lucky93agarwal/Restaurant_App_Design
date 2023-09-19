import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/ui/widgets/app_bar_widget.dart';
import 'package:restaurant_app_design/ui/widgets/custom_painter.dart';
import 'package:restaurant_app_design/ui/widgets/text_field.dart';
import 'package:restaurant_app_design/ui/widgets/vertical_and_horizontal_gap.dart';
import 'package:restaurant_app_design/utils/app_text.dart';
import 'package:restaurant_app_design/utils/color.dart';
import 'package:restaurant_app_design/utils/route_path.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  void onTapButton(){
    Get.toNamed(RoutePath.createUserProfileScreen);
  }
  void onTapMoveNextButton(){
    Get.toNamed(RoutePath.signupScreen);
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    verticalSpacing(20),
                    appBarWidget(AppText.signIn),
                    verticalSpacing(20),
                    titleWidget(AppText.yourFavouriteFoodFromNearbyTopRestaurant),
                    verticalSpacing(20),
                    AppTextField(
                        ctrl: emailController,
                        hintText: AppText.email,
                        textInputType:TextInputType.emailAddress,
                        icons: AppText.messageTextPrefixIconEditText,
                        iconsTwo: AppText.checkSuffixIconEditText,
                        checkVerify:false
                    ),
                    verticalSpacing(10),
                    AppTextField(
                        ctrl: passController,
                        hintText: AppText.password,
                        textInputType:TextInputType.visiblePassword,
                        onTap: onTapForgotButton,
                        icons: AppText.keyTextPrefixIconEditText,
                        iconsTwo: AppText.forgotTextSuffixIconEditText,
                        checkVerify:false
                    ),
                    verticalSpacing(20),
                    customButton(AppText.signIn,context,onTapButton),
                  ],
                ),
              ),
            ),
           

            customTextUnderLineButton(AppText.signUp,onTapMoveNextButton),
            verticalSpacing(40),
          ],
        ),
      ),
    );
  }
}
