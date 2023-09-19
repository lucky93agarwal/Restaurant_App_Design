import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/ui/widgets/app_bar_widget.dart';
import 'package:restaurant_app_design/ui/widgets/custom_painter.dart';
import 'package:restaurant_app_design/ui/widgets/text_field.dart';
import 'package:restaurant_app_design/ui/widgets/vertical_and_horizontal_gap.dart';
import 'package:restaurant_app_design/utils/app_text.dart';
import 'package:restaurant_app_design/utils/color.dart';
import 'package:restaurant_app_design/utils/images.dart';
import 'package:restaurant_app_design/utils/route_path.dart';

class CreateUserProfileScreen extends StatefulWidget {
  const CreateUserProfileScreen({super.key});

  @override
  State<CreateUserProfileScreen> createState() =>
      _CreateUserProfileScreenState();
}

class _CreateUserProfileScreenState extends State<CreateUserProfileScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  void onTapButton() {
    // Get.toNamed(RoutePath.createUserProfileScreen);
  }

  void onTapMoveNextButton() {
    Get.toNamed(RoutePath.loginScreen);
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
                    appBarWidget(AppText.createYourProfile),
                    verticalSpacing(40),
                    userProfile(true,context,onTapButton,""),

                    verticalSpacing(20),
                    AppTextField(
                        ctrl: firstNameController,
                        hintText: AppText.firstName,
                        textInputType: TextInputType.name,
                        icons: AppText.userTextPrefixIconEditText,
                        iconsTwo: AppText.hideSuffixIconEditText,
                        checkVerify: false),
                    verticalSpacing(10),
                    AppTextField(
                        ctrl: lastNameController,
                        hintText: AppText.lastName,
                        textInputType: TextInputType.name,
                        icons: AppText.userTextPrefixIconEditText,
                        iconsTwo: AppText.hideSuffixIconEditText,
                        checkVerify: false),
                    verticalSpacing(10),
                    AppTextField(
                        ctrl: addressController,
                        hintText: AppText.fullAddress,
                        textInputType: TextInputType.visiblePassword,
                        icons: AppText.locationTextPrefixIconEditText,
                        iconsTwo: AppText.addIconTextSuffixIconEditText,
                        checkVerify: false),
                    verticalSpacing(20),
                    customButton(AppText.done, context, onTapButton),
                  ],
                ),
              ),
            ),
            customTextUnderLineButton(AppText.signIn, onTapMoveNextButton),
            verticalSpacing(40),
          ],
        ),
      ),
    );
  }
}
