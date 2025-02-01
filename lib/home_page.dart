import 'package:doctor_app/colors.dart';
import 'package:doctor_app/custome_widgets/category_section.dart';
import 'package:doctor_app/custome_widgets/offer_section.dart';
import 'package:doctor_app/custome_widgets/top_doctors_section.dart';
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // User Profile and Notification Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // User Profile (Image + Name)
              Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/images/user.jpg"),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hello, Mohamed",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "How are you today?",
                        style: TextStyle(fontSize: 15, color: primaryColor),
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
                        color: Colors.grey.withOpacity(0.3)),
                  ],
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_active_outlined,
                      size: 30, color: Colors.black),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Search Bar
          TextField(
            cursorColor: grey,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              hintText: "Search for 'Doctors'",
              hintStyle: TextStyle(fontSize: 18, color: grey),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
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

          // "Offers" Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Offers",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextButton(
                onPressed: () {},
                child: Text("See All",
                    style: TextStyle(color: primaryColor, fontSize: 18)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const OffersListView(),

          const SizedBox(height: 20),

          // Category Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Categories",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextButton(
                onPressed: () {},
                child: Text("See All",
                    style: TextStyle(color: primaryColor, fontSize: 18)),
              ),
            ],
          ),
          CategorySection(),

          const SizedBox(height: 20),

          // Top Doctors Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Top Doctors",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextButton(
                onPressed: () {},
                child: Text("See All",
                    style: TextStyle(color: primaryColor, fontSize: 18)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const TopDoctorsSection(),
        ]),
      ),
    );
  }
}
