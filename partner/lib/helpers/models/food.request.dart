import 'dart:io';

class FoodRequest {
  List<Orders>? orders;

  FoodRequest({this.orders});

  FoodRequest.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int? id;
  User? user;

  List<Items>? items;
  String? discount;
  String? subtotal;
  String? taxes;
  String? charges;

  String? total;
  int? status;
  String? created;
  String? updated;

  Orders({
    this.id,
    this.user,
    this.items,
    this.discount,
    this.subtotal,
    this.taxes,
    this.charges,
    this.total,
    this.status,
    this.created,
    this.updated,
  });

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;

    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    discount = json['discount'].toString();
    subtotal = json['subtotal'].toString();
    taxes = json['taxes'].toString();
    charges = json['charges'].toString();

    total = json['total'].toString();
    status = json['status'];
    created = json['created'].toString();
    updated = json['updated'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }

    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['discount'] = discount;
    data['subtotal'] = subtotal;
    data['taxes'] = taxes;
    data['charges'] = charges;
    data['total'] = total;
    data['status'] = status;
    data['created'] = created;
    data['updated'] = updated;

    return data;
  }
}

class User {
  int? id;
  File? img;
  String? contact;
  String? otp;
  String? username;
  String? room;

  User({this.id, this.contact, this.otp, this.username, this.room, this.img});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    contact = json['contact'].toString();
    otp = json['otp'].toString();
    username = json['username'].toString();
    room = json['room'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;

    data['contact'] = contact;
    data['otp'] = otp;
    data['username'] = username;
    data['room'] = room;
    return data;
  }
}

class Items {
  int? id;
  String? name;
  String? desc;
  String? providerId;
  String? providerName;
  String? option;
  String? listedPrice;
  String? total;
  String? discount;
  String? rating;
  String? quantity;
  String? order;

  Items({
    this.id,
    this.name,
    this.desc,
    this.providerId,
    this.providerName,
    this.option,
    this.listedPrice,
    this.total,
    this.discount,
    this.rating,
    this.quantity,
    this.order,
  });

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'].toString();
    desc = json['desc'].toString();
    providerId = json['provider_id'].toString();
    providerName = json['provider_name'].toString();
    option = json['option'].toString();
    listedPrice = json['listed_price'].toString();
    total = json['total'].toString();
    discount = json['discount'].toString();
    rating = json['rating'].toString();
    quantity = json['quantity'].toString();
    order = json['order'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['desc'] = desc;
    data['provider_id'] = providerId;
    data['provider_name'] = providerName;
    data['option'] = option;
    data['listed_price'] = listedPrice;
    data['total'] = total;
    data['discount'] = discount;
    data['rating'] = rating;
    data['quantity'] = quantity;
    data['order'] = order;
    return data;
  }
}
