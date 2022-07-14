// To parse required this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(Map<String,dynamic> map) =>
    BannerModel.fromJson(map);

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  BannerModel({
    required this.data,
    required this.message,
  });

  Data data;
  String message;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
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
    required this.bannerData,
  });

  List<BannerDatum> bannerData;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        bannerData: List<BannerDatum>.from(
            json["BannerData"].map((x) => BannerDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "BannerData": List<dynamic>.from(bannerData.map((x) => x.toJson())),
      };
}

class BannerDatum {
  BannerDatum({
    required this.id,
    required this.bannername,
    required this.content,
    required this.imgOne,
    required this.createdAt,
    required this.v,
  });

  String id;
  String bannername;
  String content;
  List<ImgOne> imgOne;
  DateTime createdAt;
  int v;

  factory BannerDatum.fromJson(Map<String, dynamic> json) => BannerDatum(
        id: json["_id"],
        bannername: json["bannername"],
        content: json["content"],
        imgOne:
            List<ImgOne>.from(json["imgOne"].map((x) => ImgOne.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "bannername": bannername,
        "content": content,
        "imgOne": List<dynamic>.from(imgOne.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
      };
}

class ImgOne {
  ImgOne({
    required this.url,
    required this.id,
  });

  String url;
  String id;

  factory ImgOne.fromJson(Map<String, dynamic> json) => ImgOne(
        url: json["url"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "id": id,
      };
}
