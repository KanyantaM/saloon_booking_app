class HomeScreenModel {
  const HomeScreenModel({
    this.image,
  });

  final image;
}

List<HomeScreenModel> home = [
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
