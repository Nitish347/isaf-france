import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isaf/screens/services/services_card.dart';
import 'package:isaf/screens/services/services_view.dart';
import 'package:isaf/screens/web_view.dart';
import '../drawer/drawer.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> homeList = [
    {
      "title": "France Research Experts",
      "icon": Icons.groups_outlined,
      "url": "https://isafrance.org/experts"
    },
    {
      "title": "Research and Innovation",
      "icon": Icons.search,
      "url": "https://isafrance.org/research"
    },
  ];

  // final List<Map<String, dynamic>> services = [
  //   {
  //     "title": "Administrative Support",
  //     "icon": Icons.star,
  //     "img": "assets/services/administrativeSupport.png",
  //     "details":
  //         "Get hassle-free assistance for all your administrative needs, from student visas to residency cards and OCI applications, ensuring smooth transitions throughout your stay in France."
  //   },
  //   {
  //     "title": "Scholarships",
  //     "icon": Icons.school,
  //     'img': "assets/services/scholarship.png",
  //     "details":
  //         "Maximize your potential with scholarships! We guide you through opportunities before admission, during your studies, and for higher education in France."
  //   },
  // ];

  final List<String> urls = [];
  final List<String> partners = [
    "assets/europeanPayLogo.png",
    "assets/infotech.jpg",
    "assets/laxmibaiSeva.png",
    "assets/pramitFoundationLogo.png"
  ];
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
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: CustomDrawer(),

      appBar: AppBar(
        title: Text(
          "ISAP-France",
          style: TextStyle(color: Colors.white, fontSize: screenHeight * 0.03),
        ),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        toolbarHeight: screenHeight * 0.09,
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40)),
        ),
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 8.0),
            child: TextButton(
                onPressed: () {
                  Get.to(() => MyWebsite(
                      url: "https://isafrance.org/login", title: "Login"));
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white, fontSize: screenHeight * 0.02),
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: screenWidth,
                child:  Card(
                  surfaceTintColor: Colors.blueAccent,
                  elevation: 5,
                  color: Colors.blueAccent,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              "Being a student in France, if you need any kind of support and assistance, feel free to generate your request through the Indian Student Assistance Portal (ISAP)",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(width: 10), // Space between text and icon
                          InkWell(
                            onTap: (){
                              _showServiceDialog(context,"assets/ISAF.png");
                            },
                            child: Icon(
                              Icons.help_outline,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount =
                      constraints.maxWidth < 600 ? 2 : 3; // Responsive grid

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: homeList.length,
                    itemBuilder: (context, index) {
                      return ServiceCard(
                        title: homeList[index]['title'],
                        icon: homeList[index]['icon'],
                        url: homeList[index]['url'],
                        isService: false,
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Our Services",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     Get.to(() => ServicesScreen(),
                    //         transition: Transition.rightToLeft);
                    //   },
                    //   child: Text(
                    //     "show more >",
                    //     style: TextStyle(
                    //         color: Colors.black,
                    //         fontSize: 15,
                    //         fontWeight: FontWeight.w600),
                    //   ),
                    // ),
                  ],
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount =
                      constraints.maxWidth < 600 ? 2 : 3; // Responsive grid

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 5 / 6.2),
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      return ServiceCard(
                        title: services[index]['title'],
                        icon: services[index]['icon'],
                        isService: true,
                        url: '',
                        img: services[index]['img'],
                        details: services[index]['details'],
                      );
                    },
                  );
                },
              ),
              // const SizedBox(height: 15),
              // const Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         "Our Partners",
              //         style: TextStyle(
              //             color: Colors.black,
              //             fontSize: 20,
              //             fontWeight: FontWeight.w600),
              //       ),
              //     ],
              //   ),
              // ),
              // LayoutBuilder(
              //   builder: (context, constraints) {
              //     int crossAxisCount =
              //         constraints.maxWidth < 600 ? 2 : 3; // Responsive grid
              //
              //     return GridView.builder(
              //       shrinkWrap: true,
              //       physics: NeverScrollableScrollPhysics(),
              //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: crossAxisCount,
              //           crossAxisSpacing: 16,
              //           mainAxisSpacing: 30,
              //           childAspectRatio: 3 / 2),
              //       itemCount: partners.length,
              //       itemBuilder: (context, index) {
              //         return Image.asset(partners[index]);
              //       },
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
  void _showServiceDialog(BuildContext context, String imgPath,) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        imgPath,
                        // height: 100,
                        // width: 100,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 20),
                      // Adding the 5-step process here
                      Text(
                        "Simple 5-step process to generate a request:",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "1. First student should create an account using our App/website.\n"
                            "2. We will verify the student account (by confirming phone no/email ID/student ID).\n"
                            "3. Student can generate a request (select request category and give a 100-word description of the problem).\n"
                            "4. We will arrange a meeting (Google Meet) and provide necessary support and assistance.\n"
                            "5. Once the student is satisfied with our assistance, he/she can give feedback to us.",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Get.to(() => MyWebsite(
                              url: "https://isafrance.org/profile", title: "Assistance"));
                        },
                        child: const Text(
                          "Need Assistance",
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
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
