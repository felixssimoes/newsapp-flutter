import 'package:flutter/material.dart';
import 'package:newsapp/app/app.dart';
import 'package:newsapp/config/locator.config.dart';

void main() {
  setupLocator();
  runApp(NewsApp());
}
