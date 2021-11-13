import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_splash_cam/view/home_ui.dart';
import 'package:flutter_app_splash_cam/view/splash_screen_ui.dart';

void main() {
 
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeUI(),
    )
  );
}

