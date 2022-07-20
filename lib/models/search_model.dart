// To parse required this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    required this.data,
    required this.message,
  });

  Data data;
  String message;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
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

  List<SearchProduct> products;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        products: List<SearchProduct>.from(
            json["products"].map((x) => SearchProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class SearchProduct {
  SearchProduct({
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
    required this.discount,
    required this.offerPrice,
    required this.offer,
    required this.catoffer,
    required this.rating,
    required this.createdAt,
    required this.v,
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
  int discount;
  int offerPrice;
  bool offer;
  bool catoffer;
  List<dynamic> rating;
  DateTime createdAt;
  int v;

  factory SearchProduct.fromJson(Map<String, dynamic> json) => SearchProduct(
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
        discount: json["discount"],
        offerPrice: json["offerPrice"],
        offer: json["offer"],
        catoffer: json["catoffer"],
        rating: List<dynamic>.from(json["rating"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
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
        "discount": discount,
        "offerPrice": offerPrice,
        "offer": offer,
        "catoffer": catoffer,
        "rating": List<dynamic>.from(rating.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
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
