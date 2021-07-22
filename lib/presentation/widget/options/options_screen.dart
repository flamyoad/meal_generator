import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_generator/app_settings.dart';
import 'package:meal_generator/core/di/service_locator.dart';
import 'package:meal_generator/core/repository/settings_repository.dart';

class OptionsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  late SettingsRepository settingsRepository;

  @override
  void initState() {
    super.initState();
    settingsRepository = sl.get();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          _buildListHeader(title: 'Theme', icon: Icon(Icons.stream)),
          Flexible(
              child: SwitchListTile(
                  value: AppSettingsChanger.getTheme(context) == ThemeMode.dark ? true : false,
                  title: Text('Use dark mode'),
                  subtitle: Text('Saves battery on AMOLED screen'),
                  onChanged: (useDarkMode) {
                    if (useDarkMode) {
                      AppSettingsChanger.of(context).theme = ThemeMode.dark;
                    } else {
                      AppSettingsChanger.of(context).theme = ThemeMode.light;
                    }
                  })),
        ],
      ),
    );
  }

  Widget _buildListHeader({required String title, required Icon icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(width: 16),
          Flexible(child: icon),
          SizedBox(width: 8),
          Expanded(child: Text(title, style: TextStyle(fontSize: 18.0)))
        ],
      ),
    );
  }
}
