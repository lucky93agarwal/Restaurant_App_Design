import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/utils/color.dart';
import 'package:restaurant_app_design/utils/font_utils.dart';

Widget appBarWidget(String title){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    margin: const EdgeInsets.symmetric(vertical: 10),
    alignment: Alignment.center,
    height: 80,
    child: Stack(children: [
      InkWell(onTap: ()=> Get.back(),child: const Align(alignment: Alignment.centerLeft,child: Icon(Icons.arrow_back,color: Colors.white,))),
      Align(alignment: Alignment.center,child: Text(title,style:  FontUtilities.h16(
          fontColor: Colors.white, fontWeight: FWT.semiBold),)),
    ],),
  );
}

Widget titleWidget(String title){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    margin: const EdgeInsets.symmetric(vertical: 10),
    alignment: Alignment.center,
    child: Text(title,textAlign: TextAlign.center,style:  FontUtilities.h24(
        fontColor: Colors.white, fontWeight: FWT.semiBold),),
  );
}

Widget subTitleWidget(String title){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    margin: const EdgeInsets.symmetric(vertical: 10),
    alignment: Alignment.center,
    child: Text(title,textAlign: TextAlign.center,style:  FontUtilities.h14(
        fontColor: Colors.white, fontWeight: FWT.medium),),
  );
}
Widget subSecondTitleWidget(String title){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    margin: const EdgeInsets.symmetric(vertical: 10),
    alignment: Alignment.center,
    child: Text(title,textAlign: TextAlign.center,style:  FontUtilities.h15(
        fontColor: Colors.white, fontWeight: FWT.black),),
  );
}
Widget customTextUnderLineButton(String title, void Function() onTap){
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      alignment: Alignment.center,
      child: Text(title,textAlign: TextAlign.center,style: FontUtilities.h16( decoration: TextDecoration.underline,
          decorationColor: Colors.blue,
          fontColor: Colors.white, fontWeight: FWT.semiBold),),
    ),
  );
}
Widget customButton(String title,BuildContext context, void Function() onTap){
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: const [0.4, 0.9],
            colors: [
              Theme.of(context).appMainLightColor,
              Theme.of(context).secondMainLightColor
            ],
          )
      ),
      child: Text(title,textAlign: TextAlign.center,style: FontUtilities.h16(
          fontColor: Colors.white, fontWeight: FWT.semiBold),),
    ),
  );
}