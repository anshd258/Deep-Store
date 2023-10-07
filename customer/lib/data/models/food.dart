class Food {
  final int foodID;
  final String name;
  final String description;
  final String category;
  final String type;
  final bool veg;
  final bool available;
  final double finalPrice;
  final double price;
  final Map<String, int>? addOns;
  final String? images;

  Food({
    required this.foodID,
    required this.name,
    required this.description,
    required this.category,
    required this.type,
    required this.veg,
    required this.available,
    required this.finalPrice,
    required this.price,
    this.addOns,
    this.images,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      foodID: json['id'] as int,
      name: json['name'] as String,
      description: json['desc'] as String,
      category: json['category'] as String,
      type: json['type'] as String,
      veg: json['veg'] as bool,
      available: json['available'] as bool,
      finalPrice: json['final_price'] as double,
      price: json['price'] as double,
      addOns: (json['options'] as Map<String, dynamic>?)?.map(
        (key, value) => MapEntry(key, (value as double).toInt()),
      ),
      images: json['image'],
      // images: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'foodID': foodID,
      'name': name,
      'description': description,
      'category': category,
      'type': type,
      'veg': veg,
      'available': available,
      'finalPrice': finalPrice,
      'price': price,
      'addOns': addOns,
      'images': images,
    };
  }
}
