import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_generator/core/repository/settings_repository.dart';

import 'core/di/service_locator.dart';

class AppSettings extends StatefulWidget {
  final Widget child;

  AppSettings({required this.child}) : super();

  @override
  State<StatefulWidget> createState() => AppSettingsState();
}

class AppSettingsState extends State<AppSettings> {
  late SettingsRepository _settingsRepository;
  late ThemeMode _theme;

  @override
  void initState() {
    super.initState();
    _settingsRepository = sl.get<SettingsRepository>();
    _theme = _settingsRepository.darkModeEnabled ? ThemeMode.dark : ThemeMode.system;
  }

  ThemeMode get theme {
    return _theme;
  }

  void set theme(ThemeMode newTheme) {
    _settingsRepository.darkModeEnabled = newTheme == ThemeMode.dark ? true : false;
    setState(() {
      _theme = newTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppSettingsChanger(settings: this, child: widget.child);
  }
}

// Inherited widget stores the State of the AppSettings class
class AppSettingsChanger extends InheritedWidget {
  final AppSettingsState settings;

  AppSettingsChanger({required this.settings, required Widget child})
      : super(child: child);

  static AppSettingsState of(BuildContext context) {
    var inherited = context.dependOnInheritedWidgetOfExactType<AppSettingsChanger>();
    return inherited!.settings;
  }

  static ThemeMode getTheme(BuildContext context) {
    var inherited = context.dependOnInheritedWidgetOfExactType<AppSettingsChanger>();
    return inherited!.settings._theme;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
