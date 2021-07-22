import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSettings extends StatefulWidget {
  final Widget child;

  AppSettings({required this.child}) : super();

  @override
  State<StatefulWidget> createState() => AppSettingsState();
}

class AppSettingsState extends State<AppSettings> {
  ThemeMode theme = ThemeMode.system;

  setTheme(ThemeMode newTheme) {
    setState(() {
      theme = newTheme;
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
    return inherited!.settings.theme;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
