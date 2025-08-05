
import 'package:hive/hive.dart';

class HiveManager {
  static final HiveManager instance = HiveManager._internal();

  factory HiveManager() => instance;

  HiveManager._internal();

  /// Open a Hive box if not already open
  Future<Box> openBox(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox(boxName);
    } else {
      return Hive.box(boxName);
    }
  }

  /// Save data into Hive box
  Future<void> save<T>(String boxName, String key, T value) async {
    final box = await openBox(boxName);
    await box.put(key, value);
  }


  /// Get data from Hive box
  Future<T?> get<T>(String boxName, String key) async {
    final box = await openBox(boxName);
    return box.get(key);
  }

  /// Delete data from Hive box
  Future<void> delete(String boxName, String key) async {
    final box = await openBox(boxName);
    await box.delete(key);
  }

  /// Close a Hive box if it is open
  Future<void> closeBox(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      final box = Hive.box(boxName);
      await box.close();
    }
  }

  /// Close all open Hive boxes
  Future<void> closeAllBoxes() async {
    await Hive.close();
  }
}


