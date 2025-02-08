class CategoryModel {
  String id;
  String imageName;
  String name;
  CategoryModel({
    required this.id,
    required this.imageName,
    required this.name,
  });
  static List<CategoryModel> categories = [
    CategoryModel(
      id: 'genral',
      imageName: 'genral_light',
      name: 'Genral',
    ),
    CategoryModel(
      id: 'businees',
      imageName: 'business_light',
      name: 'Businees',
    ),
  ];
}
