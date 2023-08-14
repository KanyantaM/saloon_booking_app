class HomeScreenModel {
  const HomeScreenModel({
   required this.image,
  });

  final String image;
}

List<HomeScreenModel> home = const [
  HomeScreenModel(
    image: "assets/Rectangle 13.png",
  ),
  HomeScreenModel(
    image: "assets/Rectangle 14.png",
  ),
  HomeScreenModel(
    image: "assets/hair_cut.png",
  ),
];

List<HomeScreenModel> get homeList => home;
