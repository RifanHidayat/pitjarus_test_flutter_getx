import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pitjarus_test/assets/colors.dart';
import 'package:pitjarus_test/assets/size.dart';
import 'package:pitjarus_test/controllers/stores.dart';
import 'package:pitjarus_test/models/stores.dart';
import 'package:pitjarus_test/views/widgets/Icon.dart';
import 'package:pitjarus_test/views/widgets/button.dart';
import 'package:pitjarus_test/views/widgets/label.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key}) : super(key: key);

  final StoresController storeController = Get.put(StoresController());

  @override
  Widget build(BuildContext context) {
    final StoreModel? args =
        ModalRoute.of(context)!.settings.arguments as StoreModel?;
    List? data = [
      {
        'name': "Kode Toko",
        'data': args!.storeCode,
      },
      {
        'name': "Nama Area",
        'data': args.areaName.toString(),
      },
      {
        'name': "Nama Akun",
        'data': args.accountName,
      }
    ];
    return Scaffold(
      body: Obx(() {
        return Container(
            height: Get.mediaQuery.size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  width: Get.mediaQuery.size.width,
                  height: Get.mediaQuery.size.height / 2 - 100,
                  color: ColorsApp.baseColor,
                ),
                Positioned(
                    bottom: 100,
                    child: Container(
                      width: Get.mediaQuery.size.width,
                      height: Get.mediaQuery.size.height / 2 + 30,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Card(
                          child: Container(
                            margin: const EdgeInsets.only(
                                top: 40, right: 10, left: 10, bottom: 20),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      IconWidget(
                                        color: ColorsApp.orange,
                                        icon: Icons.location_pin,
                                        size: 20.0,
                                      ),
                                      LabelWidget(
                                        color: ColorsApp.orange,
                                        text: "Lokasi Belum Sesui",
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      ButtonWidget(
                                        text: "Reset",
                                        onPressed: () {},
                                        width: Get.mediaQuery.size.width / 4,
                                      )
                                      // IconWidget(icon: ColorsApp.g)
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    IconWidget(
                                      color: ColorsApp.orange,
                                      icon: Icons.location_city,
                                      size: 20.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        LabelWidget(
                                          text: storeController.username.value,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        LabelWidget(
                                          text: args.address,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Column(
                                          children: List.generate(data.length,
                                              (index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 5),
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    width: Get.mediaQuery.size
                                                            .width /
                                                        4,
                                                    child: LabelWidget(
                                                      text: data[index]['name'],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: Get.mediaQuery.size
                                                            .width /
                                                        4,
                                                    child: LabelWidget(
                                                      text:
                                                          ": ${data[index]['data']}",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      IconWidget(
                                        color: ColorsApp.orange,
                                        icon: Icons.list_alt,
                                        size: 20.0,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const <Widget>[
                                            LabelWidget(
                                              text: "Last Visit",
                                            ),
                                            LabelWidget(
                                              text: "05-11-2020",
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
                Positioned(
                    bottom: 10,
                    child: Container(
                      width: Get.mediaQuery.size.width,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ButtonWidget(
                            color: ColorsApp.red,
                            text: "No Visit",
                            onPressed: () {},
                            width: Get.mediaQuery.size.width / 2 - 20,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ButtonWidget(
                            text: "Visit",
                            onPressed: () {},
                            width: Get.mediaQuery.size.width / 2 - 20,
                          )
                        ],
                      ),
                    )),
                Positioned(
                  right: 20,
                  bottom: Get.mediaQuery.size.height / 2 + 110,
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: 50,
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white70, width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: CircleAvatar(
                                child: const IconWidget(
                                  color: Colors.white,
                                  icon: Icons.directions,
                                  size: 25.0,
                                ),
                                backgroundColor: ColorsApp.baseColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white70, width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: CircleAvatar(
                                child: const IconWidget(
                                  color: Colors.white,
                                  icon: Icons.camera_alt,
                                  size: 25.0,
                                ),
                                backgroundColor: ColorsApp.baseColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white70, width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: CircleAvatar(
                                child: const IconWidget(
                                  color: Colors.white,
                                  icon: Icons.zoom_in_map_sharp,
                                  size: 25.0,
                                ),
                                backgroundColor: ColorsApp.baseColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ));
      }),
    );
  }
}
