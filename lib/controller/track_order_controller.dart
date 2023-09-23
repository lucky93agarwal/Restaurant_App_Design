import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_app_design/utils/utility.dart';


class TrackOrderController extends GetxController{

  final Completer<GoogleMapController> controllerGoogle = Completer<GoogleMapController>();

  CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );


  // created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value){

    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      if (kDebugMode) {
        cPrint("ERROR"+error.toString());
      }
    });


    return await Geolocator.getCurrentPosition();

  }
}