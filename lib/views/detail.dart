import 'package:flutter/material.dart';
import 'package:format_indonesia/format_indonesia.dart';

import 'package:get/get.dart';
import 'package:pitjarus_test/assets/colors.dart';
import 'package:pitjarus_test/assets/size.dart';
import 'package:pitjarus_test/controllers/stores.dart';
import 'package:pitjarus_test/models/stores.dart';
import 'package:pitjarus_test/routes/name.dart';
import 'package:pitjarus_test/views/widgets/Icon.dart';
import 'package:pitjarus_test/views/widgets/button.dart';
import 'package:pitjarus_test/views/widgets/label.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key}) : super(key: key);

  final StoresController storeController = Get.put(StoresController());
  final waktu = Waktu();

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
    storeController.id.value = args.id;

    return WillPopScope(
      onWillPop: () async {
        Get.offNamedUntil(RoutesName.list, (route) => false);
        return false;
        //return true;
      },
      child: Scaffold(
        body: Obx(() {
          storeController.id.value = args.id;
          storeController.setLastVisit();
          return Container(
              height: Get.mediaQuery.size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: Get.mediaQuery.size.width,
                    height: Get.mediaQuery.size.height / 2 - 100,
                    color: ColorsApp.baseColor,
                    child: Image.network(
                        "https://cdn-2.tstatic.net/tribunnews/foto/bank/images/toko-online_20180329_153339.jpg",
                        fit: BoxFit.fill, loadingBuilder: (BuildContext context,
                            Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    }),
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
                                          text: "${args.id}",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            text:
                                                storeController.username.value,
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
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      width: Get.mediaQuery.size
                                                              .width /
                                                          4,
                                                      child: LabelWidget(
                                                        text: data[index]
                                                            ['name'],
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                            children: <Widget>[
                                              const LabelWidget(
                                                text: "Last Visit",
                                              ),
                                              args.lastVisit != null
                                                  ? LabelWidget(
                                                      text: Waktu(DateTime
                                                              .parse(args
                                                                  .lastVisit))
                                                          .yMMMEd(),
                                                    )
                                                  : const LabelWidget(
                                                      text: "-",
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
                              onPressed: () {
                                Get.offNamedUntil(
                                    RoutesName.list, (route) => false);
                              },
                              width: Get.mediaQuery.size.width / 2 - 20,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ButtonWidget(
                              text: "Visit",
                              onPressed: () {
                                Get.offNamedUntil(
                                    RoutesName.list, (route) => false);
                              },
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
                                side:
                                    BorderSide(color: Colors.white70, width: 1),
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
                                side:
                                    BorderSide(color: Colors.white70, width: 1),
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
                                side:
                                    BorderSide(color: Colors.white70, width: 1),
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
      ),
    );
  }
}
