// To parse required this JSON data, do
//
//     final allProductsModel = allProductsModelFromJson(jsonString);

import 'dart:convert';

AllProductsModel allProductsModelFromJson(Map<String,dynamic> map) =>
    AllProductsModel.fromJson(map);

String allProductsModelToJson(AllProductsModel data) =>
    json.encode(data.toJson());

class AllProductsModel {
  AllProductsModel({
    required this.data,
    required this.message,
  });

  Data data;
  String message;

  factory AllProductsModel.fromJson(Map<String, dynamic> json) =>
      AllProductsModel(
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
    required this.products,
  });

  List<AllProducts> products;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        products: List<AllProducts>.from(
            json["products"].map((x) => AllProducts.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class AllProducts {
  AllProducts({
    required this.id,
    required this.productname,
    required this.price,
    required this.description,
    required this.maincategoryname,
    required this.subcategoryname,
    required this.stock,
    required this.color,
    required this.size,
    required this.imgOne,
    required this.imgTwo,
    required this.imgThree,
    required this.imgFour,
    required this.imgFive,
    required this.offer,
    required this.catoffer,
    this.rating,
    required this.createdAt,
    required this.v,
    required this.offerPrice,
    required this.discount,
     this.lengthofrating,
  });

  String id;
  String productname;
  int price;
  String description;
  String maincategoryname;
  String subcategoryname;
  int stock;
  List<Color> color;
  List<Size> size;
  List<Img> imgOne;
  List<Img> imgTwo;
  List<Img> imgThree;
  List<Img> imgFour;
  List<Img> imgFive;
  bool offer;
  bool catoffer;
  List<Rating>? rating;
  DateTime createdAt;
  int v;
  int offerPrice;
  int discount;
  int? lengthofrating;

  factory AllProducts.fromJson(Map<String, dynamic> json) => AllProducts(
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
        rating:json["rating"] == null ? []:
            List<Rating>.from(json["rating"].map((x) => Rating.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
        offerPrice: json["offerPrice"],
        discount: json["discount"],
        lengthofrating: json["lengthofrating"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "productname": productname,
        "price": price,
        "description": description,
        "maincategoryname": maincategoryname,
        "subcategoryname": subcategoryname,
        "stock": stock,
        "color": List<dynamic>.from(color.map((x) => x.toJson())),
        "size": List<dynamic>.from(size.map((x) => x.toJson())),
        "imgOne": List<dynamic>.from(imgOne.map((x) => x.toJson())),
        "imgTwo": List<dynamic>.from(imgTwo.map((x) => x.toJson())),
        "imgThree": List<dynamic>.from(imgThree.map((x) => x.toJson())),
        "imgFour": List<dynamic>.from(imgFour.map((x) => x.toJson())),
        "imgFive": List<dynamic>.from(imgFive.map((x) => x.toJson())),
        "offer": offer,
        "catoffer": catoffer,
        "rating": rating == null
            ? []
            : List<dynamic>.from(rating!.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
        "offerPrice": offerPrice,
        "discount": discount,
        "lengthofrating": lengthofrating ?? 0,
      };
}

class Color {
  Color({
    required this.color,
    required this.quntity,
  });

  String color;
  int quntity;

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
    required this.url,
    required this.id,
  });

  String url;
  String id;

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
    required this.userId,
    required this.rateValue,
    required this.review,
    required this.userName,
    required this.profilephoto,
  });

  String userId;
  String rateValue;
  String review;
  String userName;
  String profilephoto;

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
    required this.size,
    required this.quntity,
  });

  String size;
  int quntity;

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        size: json["size"],
        quntity: json["quntity"],
      );

  Map<String, dynamic> toJson() => {
        "size": size,
        "quntity": quntity,
      };
}
