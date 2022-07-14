// To parse required this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(Map<String, dynamic> map) => CartModel.fromJson(map);

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    required this.data,
    required this.message,
  });

  Data data;
  String message;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    required this.cartdata,
  });

  List<Cartdatum> cartdata;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cartdata: List<Cartdatum>.from(
            json["CARTDATA"].map((x) => Cartdatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "CARTDATA": List<dynamic>.from(cartdata.map((x) => x.toJson())),
      };
}

class Cartdatum {
  Cartdatum({
    required this.id,
    required this.userId,
    required this.productId,
    required this.productname,
    required this.color,
    required this.size,
    required this.quantity,
    required this.totalPrice,
    required this.mrp,
    required this.productImage,
    required this.discount,
    required this.offerPrice,
    required this.offer,
    required this.createdAt,
    required this.v,
  });

  String id;
  String userId;
  String productId;
  String productname;
  String color;
  String size;
  int quantity;
  int totalPrice;
  int mrp;
  String productImage;
  int discount;
  int offerPrice;
  bool offer;
  DateTime createdAt;
  int v;

  factory Cartdatum.fromJson(Map<String, dynamic> json) => Cartdatum(
        id: json["_id"],
        userId: json["userID"],
        productId: json["productID"],
        productname: json["productname"],
        color: json["color"],
        size: json["size"],
        quantity: json["quantity"],
        totalPrice: json["totalPrice"],
        mrp: json["MRP"],
        productImage: json["productImage"],
        discount: json["discount"],
        offerPrice: json["offerPrice"],
        offer: json["offer"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userID": userId,
        "productID": productId,
        "productname": productname,
        "color": color,
        "size": size,
        "quantity": quantity,
        "totalPrice": totalPrice,
        "MRP": mrp,
        "productImage": productImage,
        "discount": discount,
        "offerPrice": offerPrice,
        "offer": offer,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
      };
}
