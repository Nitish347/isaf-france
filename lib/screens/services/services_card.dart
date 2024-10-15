import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../web_view.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String url;
  final bool isService;
  final String? img;
  final String? details;

  ServiceCard({required this.title, required this.icon,required this.url,required this.isService,this.img,this.details});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Set dynamic icon size and padding based on screen size
    double iconSize = screenWidth * 0.1; // 10% of the screen width for icon size
    double textSize = screenWidth * 0.04; // 4% of the screen width for text size
    double cardPadding = screenWidth * 0.05; // 5% of screen width for padding

    return SizedBox(
      child: Card(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10,
        shadowColor: Colors.blueAccent,
        child: InkWell(
          onTap: () {
          isService ?  _showServiceDialog(context, title, img ?? "",details ?? "")  :  Get.to(()=>MyWebsite(title: title,url: url));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(cardPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                isService? Image.asset(img ?? "",height: screenHeight*0.1,)   :   CircleAvatar(
                    radius: screenHeight * 0.04,  // Increased size for more prominence
                    backgroundColor: isService ?   Colors.blueAccent : Colors.red,
                    child: Icon(icon, size: iconSize, color: Colors.white),
                  ),
                  SizedBox(height: screenHeight * 0.02), // Height scaled based on screen height
                  Flexible(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: textSize,
                        color: isService ?   Colors.black : Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _showServiceDialog(BuildContext context, String title, String imgPath, String details) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      imgPath,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 15),
                    Text(
                      title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      details,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),

                  SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Get.to(()=>MyWebsite(url:  "https://isafrance.org/profile", title: "Assistance"));
                      },
                      child: const Text(
                        "Need Assistance",
                        style: TextStyle(color: Colors.red,fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }


}
