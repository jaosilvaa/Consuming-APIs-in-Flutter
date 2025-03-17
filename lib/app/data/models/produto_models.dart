class ProdutoModel {
  final String title;
  final String description;
  final double price;
  final double rating;
  final String brand; // marca
  final String category;
  final String thumbnail;
  final List<String> images;

  ProdutoModel({
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory ProdutoModel.fromMap(Map<String, dynamic> map){
    return ProdutoModel(
      title: map['title'],
      description: map['description'] ?? '',
      price: map['price']!= null ? (map['price'] as num).toDouble(): 0.0,
      rating: map['rating']!= null ? (map['rating'] as num).toDouble() : 0.0,
      brand: map['brand'] ?? '',
      category: map['category'] ?? '',
      thumbnail: map['thumbnail'] ?? '',
      images:map['images'] != null
         ? List<String>.from(map['images'] as List) 
         :  [],
    );
  
  }
}
