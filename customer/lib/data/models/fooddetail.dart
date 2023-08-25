import 'food.dart';

class FoodDetails {
  final Food food;
  final Map<String, int> selectedAddons;
  final int finalPrice;

  FoodDetails(this.food, this.selectedAddons, this.finalPrice);

  Map<String, dynamic> toJson() {
    return {
      'food': food.toJson(),
      'selectedAddons': selectedAddons,
      'finalPrice': finalPrice,
    };
  }

  factory FoodDetails.fromJson(Map<String, dynamic> json) {
    return FoodDetails(
      Food.fromJson(json['food']),
      Map<String, int>.from(json['selectedAddons']),
      json['finalPrice'],
    );
  }
}
