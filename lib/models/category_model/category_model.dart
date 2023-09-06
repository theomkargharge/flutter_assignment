class CategoryModel {
  final String image;
  final String id;
  final String name;

  CategoryModel({required this.id, required this.image, required this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? '',
      image: json['image'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
