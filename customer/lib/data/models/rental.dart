class Rental {
  final int id;
  final String name;
  final int engineCapacity;
  final int mileage;
  final int price;
  final List<String> images;

  Rental(this.id, this.name, this.engineCapacity, this.mileage, this.price, this.images);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'engineCapacity': engineCapacity,
      'mileage': mileage,
      'price': price,
      'images': images,
    };
  }

  factory Rental.fromJson(Map<String, dynamic> json) {
    return Rental(
      json['id'],
      json['name'],
      json['engineCapacity'],
      json['mileage'],
      json['price'],
      (json['images'] as List<dynamic>).cast<String>(),
    );
  }
}
