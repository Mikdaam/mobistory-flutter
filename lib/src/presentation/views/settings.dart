import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SettingsScreen extends HookWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeController = useProvider(themeProvider);
    final languageController = useProvider(languageProvider);
    final notificationController = useProvider(notificationProvider);
    final cacheController = useProvider(cacheProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Theme Settings",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SwitchListTile(
              title: const Text("Dark Mode"),
              value: themeController.isDarkTheme,
              onChanged: (value) => themeController.toggleTheme(),
            ),
            const SizedBox(height: 20),

            const Text(
              "Language Settings",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: languageController.selectedLanguage,
              onChanged: (newValue) {
                languageController.setLanguage(newValue);
                // You can implement language change logic here
              },
              items: languageController.supportedLanguages.map((language) {
                return DropdownMenuItem<String>(
                  value: language,
                  child: Text(language),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            const Text(
              "Notification Settings",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SwitchListTile(
              title: const Text("Receive Notifications"),
              value: notificationController.receiveNotifications,
              onChanged: (value) => notificationController.toggleNotifications(),
            ),
            const SizedBox(height: 20),

            const Text(
              "Cache Management",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Implement cache clearing logic here
                cacheController.clearCache();
              },
              child: const Text(
                "Clear Cache",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
