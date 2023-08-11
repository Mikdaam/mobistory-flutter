import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SettingsScreen extends HookWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*final themeController = useProvider(themeProvider);
    final languageController = useProvider(languageProvider);
    final notificationController = useProvider(notificationProvider);
    final cacheController = useProvider(cacheProvider);*/

    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Center(child: Text("Text"),)
      ),
    );
  }
}
