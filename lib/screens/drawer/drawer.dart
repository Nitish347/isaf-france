import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isaf/screens/web_view.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Drawer header with logo
           DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Replace with your logo
                // CircleAvatar(
                //   radius: 100.0,
                //   backgroundImage: AssetImage(''), // Add your logo image here
                //   backgroundColor: Colors.white,
                // ),
                Image(
                  image: AssetImage("assets/ISAF.png"),
                  height: 100,
                ),
                SizedBox(height: 10),
                Text(
                  'Indian Student Assistance Portal',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight*0.02,
                  ),
                ),
              ],
            ),
          ),
          // Drawer list options
          Expanded(
            child: ListView(
              children: [

                _createDrawerItem(
                  icon: Icons.group,
                  text: 'Dashboard',
                  onTap: () {
                    // Add navigation or functionality here
                    Navigator.pop(context);
                    Get.to(() => MyWebsite(
                        url: "https://isafrance.org/profile", title: "Dashboard"));
                  },
                ),
                _createDrawerItem(
                  icon: Icons.info,
                  text: 'About',
                  onTap: () {
                    // Add navigation or functionality here
                    Navigator.pop(context);
                    Get.to(() => MyWebsite(
                        url: "https://isafrance.org/about", title: "About"));
                  },
                ),     _createDrawerItem(
                  icon: Icons.info,
                  text: 'Why ISAP',
                  onTap: () {
                    // Add navigation or functionality here
                    Navigator.pop(context);
                    Get.to(() => MyWebsite(
                        url: "https://isafrance.org/WhyIsap", title: "Why ISAP"));
                  },
                ),
                _createDrawerItem(
                  icon: Icons.group,
                  text: 'Team',
                  onTap: () {
                    // Add navigation or functionality here
                    Navigator.pop(context);
                    Get.to(() => MyWebsite(
                        url: "https://isafrance.org/team", title: "Team"));
                  },
                ),
                _createDrawerItem(
                  icon: Icons.photo_album,
                  text: 'Gallery',
                  onTap: () {
                    // Add navigation or functionality here
                    Navigator.pop(context);
                    Get.to(() => MyWebsite(
                        url: "https://isafrance.org/comingsoon", title: "Gallery"));
                  },
                ),
                _createDrawerItem(
                  icon: Icons.event,
                  text: 'Events',
                  onTap: () {
                    // Add navigation or functionality here
                    Navigator.pop(context);
                    Get.to(() => MyWebsite(
                        url: "https://isafrance.org/comingsoon", title: "Events"));
                  },
                ),
                _createDrawerItem(
                  icon: Icons.event,
                  text: 'Register',
                  onTap: () {
                    // Add navigation or functionality here
                    Navigator.pop(context);
                    Get.to(() => MyWebsite(
                        url: "https://isafrance.org/register", title: "Register"));
                  },
                ),
              ],
            ),
          ),
          // Footer with a small message or additional info
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Version 1.0.0',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create drawer items
  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 2,
        child: ListTile(
          trailing: const Icon(
            Icons.navigate_next,
            color: Colors.blueAccent,
          ),
          leading: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Icon(icon, color: Colors.white)),
          title: Text(
            text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
