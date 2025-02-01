class OffersModel {
  final String title;
  final String description;
  final String imageUrl;

  OffersModel({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

List<OffersModel> offersList = [
  OffersModel(
    title: "Hello Doctors!",
    description: "Get 50% off when you book your first doctor consultation.",
    imageUrl: "assets/images/offers/1st_offer.jpg",
  ),
  OffersModel(
    title: "Hello Doctors!",
    description: "Book now and get a free full-body checkup.",
    imageUrl: "assets/images/offers/2nd_offer.jpg",
  ),
  OffersModel(
    title: "Hello Doctors!",
    description: "Get 20% off on all lab tests this month.",
    imageUrl: "assets/images/offers/3rd_offer.png",
  ),
];
