import 'package:doctor_app/colors.dart';
import 'package:doctor_app/model/doctors_model.dart';
import 'package:doctor_app/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopDoctorsSection extends StatelessWidget {
  const TopDoctorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: topDoctors.length,
        itemBuilder: (context, index) {
          final doctor = topDoctors[index];
          bool isFavorite = homeProvider.favoriteDoctorIds.contains(doctor.id);
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 3),
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Doctor's Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    doctor.imageUrl,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12),

                // Doctor Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        doctor.category,
                        style: TextStyle(color: Colors.grey[700], fontSize: 14),
                      ),
                      SizedBox(height: 4),
                      Text(
                        doctor.location,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          SizedBox(width: 4),
                          Text(
                            "${doctor.rating} (${doctor.reviews} reviews)",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Favorite Button and Charges
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        homeProvider.toggleFavorite(doctor.id);
                      },
                    ),
                    SizedBox(height: 8),
                    Text(
                      "EGP ${doctor.charges}",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
