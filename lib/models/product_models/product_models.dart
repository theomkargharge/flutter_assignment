class ProductModel {
  final String image;
  final String id;
  final String name;
  final String price;
  final String description;
  final String status;
  bool isFav;
  final int? qty;

  ProductModel(
      {required this.image,
      required this.id,
      required this.name,
      required this.price,
      required this.description,
      required this.status,
      required this.isFav,
      required this.qty});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      image: json['image'] ?? '', // Handle null or missing values
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      price: (json['price'] ?? 0.0).toString(), // Handle null or missing values
      description: json['description'] ?? '',
      isFav: false,
      qty: json['qty'],
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'status': status,
      'isFav': isFav,
      'qty': qty,
    };
  }

  @override
  ProductModel copyWith({
    final int? qty,
  }) =>
      ProductModel(
          image: image,
          id: id,
          name: name,
          price: price,
          description: description,
          status: status,
          isFav: isFav,
          qty: qty ?? this.qty);
}
