import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isaf/screens/auth/register.dart';
import 'package:isaf/screens/splash_screen.dart';
import 'package:isaf/screens/web_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: MyWebsite(title: "Website",url: "https://isafrance.org/register"),
      home: SplashScreen(),
    );
  }
}
