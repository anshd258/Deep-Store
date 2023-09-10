import 'food.dart';

class FoodDetails {
  final Food food;
  final Map<String, int> selectedAddons;
  final int quantity;
  final double finalPrice;
  final double discount;

  FoodDetails(this.food, this.selectedAddons, this.finalPrice, this.quantity,
      this.discount);

  Map<String, dynamic> toJson() {
    return {
      'food': food.toJson(),
      'selectedAddons': selectedAddons,
      'finalPrice': finalPrice,
      'quantity': quantity,
      'discount': discount
    };
  }

  factory FoodDetails.fromJson(Map<String, dynamic> json) {
    return FoodDetails(
        Food.fromJson(json['food']),
        Map<String, int>.from(json['selectedAddons']),
        json['finalPrice'],
        json['quantity'],
        json['discount']);
  }
  factory FoodDetails.fromBackendJson(Map<String, dynamic> json) {
    return FoodDetails(
        Food(foodID: json['id'], name: json['name'], description: json['desc'], category: 'food', type: 'food', veg: true, available: true, finalPrice: json['listed_price'], price: json['listed_price']),
        Map<String, int>.from(json['option'] ?? {}),
        json['total'],
        json['quantity'],
        json['discount']);
  }
}


// class FoodDetailsResponse {
//   final Food food;
//   final Map<String, int> selectedAddons;
//   final int quantity;
//   final double finalPrice;
//   final double discount;

//   FoodDetailsResponse(this.food, this.selectedAddons, this.finalPrice, this.quantity,
//       this.discount);

//   Map<String, dynamic> toJson() {
//     return {
//       'food': food.toJson(),
//       'selectedAddons': selectedAddons,
//       'finalPrice': finalPrice,
//       'quantity': quantity,
//       'discount': discount
//     };
//   }

//   factory FoodDetailsResponse.fromJson(Map<String, dynamic> json) {
//     return FoodDetailsResponse(
//         Food(foodID: json['id'], name: json['name'], description: json['desc'], category: 'food', type: 'food', veg: true, available: true, finalPrice: json['listed_price'], price: json['listed_price']),
//         Map<String, int>.from(json['option']),
//         json['total'],
//         json['quantity'],
//         json['discount']);
//   }
// }

