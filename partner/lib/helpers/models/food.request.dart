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
  double? discount;
  double? subtotal;
  double? taxes;
  double? charges;
  
  double? total;
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
    discount = json['discount'];
    subtotal = json['subtotal'];
    taxes = json['taxes'];
    charges = json['charges'];
    
    total = json['total'];
    status = json['status'];
    created = json['created'];
    updated = json['updated'];
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

    contact = json['contact'];
    otp = json['otp'];
    username = json['username'];
    room = json['room'];
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
  int? providerId;
  String? providerName;
  Null? option;
  double? listedPrice;
  double? total;
  double? discount;
  double? rating;
  int? quantity;
  int? order;


  Items(
      {this.id,
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
    name = json['name'];
    desc = json['desc'];
    providerId = json['provider_id'];
    providerName = json['provider_name'];
    option = json['option'];
    listedPrice = json['listed_price'];
    total = json['total'];
    discount = json['discount'];
    rating = json['rating'];
    quantity = json['quantity'];
    order = json['order'];
  
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
