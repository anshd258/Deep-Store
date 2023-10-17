
class FoodDetails {
  final int foodDetailId;
  final String itemName;
  final String desc;
  final int providerId;
  final String providerName;
  final Map<String, int> selectedAddons;
  final double listedPrice;
  final double total;
  final double discount;
  final int quantity;
  final int orderId;
  final int itemId;




  factory FoodDetails.fromJson(Map<String, dynamic> json) {
    return FoodDetails(
          foodDetailId: json['id'],
      itemName: json['name'],
      desc: json['desc'],
      providerId: json['provider_id'],
      providerName: json['provider_name'],
      selectedAddons:Map<String, int>.from(json['option'] ?? {}),
      listedPrice: json['listed_price'] as double,
      total: json['total'] as double,
      discount: json['discount'] as double,
      quantity: json['quantity'],
      orderId: json['order'],
      itemId: json['item'],
        
        );
  }

  FoodDetails({required this.foodDetailId, required this.itemName, required this.desc, required this.providerId, required this.providerName, required this.selectedAddons, required this.listedPrice, required this.total, required this.discount, required this.quantity, required this.orderId, required this.itemId});
}
// import 'food.dart';

// class FoodDetails {
//   final Food? food;
//   final Map<String, int> selectedAddons;
//   final int quantity;
//   final double finalPrice;
//   final double discount;

//   FoodDetails(this.food, this.selectedAddons, this.finalPrice, this.quantity,
//       this.discount);

//   factory FoodDetails.fromJson(Map<String, dynamic> json) {
//     return FoodDetails(
//         Food(
//             foodID: json['item'],
//             name: json['name'],
//             description: json['desc'],
//             category: 'food',
//             type: 'food',
//             veg: true,
//             available: true,
//             finalPrice: json['total'],
//             price: json['listed_price']),
//         Map<String, int>.from(json['option'] ?? {}),
//         json['total'],
//         json['quantity'],
//         json['discount']);
//   }
// }
