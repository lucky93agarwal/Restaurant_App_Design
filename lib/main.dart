import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/bindings/global_binding.dart';
import 'package:restaurant_app_design/controller/slider_controller.dart';
import 'package:restaurant_app_design/ui/screen/sliding_screen.dart';
import 'package:restaurant_app_design/utils/route.dart';
import 'package:restaurant_app_design/utils/route_path.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialBinding: GlobalBinding(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutePath.selectLanugaeScreen,
      getPages: ScreenRouter.routes,
    );
  }
}
