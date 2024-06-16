import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_test/firebase_options.dart';
import 'package:flutter_firebase_test/utils/constants/colors.dart';
import 'package:flutter_firebase_test/view/screens/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: CColors.primaryColor),
        primaryColor: CColors.primaryColor,
        useMaterial3: true,
        fontFamily: "Sora",
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: CColors.primaryColor,
          selectionColor: CColors.primaryColor,
          selectionHandleColor: CColors.primaryColor,
        ),
        checkboxTheme: const CheckboxThemeData(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          constraints: const BoxConstraints(maxHeight: 50),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: CColors.primaryColor,
            foregroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            fixedSize: const Size.fromHeight(45),
          ),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          toolbarHeight: 70,
          color: CColors.primaryColor,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: const Login(),
    );
  }
}
