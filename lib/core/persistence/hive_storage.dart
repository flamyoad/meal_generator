import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_generator/core/persistence/i_local_storage.dart';

class HiveStorage extends ILocalStorage {
  late Box _hiveBox;

  @override
  Future<HiveStorage> init(String dbName) async {
    await Hive.initFlutter();
    _hiveBox = await Hive.openBox(dbName);
    return this;
  }

  @override
  String getString(String key, {String defaultValue = ''}) {
    return _hiveBox.get(key, defaultValue: defaultValue);
  }

  @override
  void putString(String key, String value) {
    _hiveBox.put(key, value);
  }

  @override
  bool getBoolean(String key, {bool defaultValue = true}) {
    return _hiveBox.get(key, defaultValue: defaultValue);
  }

  @override
  void putBoolean(String key, bool value) {
    _hiveBox.put(key, value);
  }
}