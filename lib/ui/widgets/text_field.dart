import 'package:flutter/material.dart';
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
      this.onTap});
  final TextEditingController ctrl;
  final String? hintText;
  final TextInputType? textInputType;
  final TextCapitalization? textCapitalization;
  final double? fieldHeight;
  final TextStyle? style;
  final int? icons;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 45,
      decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Theme.of(context).textColor)),
      child: TextField(
        keyboardType: textInputType,
        style: style,
        textAlign: TextAlign.start,
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
          prefixIcon: icons==0?const Icon(Icons.mail_sharp,color: Colors.grey,size: 20,): const Icon(Icons.key,color: Colors.grey,size: 20,),
          suffixIcon:icons==0? const Icon(Icons.check,color: Colors.green,size: 20,): InkWell(
            onTap: onTap,
            child: Text("Forgot ?",style: FontUtilities.h14(
                fontColor: Theme.of(context).appMainLightColor, fontWeight: FWT.semiBold),),
          ),
          suffixIconConstraints: BoxConstraints(minWidth:icons==0? 50:70, minHeight: 0),

          isDense: true,

        ),
      ),
    );
  }
}