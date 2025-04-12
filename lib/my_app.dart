import 'package:flutter/material.dart';
import 'config/app_config.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final config = AppConfig.instance;

    return MaterialApp(
      title: 'My App (${config.flavor.name})',
      home: Scaffold(
        appBar: AppBar(title: Text('Environment: ${config.flavor.name}')),
        body: Center(child: Text('Base URL: ${config.baseUrl}')),
      ),
    );
  }
}
