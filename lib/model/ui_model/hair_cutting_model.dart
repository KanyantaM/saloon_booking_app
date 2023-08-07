class HairCuttingModel {
  const HairCuttingModel({
    this.image,
    this.title,
  });

  final image;
  final title;
}

List<HairCuttingModel> hairCutting = [
  HairCuttingModel(
    image: "assets/Rectangle 139678.png",
    title: "Color\nCouture",
  ),
  HairCuttingModel(
    image: "assets/Rectangle 139679.png",
    title: "Color\nCouture",
  ),
  HairCuttingModel(
    image: "assets/Rectangle 139680.png",
    title: "Color\nCouture",
  ),
  HairCuttingModel(
    image: "assets/Rectangle 139681.png",
    title: "Brush & Blend",
  ),
];

List<HairCuttingModel> get hairCuttingList => hairCutting;
