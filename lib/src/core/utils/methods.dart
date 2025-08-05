import 'dart:developer';

import 'package:flutter/foundation.dart';

class Methods {
  static final Methods _instance = Methods._internal();

  Methods._internal();

  factory Methods() => _instance;

  static void printLog(String message, {String name = ''}) {
    if (kDebugMode) log(message, name: name);
  }
}