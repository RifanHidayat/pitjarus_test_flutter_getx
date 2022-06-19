import 'dart:collection';
import 'dart:math';

import 'package:geolocator/geolocator.dart';
import 'package:get/state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pitjarus_test/assets/colors.dart';
import 'package:pitjarus_test/models/stores.dart';
import 'package:pitjarus_test/services/db_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoresController extends GetxController {
  DatabaseHelper db = new DatabaseHelper();
  RxBool isLoading = false.obs;
  RxBool isLogin = false.obs;
  RxBool isMapLoading = true.obs;
  RxString currentLatitude = "0.0".obs;
  RxString currentLongitude = "0.0".obs;
  RxString username = "".obs;
  RxList<StoreModel> notes = <StoreModel>[].obs;
  RxList<Marker> markers = <Marker>[].obs;
  RxList<Circle> circles = <Circle>[].obs;
  RxInt id = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getSession();
    fetchStores();
    getCurrentPosition();
  }

  Future fetchStores() async {
    try {
      await db.list().then((data) {
        notes.value = StoreModel.fromJsonToList(data);
        getCurrentPosition();

        getMarkers();
        getDistance();
        Future.delayed(const Duration(seconds: 1), () {
          isLoading.value = false;
        });
      });
    } catch (e) {
      //isLoading.value = false;
      print("error ${e.toString()}");
    }
  }

  void seachingStore(name) {
    fetchStores();
    isLoading.value = true;
    notes.value = notes.value
        .where((element) =>
            element.storeName.toString().toLowerCase().contains("A"))
        .toList();
    Future.delayed(const Duration(seconds: 1), () {
      isLoading.value = false;
    });
  
  }

  void getSession() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    isLogin.value = sharedPreferences.getBool("is_login")!;
    username.value = sharedPreferences.getString("username")!;
  }

  void getCurrentPosition() async {
    // print("data");
    isLoading.value = true;

    await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) async {
      currentLatitude.value = position.latitude.toString();
      currentLongitude.value = position.longitude.toString();

      circles.add(Circle(
          circleId: CircleId("1"),
          center: LatLng(double.parse(currentLatitude.toString()),
              double.parse(currentLongitude.toString())),
          radius: 20,
          strokeColor: ColorsApp.baseColor,
          fillColor: ColorsApp.baseColor.withOpacity(0.25),
          strokeWidth: 1));
      isMapLoading.value = false;
    }).catchError((e) {
      isMapLoading.value = false;
      print(e);
    });
  }

  void getMarkers() async {
    notes.value.forEach((element) {
      print("marker $element");
      markers.add(Marker(
          markerId: MarkerId(element.storeId),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: LatLng(
            double.parse(element.latitude.toString()),
            double.parse(element.longitude.toString()),
          )));
    });
  }

  void getDistance() async {
    try {
      notes.value.forEach((element) async {
        final double d = await Geolocator().distanceBetween(
            double.parse(currentLatitude.value),
            double.parse(currentLongitude.value),
            double.parse(element.latitude),
            double.parse(element.longitude.toString()));
        element.distance = d.toString();
      });
    } catch (e) {
      isLoading.value = false;
      print("error $e");
    }
  }

  void setLastVisit() async {
    db.update(DateTime.now().toString(), id.value);
  }
}
