class Rental {
  final int id;
  final String name;
  final int price;
  final List<String> images;
  final String description; 

  Rental(this.id, this.name, this.price, this.images, this.description);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'images': images,
      'description': description,  
    };
  }

  factory Rental.fromJson(Map<String, dynamic> json) {
    return Rental(
      json['id'],
      json['name'],
      json['price'],
      (json['images'] as List<dynamic>).cast<String>(),
      json['description'], 
    );
  }
}
