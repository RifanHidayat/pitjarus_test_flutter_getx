import 'dart:convert';

class StoreModel {
  var id;
  var storeId;
  var storeCode;
  var storeName;
  var address;
  var dcName;
  var accountName;
  var subchannelName;
  var channelName;
  var areaName;
  var regionName;
  var latitude;
  var longitude;
  var distance;
  var lastVisit;

  StoreModel(
      {this.storeCode,
      this.storeName,
      this.address,
      this.dcName,
      this.accountName,
      this.subchannelName,
      this.areaName,
      this.channelName,
      this.latitude,
      this.longitude,
      this.regionName,
      this.storeId,
      this.lastVisit,
      this.distance,
      this.id});

  Map<String, dynamic> toMap() {
    return {
      'store_id': storeId.toString(),
      'store_code': storeCode.toString(),
      'store_name': storeName.toString(),
      "address": address.toString(),
      'dc_name': dcName.toString(),
      'account_name': accountName.toString(),
      'subchannel_name': subchannelName.toString(),
      'channel_name': channelName.toString(),
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
      'region_name': regionName.toString(),
      'area_name': areaName.toString(),
    };
  }

  Map<String, dynamic> toMapLastVisit() {
    return {
      'last_visit': storeId.toString(),
    };
  }

  factory StoreModel.fromJson(Map<String, dynamic> map) {
    return StoreModel(
        id: map['id'],
        storeCode: map['store_code'],
        storeName: map['store_name'],
        address: map['address'],
        dcName: map['dc_name'],
        accountName: map['account_name'],
        subchannelName: map['subcahnnel_name'],
        channelName: map['channel_name'],
        areaName: map['area_name'],
        latitude: map['latitude'],
        longitude: map['longitude'],
        regionName: map['region_name'],
        storeId: map['store_id'],
        lastVisit: map['last_visit'],
        distance: map['distance']);
  }

  static List<StoreModel> fromJsonToList(List data) {
    return List<StoreModel>.from(data.map(
      (item) => StoreModel.fromJson(item),
    ));
  }

  static String toJson(StoreModel data) {
    final mapData = data.toMap();
    return json.encode(mapData);
  }
}
