import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:isaf/screens/services/services_view.dart';

import 'home/home_view.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Simulate a delay for the splash screen (e.g., 3 seconds)
    Future.delayed(Duration(milliseconds: 1500), () {
      // Navigate to home screen or next screen
      Get.off(()=>HomeScreen());
      // Get.off(()=>MyWebsite(title: "Website",url: "https://isafrance.org/register")); // Replace with your home route
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade900, // Dark blue matching the logo
              Colors.blue.shade300, // Lighter blue gradient
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated Logo
              Image.asset('assets/ISAF.png',height: 150,)
                  .animate()
                  .scale(duration: GetNumUtils(1).seconds, curve: Curves.easeInOut)
                  .fadeIn(duration: GetNumUtils(1).seconds), // Fade-in and scale animation

              SizedBox(height: 20),

              // Text that matches the logo's font style and color
              Text(
                'Indian Student Assistance  Portal',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White text to stand out on the gradient
                  letterSpacing: 1.2, // Slight spacing to match the logo's clean look
                ),
              ),

              SizedBox(height: 20),

              // Optional: Add a loading indicator or text

            ],
          ),
        ),
      ),
    );
  }
}
