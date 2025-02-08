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
      id: 'general',
      imageName: 'genral_light',
      name: 'Genral',
    ),
    CategoryModel(
      id: 'business',
      imageName: 'business_light',
      name: 'Businees',
    ),
    CategoryModel(
      id: 'entertainment',
      imageName: 'entertainment',
      name: 'Entertainment',
    ),
    CategoryModel(
      id: 'health',
      imageName: 'health',
      name: 'Health',
    ),
    CategoryModel(
      id: 'science',
      imageName: 'science',
      name: 'Science',
    ),
    CategoryModel(
      id: 'technology',
      imageName: 'technology',
      name: 'Technology',
    ),
    CategoryModel(
      id: 'sports',
      imageName: 'sports',
      name: 'Sports',
    ),
  ];
}
