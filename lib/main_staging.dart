import 'package:flutter/material.dart';
import 'config/app_config.dart';
import 'config/flavor.dart';
import 'my_app.dart';

void main() {
  AppConfig.initialize(flavor: Flavor.staging);
  runApp(const MyApp());
}
