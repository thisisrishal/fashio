// // To parse required this JSON data, do
// //
// //     final categoryModel = categoryModelFromJson(jsonString);

// import 'dart:convert';

// CategoryModel categoryModelFromJson(String str) =>
//     CategoryModel.fromJson(json.decode(str));

// String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

// class CategoryModel {
//   CategoryModel({
//     required this.data,
//     required this.message,
//   });

//   Data data;
//   String message;

//   factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
//         data: Data.fromJson(json["data"]),
//         message: json["message"],
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data.toJson(),
//         "message": message,
//       };
// }

// class Data {
//   Data({
//     required this.allCategoryData,
//   });

//   List<AllCategoryDatum> allCategoryData;

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         allCategoryData: List<AllCategoryDatum>.from(
//             json["AllCategoryData"].map((x) => AllCategoryDatum.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "AllCategoryData":
//             List<dynamic>.from(allCategoryData.map((x) => x.toJson())),
//       };
// }

// class AllCategoryDatum {
//   AllCategoryDatum({
//     required this.id,
//     required this.categoryname,
//     required this.categoryImage,
//     required this.statusSub,
//     required this.v,
//     required this.createdAt,
//     required this.subcategoryname,
//     required this.subCategoryImage,
//     required this.parentCatId,
//     required this.offerstatus,
//     required this.discount,
//   });

//   String id;
//   String categoryname;
//   List<CategoryImage> categoryImage;
//   String statusSub;
//   int v;
//   DateTime createdAt;
//   String subcategoryname;
//   List<CategoryImage> subCategoryImage;
//   String parentCatId;
//   bool offerstatus;
//   int discount;

//   factory AllCategoryDatum.fromJson(Map<String, dynamic> json) =>
//       AllCategoryDatum(
//         id: json["_id"],
//         categoryname:
//             json["categoryname"] == null ? null : json["categoryname"],
//         categoryImage: json["CategoryImage"] == null
//             ? null
//             : List<CategoryImage>.from(
//                 json["CategoryImage"].map((x) => CategoryImage.fromJson(x))),
//         statusSub: json["statusSub"] == null ? null : json["statusSub"],
//         v: json["__v"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         subcategoryname:
//             json["subcategoryname"] == null ? null : json["subcategoryname"],
//         subCategoryImage: json["subCategoryImage"] == null
//             ? null
//             : List<CategoryImage>.from(
//                 json["subCategoryImage"].map((x) => CategoryImage.fromJson(x))),
//         parentCatId: json["parentCatId"] == null ? null : json["parentCatId"],
//         offerstatus: json["offerstatus"] == null ? null : json["offerstatus"],
//         discount: json["discount"] == null ? null : json["discount"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "categoryname": categoryname == null ? null : categoryname,
//         "CategoryImage": categoryImage == null
//             ? null
//             : List<dynamic>.from(categoryImage.map((x) => x.toJson())),
//         "statusSub": statusSub == null ? null : statusSub,
//         "__v": v,
//         "createdAt": createdAt.toIso8601String(),
//         "subcategoryname": subcategoryname == null ? null : subcategoryname,
//         "subCategoryImage": subCategoryImage == null
//             ? null
//             : List<dynamic>.from(subCategoryImage.map((x) => x.toJson())),
//         "parentCatId": parentCatId == null ? null : parentCatId,
//         "offerstatus": offerstatus == null ? null : offerstatus,
//         "discount": discount == null ? null : discount,
//       };
// }

// class CategoryImage {
//   CategoryImage({
//     required this.url,
//     required this.id,
//   });

//   String url;
//   String id;

//   factory CategoryImage.fromJson(Map<String, dynamic> json) => CategoryImage(
//         url: json["url"],
//         id: json["id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "url": url,
//         "id": id,
//       };
// }
