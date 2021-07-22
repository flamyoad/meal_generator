import 'package:meal_generator/core/persistence/i_local_storage.dart';
import 'package:meal_generator/core/persistence/local_storage_keys.dart';

class SettingsRepository {
  final ILocalStorage localStorage;
  
  SettingsRepository(this.localStorage);
  
  bool get darkModeEnabled {
    return localStorage.getBoolean(LocalStorageKeys.ENABLE_DARK_MODE);
  }
  set darkModeEnabled(bool value) {
    localStorage.putBoolean(LocalStorageKeys.ENABLE_DARK_MODE, value);
  }

}