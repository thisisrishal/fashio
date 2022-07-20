// To parse required this JSON data, do
//
//     final recommendedModel = recommendedModelFromJson(jsonString);

import 'dart:convert';

RecommendedModel recommendedModelFromJson(String str) =>
    RecommendedModel.fromJson(json.decode(str));

String recommendedModelToJson(RecommendedModel data) =>
    json.encode(data.toJson());

class RecommendedModel {
  RecommendedModel({
    required this.data,
    required this.message,
  });

  Data data;
  String message;

  factory RecommendedModel.fromJson(Map<String, dynamic> json) =>
      RecommendedModel(
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

  List<Product> products;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
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
    required this.lengthofrating,
    required this.offerdescription,
    required this.offername,
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
  List<Rating> rating;
  DateTime createdAt;
  int v;
  int lengthofrating;
  String offerdescription;
  String offername;

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
        discount: json["discount"],
        offerPrice: json["offerPrice"],
        offer: json["offer"],
        catoffer: json["catoffer"],
        rating:
            List<Rating>.from(json["rating"].map((x) => Rating.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
        lengthofrating:
            json["lengthofrating"] == null ? null : json["lengthofrating"],
        offerdescription:
            json["offerdescription"] == null ? null : json["offerdescription"],
        offername: json["offername"] == null ? null : json["offername"],
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
        "rating": List<dynamic>.from(rating.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
        "lengthofrating": lengthofrating == null ? null : lengthofrating,
        "offerdescription": offerdescription == null ? null : offerdescription,
        "offername": offername == null ? null : offername,
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
