class FlashSaleModel {
  List<Products>? products;

  FlashSaleModel({this.products});

  FlashSaleModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? sId;
  String? productname;
  int? price;
  String? description;
  String? maincategoryname;
  String? subcategoryname;
  int? stock;
  List<Color>? color;
  List<Size>? size;
  List<ImgOne>? imgOne;
  List<ImgTwo>? imgTwo;
  List<ImgThree>? imgThree;
  List<ImgFour>? imgFour;
  List<ImgFive>? imgFive;
  bool? offer;
  bool? catoffer;
  List<Rating>? rating;
  String? createdAt;
  int? iV;
  int? offerPrice;
  int? discount;
  int? lengthofrating;

  Products(
      {this.sId,
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
      this.iV,
      this.offerPrice,
      this.discount,
      this.lengthofrating});

  Products.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productname = json['productname'];
    price = json['price'];
    description = json['description'];
    maincategoryname = json['maincategoryname'];
    subcategoryname = json['subcategoryname'];
    stock = json['stock'];
    if (json['color'] != null) {
      color = <Color>[];
      json['color'].forEach((v) {
        color!.add(Color.fromJson(v));
      });
    }
    if (json['size'] != null) {
      size = <Size>[];
      json['size'].forEach((v) {
        size!.add(Size.fromJson(v));
      });
    }
    if (json['imgOne'] != null) {
      imgOne = <ImgOne>[];
      json['imgOne'].forEach((v) {
        imgOne!.add(ImgOne.fromJson(v));
      });
    }
    if (json['imgTwo'] != null) {
      imgTwo = <ImgTwo>[];
      json['imgTwo'].forEach((v) {
        imgTwo!.add(ImgTwo.fromJson(v));
      });
    }
    if (json['imgThree'] != null) {
      imgThree = <ImgThree>[];
      json['imgThree'].forEach((v) {
        imgThree!.add(ImgThree.fromJson(v));
      });
    }
    if (json['imgFour'] != null) {
      imgFour = <ImgFour>[];
      json['imgFour'].forEach((v) {
        imgFour!.add(ImgFour.fromJson(v));
      });
    }
    if (json['imgFive'] != null) {
      imgFive = <ImgFive>[];
      json['imgFive'].forEach((v) {
        imgFive!.add(ImgFive.fromJson(v));
      });
    }
    offer = json['offer'];
    catoffer = json['catoffer'];
    if (json['rating'] != null) {
      rating = <Rating>[];
      json['rating'].forEach((v) {
        rating!.add(Rating.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    iV = json['__v'];
    offerPrice = json['offerPrice'];
    discount = json['discount'];
    lengthofrating = json['lengthofrating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['productname'] = productname;
    data['price'] = price;
    data['description'] = description;
    data['maincategoryname'] = maincategoryname;
    data['subcategoryname'] = subcategoryname;
    data['stock'] = stock;
    if (color != null) {
      data['color'] = color!.map((v) => v.toJson()).toList();
    }
    if (size != null) {
      data['size'] = size!.map((v) => v.toJson()).toList();
    }
    if (imgOne != null) {
      data['imgOne'] = imgOne!.map((v) => v.toJson()).toList();
    }
    if (imgTwo != null) {
      data['imgTwo'] = imgTwo!.map((v) => v.toJson()).toList();
    }
    if (imgThree != null) {
      data['imgThree'] = imgThree!.map((v) => v.toJson()).toList();
    }
    if (imgFour != null) {
      data['imgFour'] = imgFour!.map((v) => v.toJson()).toList();
    }
    if (imgFive != null) {
      data['imgFive'] = imgFive!.map((v) => v.toJson()).toList();
    }
    data['offer'] = offer;
    data['catoffer'] = catoffer;
    if (rating != null) {
      data['rating'] = rating!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    data['__v'] = iV;
    data['offerPrice'] = offerPrice;
    data['discount'] = discount;
    data['lengthofrating'] = lengthofrating;
    return data;
  }
}

class Color {
  String? color;
  int? quntity;

  Color({this.color, this.quntity});

  Color.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    quntity = json['quntity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['color'] = color;
    data['quntity'] = quntity;
    return data;
  }
}

class Size {
  String? size;
  int? quntity;

  Size({this.size, this.quntity});

  Size.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    quntity = json['quntity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['size'] = size;
    data['quntity'] = quntity;
    return data;
  }
}

class ImgOne {
  String? url;
  String? id;

  ImgOne({this.url, this.id});

  ImgOne.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['id'] = id;
    return data;
  }
}

class ImgTwo {
  String? url;
  String? id;

  ImgTwo({this.url, this.id});

  ImgTwo.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['url'] = url;
    data['id'] = id;
    return data;
  }
}

class ImgThree {
  String? url;
  String? id;

  ImgThree({this.url, this.id});

  ImgThree.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['id'] = id;
    return data;
  }
}

class ImgFour {
  String? url;
  String? id;

  ImgFour({this.url, this.id});

  ImgFour.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['url'] = url;
    data['id'] = id;
    return data;
  }
}

class ImgFive {
  String? url;
  String? id;

  ImgFive({this.url, this.id});

  ImgFive.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['id'] = id;
    return data;
  }
}

class Rating {
  String? userID;
  String? rateValue;
  String? review;
  String? userName;
  String? profilephoto;

  Rating(
      {this.userID,
      this.rateValue,
      this.review,
      this.userName,
      this.profilephoto});

  Rating.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    rateValue = json['rateValue'];
    review = json['review'];
    userName = json['userName'];
    profilephoto = json['profilephoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userID;
    data['rateValue'] = rateValue;
    data['review'] = review;
    data['userName'] = userName;
    data['profilephoto'] = profilephoto;
    return data;
  }
}
