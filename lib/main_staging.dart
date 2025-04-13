import 'package:flutter/material.dart';
import 'package:pos/main.dart';
import 'config/app_config.dart';
import 'config/flavor.dart';

void main() {
  AppConfig.initialize(flavor: Flavor.staging);
  runApp(SpotifyApp());
}
