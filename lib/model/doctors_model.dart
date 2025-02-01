class DoctorModel {
  final String id;
  final String name;
  final String category;
  final String location;
  final double rating;
  final int reviews;
  final double charges;
  final String imageUrl;

  DoctorModel({
    required this.id,
    required this.name,
    required this.category,
    required this.location,
    required this.rating,
    required this.reviews,
    required this.charges,
    required this.imageUrl,
  });
}

List<DoctorModel> topDoctors = [
  DoctorModel(
    id: "1",
    name: "Dr. Rajesh Sharma",
    category: "Neurologist",
    location: "Delhi, India",
    rating: 4.8,
    reviews: 120,
    charges: 1500.0,
    imageUrl: "assets/images/doctors/1st_doctors.jpg",
  ),
  DoctorModel(
    id: "2",
    name: "Dr. Priya Verma",
    category: "Cardiologist",
    location: "Mumbai, India",
    rating: 4.7,
    reviews: 95,
    charges: 2000.0,
    imageUrl: "assets/images/doctors/1st_g.jpg",
  ),
  DoctorModel(
    id: "3",
    name: "Dr. Anil Mehta",
    category: "Orthopedic",
    location: "Bangalore, India",
    rating: 4.6,
    reviews: 80,
    charges: 1800.0,
    imageUrl: "assets/images/doctors/2nd.png",
  ),
  DoctorModel(
    id: "4",
    name: "Dr. Sneha Kapoor",
    category: "Dermatologist",
    location: "Hyderabad, India",
    rating: 4.9,
    reviews: 150,
    charges: 1200.0,
    imageUrl: "assets/images/doctors/2nd_g.png",
  ),
  DoctorModel(
    id: "5",
    name: "Dr. Ramesh Agarwal",
    category: "Surgeon",
    location: "Chennai, India",
    rating: 4.5,
    reviews: 110,
    charges: 2500.0,
    imageUrl: "assets/images/doctors/3rd.png",
  ),
];
