
import '../../middleware/helpers/constants.dart';


class   Rental {
  final int id;
  final String name;
  String description;
  final double price;
  final String? image;
  final String? engineCapacity;
  final String? mileage;
  final String? fuelType;
  final int? seatingCapacity;
  final VehicleType type;
  int quantity;

  Rental({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.image,
    this.engineCapacity,
    this.mileage,
    this.fuelType,
    this.seatingCapacity,
    required this.type,
    required this.quantity,
  });

  factory Rental.fromJson(Map<String, dynamic> json) {
    VehicleType mapStringToVehicleType(String typeString) {
      if (typeString == "TWO_WHEELER") {
        return VehicleType.TWO_WHEELER;
      } else if (typeString == "FOUR_WHEELER") {
        return VehicleType.FOUR_WHEELER;
      } else {
        return VehicleType.TWO_WHEELER;
      }
    }

    return Rental(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      image:json['image'],
      engineCapacity: json['engineCapacity'],
      mileage: json['mileage'],
      fuelType: json['fuelType'],
      seatingCapacity: json['seatingCapacity'],
      type: mapStringToVehicleType(json['_type']),
      quantity: json['quantity'] as int,
    );
  }


}
