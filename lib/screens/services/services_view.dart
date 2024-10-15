import 'package:flutter/material.dart';
import 'package:isaf/screens/services/services_card.dart';

class ServicesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {
      "title": "Administrative Support",
      "icon": Icons.star,
      "img": "assets/services/administrativeSupport.png",
      "details" : "Get hassle-free assistance for all your administrative needs, from student visas to residency cards and OCI applications, ensuring smooth transitions throughout your stay in France."
    },
    {
      "title": "Scholarships",
      "icon": Icons.school,
      'img': "assets/services/scholarship.png",
      "details" : "Maximize your potential with scholarships! We guide you through opportunities before admission, during your studies, and for higher education in France."
    },
    {
      "title": "Accommodation & Domicile",
      "icon": Icons.home,
      "img": "assets/services/accomodation.png",
      "details" : "Find your perfect home away from home. Our team helps you secure accommodations and assists with domicile formalities for a comfortable stay."
    },
    {
      "title": "Loan & Financing",
      "icon": Icons.attach_money,
      'img': "assets/services/loan.png",
      "details" : "We assist you in securing student loans and financing from top French banks, giving you financial freedom to focus on your studies."
    },
    {
      "title": "Daily Life Support",
      "icon": Icons.support,
      "img": "assets/services/support.png",
      "details" : "From setting up your bank account and Navigo card to CAF, social security, and CVEC, we’ll ensure you have everything in place for a smooth daily life in France."
    },
    {
      "title": "French Language Classes",
      "icon": Icons.language,
      'img': 'assets/services/french.png',
      "details" : "Master the French language with expert tutors, tailored to suit your level and pace, so you can thrive in academic and social settings."
    },
    {
      "title": "Career Guidance & Job Search",
      "icon": Icons.work,
      'img': 'assets/services/job.png',
      "details" : "Unlock your career potential with personalized guidance on internships, job placements, and navigating the French job market."
    },
    {
      "title": "Entrepreneurship & Company Creation",
      "icon": Icons.business,
      "img": "assets/services/Entrepreneurship.png",
      "details" : "Turn your ideas into reality! We provide support to help you start your business or venture while studying in France."
    },
  ];
  final List<String> urls = [];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Our Services",
          style: TextStyle(color: Colors.white),
        ),
        toolbarHeight: screenHeight * 0.09,
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 5),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = constraints.maxWidth < 600
                      ? 2
                      : 3; // Responsive grid layout

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 5 / 6,
                    ),
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      return ServiceCard(
                        title: services[index]['title'],
                        icon: services[index]['icon'],
                        url: '',
                        isService: true,
                        img: services[index]['img'],
                        details: services[index]['details'],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
