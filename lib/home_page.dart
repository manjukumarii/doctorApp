import 'package:doctor_app/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // User Profile (Image + Name)
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25, // Profile image size
                        backgroundImage: AssetImage("assets/images/user.png"),
                      ),
                      const SizedBox(width: 10), // Space between image and name
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Hello, Mohamed", // Replace with the actual user's name
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "How are you today?", // Greeting text
                            style: TextStyle(
                              fontSize: 15,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Notification Icon
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 2),
                              blurRadius: 2,
                              color: grey)
                        ]),
                    child: IconButton(
                      onPressed: () {
                        // Add notification action here
                      },
                      icon: Icon(
                        Icons.notifications_active_outlined,
                        size: 30,
                        color: black, // Change color as needed
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 90,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    cursorColor: grey,
                    style: const TextStyle(fontSize: 14), // Smaller text size
                    decoration: InputDecoration(
                      hintText: "Search for 'Doctors'",
                      hintStyle: TextStyle(fontSize: 18, color: grey),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(width: 1.5, color: grey),
                      ),
                      prefixIcon: Icon(Icons.search, color: grey),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // "Our Services" Title
                  const Text(
                    "Our Services",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  // Service Cards
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Aligns to the left
                              children: [
                                Image.asset(
                                  "assets/images/cilinic_op.png",
                                  height: 35,
                                  alignment: Alignment
                                      .centerLeft, // Aligns image to left
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  "Clinic Appointment",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Aligns to the left
                              children: [
                                Image.asset(
                                  "assets/images/offline_op.png",
                                  height: 35,
                                  alignment: Alignment
                                      .centerLeft, // Aligns image to left
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  "offline Appointment",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
