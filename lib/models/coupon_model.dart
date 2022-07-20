// To parse required this JSON data, do
//
//     final couponModel = couponModelFromJson(jsonString);

import 'dart:convert';

CouponModel couponModelFromJson(String str) =>
    CouponModel.fromJson(json.decode(str));

String couponModelToJson(CouponModel data) => json.encode(data.toJson());

class CouponModel {
  CouponModel({
    required this.data,
    required this.message,
  });

  Data data;
  String message;

  factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
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
    required this.couponData,
  });

  List<CouponDatum> couponData;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        couponData: List<CouponDatum>.from(
            json["CouponData"].map((x) => CouponDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "CouponData": List<dynamic>.from(couponData.map((x) => x.toJson())),
      };
}

class CouponDatum {
  CouponDatum({
    required this.id,
    required this.couponName,
    required this.userId,
    required this.code,
    required this.discount,
    required this.maxAmount,
    required this.minPurchase,
    required this.expireAt,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String couponName;
  List<dynamic> userId;
  String code;
  int discount;
  int maxAmount;
  int minPurchase;
  DateTime expireAt;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory CouponDatum.fromJson(Map<String, dynamic> json) => CouponDatum(
        id: json["_id"],
        couponName: json["couponName"],
        userId: List<dynamic>.from(json["userId"].map((x) => x)),
        code: json["code"],
        discount: json["discount"],
        maxAmount: json["maxAmount"],
        minPurchase: json["minPurchase"],
        expireAt: DateTime.parse(json["expireAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "couponName": couponName,
        "userId": List<dynamic>.from(userId.map((x) => x)),
        "code": code,
        "discount": discount,
        "maxAmount": maxAmount,
        "minPurchase": minPurchase,
        "expireAt": expireAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
