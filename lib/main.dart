import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/core/app/app.dart';
import 'package:hr_management/core/service_locator/service_locator.dart';
import 'package:hr_management/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const HrManagementApp());
}
