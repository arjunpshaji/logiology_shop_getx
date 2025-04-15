class ProductModel {
  final String title, thumbnail, category;
  final double price, rating;
  final List<String> tags;

  ProductModel({required this.title, required this.thumbnail, required this.price, required this.rating, required this.category, required this.tags});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    title: json['title'],
    thumbnail: json['thumbnail'],
    price: json['price'].toDouble(),
    rating: json['rating'].toDouble(),
    category: json['category'] ?? "",
    tags: (json['tags'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
  );
}
