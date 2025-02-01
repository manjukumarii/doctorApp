import 'package:flutter/material.dart';
import 'package:doctor_app/colors.dart';

class CategorySection extends StatelessWidget {
  CategorySection({super.key});

  final List<Map<String, dynamic>> categories = [
    {'name': 'Cardiologist', 'icon': Icons.favorite},
    {'name': 'Neurologist', 'icon': Icons.psychology},
    {'name': 'Dermatologist', 'icon': Icons.spa},
    {'name': 'Pulmonologist', 'icon': Icons.air},
    {'name': 'Surgeon', 'icon': Icons.local_hospital},
    {'name': 'Nephrologist', 'icon': Icons.opacity},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 2.2,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 3),
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(categories[index]['icon'], size: 20, color: primaryColor),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    categories[index]['name'],
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
