import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:revision/src/core/app.dart';
import 'package:revision/src/core/services/dependency_injection_service.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await DependencyInjectionService.init();

  runApp(const MyApp());
}




