import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/utils/color.dart';
import 'package:restaurant_app_design/utils/font_utils.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
        required this.ctrl,
        this.hintText,
        this.textInputType,
        this.textCapitalization,
        this.fieldHeight,
        this.style,
        this.icons,
        this.iconsTwo,
      this.onTap,
        required this.checkVerify});
  final TextEditingController ctrl;
  final String? hintText;
  final TextInputType? textInputType;
  final TextCapitalization? textCapitalization;
  final double? fieldHeight;
  final TextStyle? style;
  final int? icons;
  final int? iconsTwo;
  final void Function()? onTap;
  final bool checkVerify;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:checkVerify==true?null: const EdgeInsets.symmetric(horizontal: 20),
      height: checkVerify==true?60:45,
      width: checkVerify==true?60:Get.width,
      decoration: BoxDecoration(
          color:checkVerify==true? Theme.of(context).buttonSec : const Color(0xFFF6F6F6),
          borderRadius:checkVerify==true?BorderRadius.circular(50): BorderRadius.circular(25),
          border: Border.all(color: Theme.of(context).textColor)),
      child: TextField(
        keyboardType: textInputType,
        style: style,
        textAlign: checkVerify==true?TextAlign.center:TextAlign.start,
        textCapitalization: textCapitalization ?? TextCapitalization.sentences,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          fillColor: const Color(0x10DADADA),
          filled: true,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          prefixIcon: icons==0?
          const Icon(Icons.mail_sharp,color: Colors.grey,size: 20,):
          icons==2?
          const Icon(Icons.phone,color: Colors.grey,size: 20,):
          icons==3?
          const Icon(Icons.key,color: Colors.grey,size: 20,):
          icons==4?
          const Icon(Icons.person,color: Colors.grey,size: 20,):
          icons==5?
          const Icon(Icons.location_on,color: Colors.grey,size: 20,):null,


          suffixIcon:iconsTwo==0? const Icon(Icons.check,color: Colors.green,size: 20,):
          iconsTwo==2? InkWell(
            onTap: onTap,
            child: Text("Forgot ?",style: FontUtilities.h14(
                fontColor: Theme.of(context).appMainLightColor, fontWeight: FWT.semiBold),),
          ) :
          iconsTwo==3?
          const Icon(Icons.add_circle_outline,color: Colors.grey,size: 20,):null,
          suffixIconConstraints: BoxConstraints(minWidth:iconsTwo==0? 50:70, minHeight: 0),

          isDense: true,

        ),
      ),
    );
  }
}