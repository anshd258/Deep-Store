class Food {
  final int foodID;
  final String name;
  final String description;
  final int price;
  final Map<String, int> addOns;
  final List<String> images;

  Food(this.foodID, this.name, this.description, this.price, this.addOns, this.images);

  Map<String, dynamic> toJson() {
    return {
      'foodID': foodID,
      'name': name,
      'description': description,
      'price': price,
      'addOns': addOns,
      'images': images,
    };
  }

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      json['foodID'],
      json['name'],
      json['description'],
      json['price'],
      Map<String, int>.from(json['addOns']),
      List<String>.from(json['images']),
    );
  }
}
