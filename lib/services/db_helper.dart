import 'package:flutter/cupertino.dart';
import 'package:pitjarus_test/models/stores.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String tableStore = 'tb_stores';
  final String columnStoreCode = 'store_code';
  final String columnStoreId = 'store_id';
  final String columnStoreName = 'store_name';
  final String columnStoreAddress = 'address';
  final String columnDcName = 'dc_name';
  final String columnAccountName = 'account_name';
  final String columnSubchannelName = 'subchannel_name';
  final String columnChannelName = 'channel_name';
  final String columnAreaName = 'area_name';
  final String columnRegionName = 'region_name';
  final String columnLatitude = 'latitude';
  final String columnLongitude = 'longitude';
  final String columnIsVisit = 'is_visit';
  static Database? _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'dbstores3.db');
    var db = await openDatabase(path, version: 6, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int NewViersion) async {
    await db.execute(
        'CREATE TABLE $tableStore(id INTEGER PRIMARY KEY AUTOINCREMENT, $columnStoreId,$columnStoreName TEXT,$columnSubchannelName TEXT,$columnStoreAddress TEXT,$columnDcName TEXT,$columnAccountName TEXT, $columnChannelName TEXT,$columnAreaName TEXT,$columnRegionName,$columnLongitude TEXT,$columnLatitude TEXT,$columnStoreCode TEXT,$columnIsVisit TEXT NULL)');

    // await db.execute(
    //     'CREATE TABLE $tableStore(id INTEGER PRIMARY KEY AUTOINCREMENT, $columnStoreId INTEGER, $columnStoreName TEXT, $columnDcName  TEXT,$columnAccountName Text,$columnAreaName  TEXT,$columnRegionName  TEXT,$columnSubchannelName TEXT),$columnChannelName TEXT,$columnLatitude TEXT,$columnLongitude TEXT');
  }

//save note
  Future<int> save(BuildContext context, StoreModel storeModel) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableStore, storeModel.toMap());

    // var result = await dbClient.insert(tableStore, {
    //   columnStoreId: storeId.toString(),
    //   columnStoreCode: storeCode.toString(),
    //   columnStoreName: storeName.toString(),
    //   columnStoreAddress: address.toString(),
    //   columnAccountName: accountName.toString(),
    //   columnSubchannelName: accountName.toString(),
    //   columnChannelName: channelName.toString(),
    //   columnAreaName: areaName.toString(),
    //   columnRegionName: regionName.toString(),
    //   columnLatitude: latitude.toString(),
    //   columnLongitude: longitude.toString(),
    //   columnDcName: dcName.toString(),
    //   columnIsVisit: '1'
    // });

    return result;
  }

  //Get notes
  Future list() async {
    var dbClient = await db;
    var result = await dbClient.query(
      tableStore,
      columns: [
        'id',
        columnStoreCode,
        columnStoreId,
        columnStoreName,
        columnStoreAddress,
        columnDcName,
        columnAccountName,
        columnSubchannelName,
        columnChannelName,
        columnAreaName,
        columnRegionName,
        columnLatitude,
        columnLongitude,
        columnIsVisit,
      ],
    );
    return result;
  }

  Future<int> delete() async {
    var dbClient = await db;
    return await dbClient.delete(tableStore);
  }
}
