import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pitjarus_test/assets/colors.dart';
import 'package:pitjarus_test/assets/font.dart';
import 'package:pitjarus_test/assets/size.dart';
import 'package:pitjarus_test/controllers/login.dart';
import 'package:pitjarus_test/controllers/stores.dart';
import 'package:pitjarus_test/routes/name.dart';
import 'package:pitjarus_test/views/login.dart';
import 'package:pitjarus_test/views/widgets/Icon.dart';
import 'package:pitjarus_test/views/widgets/label.dart';
import 'package:pitjarus_test/views/widgets/logout.dart';
import 'package:pitjarus_test/views/widgets/text_form_field.dart';
import 'package:get/get.dart';

class ListPage extends StatelessWidget {
  ListPage({Key? key}) : super(key: key);

  final StoresController storeController = Get.put(StoresController());
  final LoginController loginController = Get.put(LoginController());
  final numberFormat = NumberFormat.decimalPattern("id_ID");

  @override
  Widget build(BuildContext context) {
    GoogleMapController? _controller;
    Set<Circle> _circles = HashSet<Circle>();

    return Obx(() {
      if (storeController.isLogin.value) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        ///account name
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const LabelWidget(
                              size: TextSize.sizep3,
                              text: 'List Store',
                            ),
                            LabelWidget(
                              size: TextSize.sizep,
                              fontFamily: Font.interLight,
                              text: storeController.username.toString(),
                            )
                          ],
                        ),

                        ///nutton logout
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            width: double.maxFinite,
                            child: LogoutWidget(
                              onPressed: () => loginController.logout(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //searching
                  TextFormFieldWidget(
                    icon: Icons.search,
                    color: Colors.black.withOpacity(0.5),
                    hint: "Cari Toko/Distributor",
                    onChanged: (value) {
                      storeController.seachingStore(value);
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  ///map
                  Container(
                    width: Get.mediaQuery.size.width,
                    height: Get.mediaQuery.size.height / 3,
                    child: Card(
                        elevation: 5,
                        child: Obx(() {
                          return storeController.isMapLoading.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : GoogleMap(
                                  myLocationEnabled: true,
                                  compassEnabled: true,
                                  zoomControlsEnabled: true,
                                  tiltGesturesEnabled: false,
                                  mapType: MapType.normal,
                                  initialCameraPosition: CameraPosition(
                                      target: LatLng(
                                          double.parse(storeController
                                              .currentLatitude.value),
                                          double.parse(storeController
                                              .currentLongitude.value)),
                                      zoom: 13.0),
                                  onMapCreated:
                                      (GoogleMapController controller) {
                                    _controller = controller;
                                  },
                                  markers:
                                      Set<Marker>.of(storeController.markers),
                                  onTap: (LatLng location) {
                                    // setState(() {
                                    //   _pinPillPosition = -100;
                                    // });
                                  },
                                  onCameraMove: null,
                                  circles:
                                      Set<Circle>.of(storeController.circles),
                                );
                        })),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: LabelWidget(
                      size: TextSize.sizep2,
                      fontFamily: Font.interMedium,
                      text: "List Kunjungan",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() {
                    return storeController.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Column(
                            children: List.generate(
                                storeController.notes.length, (index) {
                              return Container(
                                width: Get.mediaQuery.size.width,
                                child: InkWell(
                                  onTap: () async {
                                    await Get.toNamed(RoutesName.detail,
                                        arguments:
                                            storeController.notes[index]);
                                  },
                                  child: Card(
                                    elevation: 3,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 10,
                                          bottom: 10),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                LabelWidget(
                                                  color: Colors.black
                                                      .withOpacity(0.7),
                                                  fontFamily: Font.interMedium,
                                                  text: storeController
                                                      .notes[index].storeName,
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                LabelWidget(
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                  fontFamily: Font.interLight,
                                                  text: storeController
                                                      .notes[index].areaName,
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                LabelWidget(
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                  fontFamily: Font.interLight,
                                                  text: storeController
                                                      .notes[index].address,
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: double.maxFinite,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: <Widget>[
                                                  IconWidget(
                                                    icon: Icons.location_pin,
                                                    color: ColorsApp.green,
                                                    size: 20.0,
                                                  ),
                                                  const SizedBox(
                                                    height: 3,
                                                  ),
                                                  LabelWidget(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    fontFamily: Font.interLight,
                                                    text:
                                                        "${numberFormat.format(double.parse(storeController.notes[index].distance ?? "0").round())}m",
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          );
                  })
                ],
              ),
            ),
          ),
        );
      } else {
        return LoginPage();
      }
    });
  }
  //    void _setCircles() {
  //   _circles.add(
  //     Circle(
  //         circleId: CircleId("0"),
  //         center: LatLng(double.parse(widget.latmainoffice),
  //             double.parse(widget.longMainoffice)),
  //         radius: 10,
  //         strokeColor: baseColor1,
  //         fillColor: baseColor.withOpacity(0.25),
  //         strokeWidth: 1),
  //   );
  // }

}
