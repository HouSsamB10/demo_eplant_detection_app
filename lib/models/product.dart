import 'dart:convert';

class Product {
  late int? id;
  late String? title;
  late String? description;
  late String? regular_price;
  late String? sale_price;
  late String? qty;
  late String? type;
  late String? discount;
  late List<String?> image;

  Product({
    required this.id,
    required this.description,
    required this.title,
    required this.regular_price,
    required this.discount,
    required this.qty,
    required this.sale_price,
    required this.type,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> data) {
    List<String?> listImage = [];
    for (var image in data['images']) {
      listImage.add(image['image_url']);
    }

    return Product(
      id: data['id'],
      title: data['title'].toString(),
      description: data['description'].toString(),
      regular_price: data['regular_price'].toString(),
      discount: data['discount'].toString(),
      qty: data['qty'].toString(),
      sale_price: data['sale_price'].toString(),
      type: data['type'].toString(),
      image: listImage,
    );
  }
}

class ImageUrl {
  String? image_url;

  ImageUrl({required this.image_url});

  factory ImageUrl.fromJson(Map<String, dynamic> data) {
    return ImageUrl(
      image_url: data['image_url'],
    );
  }
}
