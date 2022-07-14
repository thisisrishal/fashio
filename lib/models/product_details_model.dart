// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) =>
    ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) =>
    json.encode(data.toJson());

class ProductDetailsModel {
  ProductDetailsModel({
    this.product,
  });

  Product? product;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "product": product!.toJson(),
      };
}

class Product {
  Product({
    this.id,
    this.productname,
    this.price,
    this.description,
    this.maincategoryname,
    this.subcategoryname,
    this.stock,
    this.color,
    this.size,
    this.imgOne,
    this.imgTwo,
    this.imgThree,
    this.imgFour,
    this.imgFive,
    this.offer,
    this.catoffer,
    this.rating,
    this.createdAt,
    this.v,
    this.offerPrice,
    this.discount,
    this.lengthofrating,
  });

  String? id;
  String? productname;
  int? price;
  String? description;
  String? maincategoryname;
  String? subcategoryname;
  int? stock;
  List<Color>? color;
  List<Size>? size;
  List<Img>? imgOne;
  List<Img>? imgTwo;
  List<Img>? imgThree;
  List<Img>? imgFour;
  List<Img>? imgFive;
  bool? offer;
  bool? catoffer;
  List<Rating>? rating;
  DateTime? createdAt;
  int? v;
  int? offerPrice;
  int? discount;
  int? lengthofrating;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        productname: json["productname"],
        price: json["price"],
        description: json["description"],
        maincategoryname: json["maincategoryname"],
        subcategoryname: json["subcategoryname"],
        stock: json["stock"],
        color: List<Color>.from(json["color"].map((x) => Color.fromJson(x))),
        size: List<Size>.from(json["size"].map((x) => Size.fromJson(x))),
        imgOne: List<Img>.from(json["imgOne"].map((x) => Img.fromJson(x))),
        imgTwo: List<Img>.from(json["imgTwo"].map((x) => Img.fromJson(x))),
        imgThree: List<Img>.from(json["imgThree"].map((x) => Img.fromJson(x))),
        imgFour: List<Img>.from(json["imgFour"].map((x) => Img.fromJson(x))),
        imgFive: List<Img>.from(json["imgFive"].map((x) => Img.fromJson(x))),
        offer: json["offer"],
        catoffer: json["catoffer"],
        rating:
            List<Rating>.from(json["rating"].map((x) => Rating.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
        offerPrice: json["offerPrice"],
        discount: json["discount"],
        lengthofrating: json["lengthofrating"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "productname": productname,
        "price": price,
        "description": description,
        "maincategoryname": maincategoryname,
        "subcategoryname": subcategoryname,
        "stock": stock,
        "color": List<dynamic>.from(color!.map((x) => x.toJson())),
        "size": List<dynamic>.from(size!.map((x) => x.toJson())),
        "imgOne": List<dynamic>.from(imgOne!.map((x) => x.toJson())),
        "imgTwo": List<dynamic>.from(imgTwo!.map((x) => x.toJson())),
        "imgThree": List<dynamic>.from(imgThree!.map((x) => x.toJson())),
        "imgFour": List<dynamic>.from(imgFour!.map((x) => x.toJson())),
        "imgFive": List<dynamic>.from(imgFive!.map((x) => x.toJson())),
        "offer": offer,
        "catoffer": catoffer,
        "rating": List<dynamic>.from(rating!.map((x) => x.toJson())),
        "createdAt": createdAt!.toIso8601String(),
        "__v": v,
        "offerPrice": offerPrice,
        "discount": discount,
        "lengthofrating": lengthofrating,
      };
}

class Color {
  Color({
    this.color,
    this.quntity,
  });

  String? color;
  int? quntity;

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        color: json["color"],
        quntity: json["quntity"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "quntity": quntity,
      };
}

class Img {
  Img({
    this.url,
    this.id,
  });

  String? url;
  String? id;

  factory Img.fromJson(Map<String, dynamic> json) => Img(
        url: json["url"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "id": id,
      };
}

class Rating {
  Rating({
    this.userId,
    this.rateValue,
    this.review,
    this.userName,
    this.profilephoto,
  });

  String? userId;
  String? rateValue;
  String? review;
  String? userName;
  String? profilephoto;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        userId: json["userID"],
        rateValue: json["rateValue"],
        review: json["review"],
        userName: json["userName"],
        profilephoto: json["profilephoto"],
      );

  Map<String, dynamic> toJson() => {
        "userID": userId,
        "rateValue": rateValue,
        "review": review,
        "userName": userName,
        "profilephoto": profilephoto,
      };
}

class Size {
  Size({
    this.size,
    this.quntity,
  });

  String? size;
  int? quntity;

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        size: json["size"],
        quntity: json["quntity"],
      );

  Map<String, dynamic> toJson() => {
        "size": size,
        "quntity": quntity,
      };
}
