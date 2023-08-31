
import '../../middleware/helpers/constants.dart';

class Rental {
  final int id;
  final String name;
  final int price;
  final List<String> images;

  final VehicleType type;
  final int? engineCapacity;
  final int? mileage;
  final String? fuelType;
  final int? seatingCapacity;

  Rental({
    required this.id,
    required this.name,
    required this.price,
    required this.type,
    required this.images,
    this.engineCapacity,
    this.mileage,
    this.fuelType,
    this.seatingCapacity,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'type': type.toString(),
      'images': images,
      'engineCapacity': engineCapacity,
      'mileage': mileage,
      'fuelType': fuelType,
      'seatingCapacity': seatingCapacity,
    };
  }

  factory Rental.fromJson(Map<String, dynamic> json) {
    return Rental(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      type: VehicleTypeExtension.fromString(json['type']),
      images: (json['images'] as List<dynamic>).cast<String>(),
      engineCapacity: json['engineCapacity'],
      mileage: json['mileage'],
      fuelType: json['fuelType'],
      seatingCapacity: json['seatingCapacity'],
    );
  }
}
