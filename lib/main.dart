import 'package:bekya/core/shared/my_shared.dart';
import 'package:bekya/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyShared.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

