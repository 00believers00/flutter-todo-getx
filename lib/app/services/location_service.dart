import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class LocationService extends GetxController{
  final Location _location =  Location();
  RxDouble latitude = (0.0).obs;
  RxDouble longitude = (0.0).obs;
  RxDouble speedKm = (-4.0).obs;
  Rx<LocationData>? data;

  @override
  void onInit() {
    init();
    super.onInit();

  }

  Future<void> init() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _location.changeSettings(
        accuracy: LocationAccuracy.high, interval: 0, distanceFilter: 0);
    _location.onLocationChanged.listen((LocationData currentLocation) {

      data = currentLocation.obs;
      latitude.value = currentLocation.latitude!;
      longitude.value = currentLocation.longitude!;
      speedKm.value = (currentLocation.speed! * 3.6);
    });
  }
}