import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends HookWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*final themeController = useProvider(themeProvider);
    final languageController = useProvider(languageProvider);
    final notificationController = useProvider(notificationProvider);
    final cacheController = useProvider(cacheProvider);*/

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Appearance'),
            tiles: [
              SettingsTile.switchTile(
                title: const Text('Dark Theme'),
                initialValue: false,
                leading: const Icon(Icons.brightness_4),
                onToggle: (value) {
                  /* Update dark theme setting */
                },
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Language'),
            tiles: [
              SettingsTile.navigation(
                title: const Text('Language'),
                leading: const Icon(Icons.language),
                onPressed: (BuildContext context) {
                  /* Navigate to language selection page */
                },
              )
            ],
          ),
          SettingsSection(
            title: const Text('Notifications'),
            tiles: [
              SettingsTile.switchTile(
                title: const Text('Notifications'),
                initialValue: false,
                leading: const Icon(Icons.notifications),
                onToggle: (value) {
                  /* Update notification setting */
                },
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Cache'),
            tiles: [
              SettingsTile(
                title: const Text('Clear Cache'),
                leading: const Icon(Icons.delete),
                onPressed: (BuildContext context) {
                  /* Show confirmation dialog to clear cache */
                },
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Other Settings'),
            tiles: [
              SettingsTile.switchTile(
                title: const Text('Event Reminders'),
                initialValue: false,
                leading: const Icon(Icons.alarm),
                onToggle: (value) {
                  /* Update event reminder setting */
                },
              ),
              SettingsTile.switchTile(
                title: const Text('Location Tracking'),
                leading: const Icon(Icons.location_on),
                initialValue: false,
                onToggle: (value) {
                  /* Update location tracking setting */
                },
              ),
              SettingsTile(
                title: const Text('Feedback'),
                leading: const Icon(Icons.feedback),
                onPressed: (BuildContext context) {
                  /* Open a feedback form */
                },
              ),
              SettingsTile(
                title: const Text('About Us'),
                leading: const Icon(Icons.info),
                onPressed: (BuildContext context) {
                  /* Navigate to about us page */
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
