class CateGoryModel {
  const CateGoryModel({
    this.image,
    this.title,
  });

  final image;
  final title;
}

List<CateGoryModel> category = [
  CateGoryModel(
    image: "assets/Group 19134.png",
    title: "Make-up",
  ),
  CateGoryModel(
    image: "assets/Path 44379.png",
    title: "Make-up",
  ),
  CateGoryModel(
    image: "assets/Path 44380.png",
    title: "Make-up",
  ),
  CateGoryModel(
    image: "assets/Group 19126.png",
    title: "Make-up",
  ),
  CateGoryModel(
    image: "assets/Group 19121.png",
    title: "Make-up",
  ),
  CateGoryModel(
    image: "assets/Group 19128.png",
    title: "Make-up",
  ),
];

List<CateGoryModel> get categoryList => category;
