import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class AppColors {
//   static const violetColor = Color(0xFF1c1c44);
//   static const whiteColor = Color(0xFFFFFFFF);
//   static const blackColor = Color(0xFF000000);
//   static const purpleColor = Color(0xFF8937FF);
//   static const magentaColor = Color(0xFFE85BFF);
// lucky
// }

extension AppTheme on ThemeData {
  Color get appColor => Get.isDarkMode ? appMainDarkColor : appMainLightColor;


  Color get appColorBlog => Get.isDarkMode ? bgLightColor : Colors.black;

  Color get secondAppColor =>
      Get.isDarkMode ? secondMainDarkColor : secondMainLightColor;

  Color get appSecondColor =>
      Get.isDarkMode ? thirdMainDarkColor : appMainLightColor;

  Color get buyingColor => Get.isDarkMode ? secondMainDarkColor : blue;

  Color get sellingColor => Get.isDarkMode ? appMainDarkColor : redColor;

  Color get therdAppColor =>
      Get.isDarkMode ? const Color(0xFFFADEFF) : appMainLightColor;

  Color get fourAppColor =>
      Get.isDarkMode ? chartMainColor : const Color(0xffF37335);

  Color get chatAppColor => Get.isDarkMode ? chartMainColor : chatLightColor;

  Color get sixAppColor =>
      Get.isDarkMode ? chartMainColor : const Color(0x7FD9D9D9);

  Color get fiveAppColor => Get.isDarkMode ? chartMainColor : Colors.black;

  Color get textColor =>
      Get.isDarkMode ? const Color(0xffffffff) : const Color(0xff222222);

  Color get textColorFive =>
      Get.isDarkMode ? Colors.white : Colors.black;

  Color get textColorFour =>
      Get.isDarkMode ? Colors.white.withOpacity(0.800000011920929) : const Color(0xff222222);

  Color get textColorThree => Get.isDarkMode
      ? Colors.white.withOpacity(0.30000001192092896)
      : const Color(0xff222222);

  Color get textColorTwo => Get.isDarkMode
      ? Colors.white.withOpacity(0.6000000238418579)
      : const Color(0xFF7C7A7A);

  Color get tabColor =>
      Get.isDarkMode ? const Color(0xff222222) : const Color(0xffffffff);

  Color get textFieldColor =>
      Get.isDarkMode ? const Color(0xffffffff) : Colors.grey.shade300;

  Color get whiteColor =>
      Get.isDarkMode ? const Color(0xffffffff) : const Color(0xffffffff);

  Color get bgColor => Get.isDarkMode ? bgDarkColor : bgLightColor;

  Color get bgShadeColor =>
      Get.isDarkMode ? const Color(0xff484865) : Colors.grey.shade200;

  Color get signUpTextColor =>
      Get.isDarkMode ? const Color(0xffffffff) : const Color(0xffeeeeee);

  Color get otpBoxBgColor =>
      Get.isDarkMode ? Colors.grey.shade100 : Colors.grey.shade100;

  Color get otpBoxTextColor => Get.isDarkMode ? Colors.grey : Colors.grey;

  Color get secondAppColorForPopup =>
      Get.isDarkMode ? secondMainDarkColor : appMainLightColor;

  Color get profileCardGradientUpColor =>
      Get.isDarkMode ? appMainDarkColor : const Color(0xffffffff);

  Color get profileCardGradientDownColor =>
      Get.isDarkMode ? secondMainDarkColor : const Color(0xffffffff);

  Color get bgAppBarTitleColor =>
      Get.isDarkMode ? const Color(0xffffffff) : const Color(0xff000000);

  Color get bgAppBarCartColor =>
      Get.isDarkMode ? const Color(0xff3a275f) : const Color(0xffffffff);

  Color get bgAppBarCartTitleColor =>
      Get.isDarkMode ? secondMainDarkColor : const Color(0xFFF85900);

  Color get bgAppBarCartTwoColor =>
      Get.isDarkMode ? const Color(0xffa5a5b3) : const Color(0xffffffff);

  Color get bgRamNavColor => Get.isDarkMode
      ? Colors.black.withOpacity(0.07999999821186066)
      : Colors.black.withOpacity(0.07999999821186066);

  Color get bgRamNavCartColor =>
      Get.isDarkMode ? const Color(0xff343454) : const Color(0xFFF6F6F6);

  Color get bgRamNavTabColor =>
      Get.isDarkMode ? const Color(0xffFFFFFF) : const Color(0xFF222222);

  Color get bgRamNavTabTestColor => Get.isDarkMode
      ? Colors.white.withOpacity(0.800000011920929)
      : Colors.black.withOpacity(0.800000011920929);

  Color get bgPanCartBorderTitleColor =>
      Get.isDarkMode ? Colors.white : Colors.black;

  Color get bgPanCartBorderColor =>
      Get.isDarkMode ? Colors.white : const Color(0xFFEEEEEE);

  Color get bgPanCartCartColor =>
      Get.isDarkMode ? const Color(0xff32235e) : Colors.white;

  Color get bgPanCartBoxCartColor =>
      Get.isDarkMode ? const Color(0xff2a2a4b) : const Color(0x99F7F3F4);

  Color get bgPanCartBoxTwoCartColor =>
      Get.isDarkMode ? const Color(0xff4f426c) : const Color(0x99F7F3F4);

  Color get bgPanCartBoxThreeCartColor =>
      Get.isDarkMode ? const Color(0xff3c2e5c) : Colors.white;

  Color get bgPanCartBoxFourCartColor =>
      Get.isDarkMode ? const Color(0xff3f3f5d) : const Color(0xfffaf8f8);

  Color get bgPanCartBoxFiveCartColor =>
      Get.isDarkMode ? const Color(0xff494965) : Colors.white;

  Color get bgPanCartBoxSixCartColor =>
      Get.isDarkMode ? const Color(0xff353554) : Colors.white;

  Color get bgPanCartDateCartColor => Get.isDarkMode
      ? Colors.white.withOpacity(0.699999988079071)
      : Colors.black.withOpacity(0.699999988079071);

  Color get bgPanCartCartTitleColor =>
      Get.isDarkMode ? Colors.white : const Color(0xFFF85900);

  Color get bgVerticalLineColor =>
      Get.isDarkMode ? bgDarkColor : const Color(0x332B1B34);

  Color get bgPanCartIconColor => Get.isDarkMode ? Colors.white : Colors.black;

  Color get bgTabBarTextColor =>
      Get.isDarkMode ? Colors.white : const Color(0xFF222222);

  Color get bgTabBarBoxColor => Get.isDarkMode
      ? Colors.white.withOpacity(0.10000000149011612)
      : Colors.white;

  Color get bgTabBarBoxTwoColor =>
      Get.isDarkMode ? secondMainDarkColor : const Color(0xFFF50404);

  Color get radioandDividercolor =>
      Get.isDarkMode ? secondMainDarkColor : const Color(0xFFF95A00);

  Color get bgTextColorNew =>
      Get.isDarkMode ? Colors.white : const Color(0xFF222222);

  Color get bgTabBarBoxThreeColor => Get.isDarkMode
      ? Colors.white.withOpacity(0.05000000074505806)
      : Colors.white;

  Color get calenderBordercolor =>
      Get.isDarkMode ? const Color(0xffFFFFFF) : const Color(0xff2C1B34);
  Color get bgTabBarBoxFourColor => Get.isDarkMode
      ? Colors.white.withOpacity(0.05000000074505806)
      : const Color(0xFFF7F3F4);

  Color get bgTabBarBoxFiveColor =>
      Get.isDarkMode ? Colors.white : const Color(0xFF333333);

  Color get bgSettingTabAdsColor =>
      Get.isDarkMode ? const Color(0x33d9d9d9) : Colors.grey.shade300;

  Color get bgHomeMenuItem =>
      Get.isDarkMode ? const Color(0x0cffffff) : Colors.grey.shade400;

  Color get bgHomeMenuItemTextColor =>
      Get.isDarkMode ? Colors.white60 : Colors.grey;

  Color get bgHomeMenuItemIconColor =>
      Get.isDarkMode ? Colors.grey.shade400 : Colors.grey.shade500;

  Color get popBGColor =>
      Get.isDarkMode ? const Color(0xff4a2b71) : Colors.grey.shade50;

  Color get myEventIconColor => Get.isDarkMode ? appMainDarkColor : Colors.red;

  Color get myEventDetailsTabColor =>
      Get.isDarkMode ? secondMainDarkColor : appMainLightColor;
  Color get itemName => Get.isDarkMode ? Colors.white : const Color(0xFF222222);
  Color get itemPrice =>
      Get.isDarkMode ? secondMainDarkColor : const Color(0xffF95A00);
  Color get bgCouponColor =>
      Get.isDarkMode ? const Color(0xff353555) : Colors.grey.shade500;

  Color get cardTextcolor =>
      Get.isDarkMode ? const Color(0xff8937FF) : const Color(0xffFE2E1D);

  Color get holidayeventCalendercolor =>
      Get.isDarkMode ? const Color(0xffE85BFF) : const Color(0xffE8f1E1);

  Color get secondBottomNevColor =>
      Get.isDarkMode ? secondMainDarkColor : secondMainLightColor;

  Color get minimizeIconColor =>
      Get.isDarkMode ? const Color(0xffE85BFF) : const Color(0xffFE2E1D);


  Color get minBlocButtonColor => Get.isDarkMode ? blogLangButtonColor : eventDetailHinduChadColor;

  Color get blackColor => const Color(0xff000000);
  Color get arrowGreycolor => const Color(0xFF989898);
  Color get greyColor => Colors.grey;
  Color get greyShade100Color => Colors.grey.shade100;
  Color get greyShade300Color => Colors.grey.shade300;
  Color get greyShade400Color => Colors.grey.shade400;
  Color get eventDetailHinduChadColor => const Color(0xFF3FB10A);
  Color get tableHeaderColor =>
      Get.isDarkMode ? const Color(0xFF2a2a4b) : const Color(0xFFf8f4f5);
  Color get tableRowColor =>
      Get.isDarkMode ? const Color(0xFF353555) : whiteColor;
  Color get redColor => Colors.red;
  Color get bgDarkColor => const Color(0xff2a0040);
  Color get bgLightColor => const Color(0xffffffff);
  Color get appMainDarkColor => const Color(0xff8937FF);
  Color get secondMainDarkColor => const Color(0xffE85BFF);
  Color get thirdMainDarkColor => const Color(0xFF8937FF);
  Color get appMainLightColor => const Color(0xfffe0d76);
  Color get lightholidayColor => const Color(0xfff95a00);
  Color get secondMainLightColor => const Color(0xfffe6402);
  Color get blogLangButtonColor => const Color(0xFFE85BFF);
  Color get weekendDateTextColor => const Color(0xffEA4335);
  Color get selectedDateColor => const Color(0xff42AF0F);
  Color get chartMainColor => const Color(0xFF8F88A3);
  Color get chatLightColor => const Color(0xff909090);
  Color get greenColor => Colors.green;
  Color get blue => const Color(0xFF4A6FC5);
  Color get buttonSec => const Color(0xFF785494);
  Color get editIconButtonSec => const Color(0xFF1f1f1f);
  Color get subTitleText => const Color(0xff524c60);
  Color get btnOffColor => const Color(0xffff0188);
  Color get subTextTitle => const Color(0xffccb8d4);
}