import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/controller/filter_controller.dart';
import 'package:restaurant_app_design/utils/color.dart';
import 'package:restaurant_app_design/utils/font_utils.dart';
import 'package:restaurant_app_design/utils/route_path.dart';

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
        this.searchEdit,
        this.onChange,
        this.checkPayment,
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
  final void Function(String)? onChange;
  final bool checkVerify;
  final int? searchEdit;
  final bool? checkPayment;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:checkVerify==true?null: const EdgeInsets.symmetric(horizontal: 20),
      height: checkVerify==true? (checkPayment==true? 50:60):45,
      width: checkVerify==true?60:searchEdit==1?Get.width*0.8:Get.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color:checkVerify==true? (checkPayment==true? const Color(0xFF522e6c): Theme.of(context).buttonSec) : const Color(0xFFF6F6F6),
          borderRadius:checkVerify==true? (checkPayment==true?BorderRadius.circular(10):  BorderRadius.circular(50)):BorderRadius.circular(25),
          border: Border.all(color: Theme.of(context).textColor)),
      child: TextField(
        keyboardType: textInputType,
        style: style,
        onChanged: onChange,
        textAlign: checkVerify==true? (checkPayment==true? TextAlign.start: TextAlign.center):TextAlign.start,
        textCapitalization: textCapitalization ?? TextCapitalization.sentences,
        inputFormatters:checkVerify==true? [FilteringTextInputFormatter. digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ]:null,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: checkVerify==true?Colors.white: Theme.of(context).editIconButtonSec),
          fillColor:  Colors.transparent,
          filled: true,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          prefixIcon: icons==0?
          Icon(Icons.mail_sharp,color: Theme.of(context).editIconButtonSec,size: 20,):
          icons==2?
          Icon(Icons.phone,color: Theme.of(context).editIconButtonSec,size: 20,):
          icons==3?
          Icon(Icons.key,color: Theme.of(context).editIconButtonSec,size: 20,):
          icons==4?
          Icon(Icons.person,color: Theme.of(context).editIconButtonSec,size: 20,):
          icons==5?
          Icon(Icons.location_on,color: Theme.of(context).editIconButtonSec,size: 20,):
          icons==6?
          InkWell(onTap: (){
            Get.lazyPut(() => FilterController());
            Get.toNamed(RoutePath.searchScreen);
          },child: Icon(Icons.search,color: Theme.of(context).editIconButtonSec,size: 20,)):null,


          suffixIcon:iconsTwo==0? const Icon(Icons.check,color: Colors.green,size: 20,):
          iconsTwo==2? InkWell(
            onTap: onTap,
            child: Text("Forgot ?",style: FontUtilities.h14(
                fontColor: Theme.of(context).appMainLightColor, fontWeight: FWT.semiBold),),
          ) :
          iconsTwo==3?
          Icon(Icons.add_circle_outline,color: Theme.of(context).editIconButtonSec,size: 20,):
          iconsTwo==1?
          Icon(Icons.filter_alt_outlined,color: Theme.of(context).editIconButtonSec,size: 20,):null,
          suffixIconConstraints: BoxConstraints(minWidth:iconsTwo==0? 50:70, minHeight: 0),

          isDense: true,

        ),
      ),
    );
  }
}