import 'package:bekya/core/shared/my_shared.dart';
import 'package:bekya/core/shared/my_shared_keys.dart';
import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/features/login/view/screens/login_screen.dart';
import 'package:bekya/features/main/view/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyShared.init();
  await Firebase.initializeApp();
  runApp(const MyApp(


  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (p0, p1, p2) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          useMaterial3: true,
        ),
        home: MyShared.getString(key: MySharedKeys.userid).isEmpty ?   LoginScreen() : const MainScreen(),
      );
    },);
  }
}

