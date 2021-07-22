abstract class ILocalStorage {
  Future<ILocalStorage> init(String dbName);

  String getString(String key, {String defaultValue});
  void putString(String key, String value);

  bool getBoolean(String key, {bool defaultValue});
  void putBoolean(String key, bool value);
}