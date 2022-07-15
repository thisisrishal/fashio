import 'package:hive_flutter/hive_flutter.dart';

part 'fav_model.g.dart';

@HiveType(typeId: 0)
class FavModel extends HiveObject {
  FavModel({
    required this.productId,
    required this.img,
    required this.title,
    required this.price,
    required this.offerPrice,
    required this.offerPercent,
  });

  @HiveField(0)
  late String productId;

  @HiveField(1)
  late String img;

  @HiveField(2)
  late String title;

  @HiveField(3)
  late int price;

  @HiveField(4)
  late double offerPrice;

  @HiveField(5)
  late double offerPercent;
}
