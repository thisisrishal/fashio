// To parse required this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(Map<String,dynamic> map) =>
    CategoryModel.fromJson(map);

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    required this.data,
    required this.message,
  });

  Data data;
  String message;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
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
    required this.allCategoryData,
  });

  List<AllCategoryDatum> allCategoryData;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        allCategoryData: List<AllCategoryDatum>.from(
            json["AllCategoryData"].map((x) => AllCategoryDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "AllCategoryData":
            List<dynamic>.from(allCategoryData.map((x) => x.toJson())),
      };
}

class AllCategoryDatum {
  AllCategoryDatum({
    required this.id,
    required this.subcategoryname,
    required this.subCategoryImage,
    required this.parentCatId,
    required this.offerstatus,
    required this.discount,
    required this.createdAt,
    required this.v,
  });

  String id;
  String subcategoryname;
  List<SubCategoryImage> subCategoryImage;
  String parentCatId;
  bool offerstatus;
  int discount;
  DateTime createdAt;
  int v;

  factory AllCategoryDatum.fromJson(Map<String, dynamic> json) =>
      AllCategoryDatum(
        id: json["_id"],
        subcategoryname: json["subcategoryname"] ?? json["categoryname"],
        subCategoryImage: json["subCategoryImage"] != null ?  List<SubCategoryImage>.from(
            json["subCategoryImage"].map((x) => SubCategoryImage.fromJson(x))) : List<SubCategoryImage>.from(json["CategoryImage"]
                .map((x) => SubCategoryImage.fromJson(x))) ,
        parentCatId: json["parentCatId"] ?? "This is Main",
        offerstatus: json["offerstatus"] ?? true,
        discount: json["discount"] ?? 0,
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "subcategoryname": subcategoryname,
        "subCategoryImage":
            List<dynamic>.from(subCategoryImage.map((x) => x.toJson())),
        "parentCatId": parentCatId,
        "offerstatus": offerstatus,
        "discount": discount,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
      };
}

class SubCategoryImage {
  SubCategoryImage({
    required this.url,
    required this.id,
  });

  String url;
  String id;

  factory SubCategoryImage.fromJson(Map<String, dynamic> json) =>
      SubCategoryImage(
        url: json["url"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "id": id,
      };
}
