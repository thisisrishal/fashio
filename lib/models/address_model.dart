// To parse required this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

AddressModel addressModelFromJson(String str) =>
    AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
  AddressModel({
    required this.data,
    required this.message,
  });

  Data data;
  String message;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
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
    required this.userAddressData,
  });

  List<UserAddressDatum> userAddressData;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userAddressData: List<UserAddressDatum>.from(
            json["UserAddressData"].map((x) => UserAddressDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "UserAddressData":
            List<dynamic>.from(userAddressData.map((x) => x.toJson())),
      };
}

class UserAddressDatum {
  UserAddressDatum({
    required this.id,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.address1,
    required this.address2,
    required this.mobileNumber,
    required this.city,
    required this.state,
    required this.pincode,
    required this.createdAt,
    required this.v,
  });

  String id;
  String userId;
  String firstName;
  String lastName;
  String address1;
  String address2;
  int mobileNumber;
  String city;
  String state;
  int pincode;
  DateTime createdAt;
  int v;

  factory UserAddressDatum.fromJson(Map<String, dynamic> json) =>
      UserAddressDatum(
        id: json["_id"],
        userId: json["userId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        address1: json["address1"],
        address2: json["address2"],
        mobileNumber: json["mobileNumber"],
        city: json["city"],
        state: json["state"],
        pincode: json["pincode"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "firstName": firstName,
        "lastName": lastName,
        "address1": address1,
        "address2": address2,
        "mobileNumber": mobileNumber,
        "city": city,
        "state": state,
        "pincode": pincode,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
      };
}
