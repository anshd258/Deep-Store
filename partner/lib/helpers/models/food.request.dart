class FoodRequest {
  List<Orders>? orders;

  FoodRequest({this.orders});

  FoodRequest.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
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
    user = json['user'] != null ? new User.fromJson(json['user']) : null;

    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }

    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['discount'] = this.discount;
    data['subtotal'] = this.subtotal;
    data['taxes'] = this.taxes;
    data['charges'] = this.charges;

    data['total'] = this.total;
    data['status'] = this.status;
    data['created'] = this.created;
    data['updated'] = this.updated;

    return data;
  }
}

class User {
  int? id;

  String? contact;
  String? otp;
  String? username;
  String? room;

  User({this.id, this.contact, this.otp, this.username, this.room});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    contact = json['contact'].toString();
    otp = json['otp'].toString();
    username = json['username'].toString();
    room = json['room'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['contact'] = this.contact;
    data['otp'] = this.otp;
    data['username'] = this.username;
    data['room'] = this.room;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['provider_id'] = this.providerId;
    data['provider_name'] = this.providerName;
    data['option'] = this.option;
    data['listed_price'] = this.listedPrice;
    data['total'] = this.total;
    data['discount'] = this.discount;
    data['rating'] = this.rating;
    data['quantity'] = this.quantity;
    data['order'] = this.order;

    return data;
  }
}
