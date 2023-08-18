class Ride {
  final int id;
  final String name;
  final int nos;
  final int price;
  final List<String> images;

  Ride(this.id, this.name, this.nos, this.price, this.images);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'nos': nos,
      'price': price,
      'images': images,
    };
  }

  factory Ride.fromJson(Map<String, dynamic> json) {
    return Ride(
      json['id'],
      json['name'],
      json['nos'],
      json['price'],
      (json['images'] as List<dynamic>).cast<String>(),
    );
  }
}
