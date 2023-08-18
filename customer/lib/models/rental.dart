class Rental {
  final int id;
  final String name;
  final int price;
  final List<String> images;

  Rental(this.id, this.name, this.price, this.images);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'images': images,
    };
  }

  factory Rental.fromJson(Map<String, dynamic> json) {
    return Rental(
      json['id'],
      json['name'],
      json['price'],
      (json['images'] as List<dynamic>).cast<String>(),
    );
  }
}
