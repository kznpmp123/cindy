class ItemModel {
  final String? id;
  final String photo;
  final String photo2;
  final String photo3;
  final String desc;
  final String name;
  final String brand;
  final String deliverytime;
  final int price;
  final int discountprice;
  final String color;
  final String size;
  final int star;
  final String category;
  // final DateTime? created;

  ItemModel({
    this.id,
    required this.photo,
    required this.photo2,
    required this.photo3,
    required this.name,
    required this.brand,
    required this.deliverytime,
    required this.price,
    required this.discountprice,
    required this.desc,
    required this.color,
    required this.size,
    required this.star,
    required this.category,
    // this.created,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json, id) => ItemModel(
        id: id,
        photo: json['photo'] as String,
        photo2: json['photo2'] as String,
        photo3: json['photo3'] as String,
        name: json['name'] as String,
        brand: json['brand'] as String,
        deliverytime: json['deliverytime'] as String,
        desc: json['desc'] as String,
        price: json['price'] as int,
        discountprice: json['discountprice'] as int,
        color: json['color'] as String,
        size: json['size'] as String,
        star: json['star'] as int,
        category: json['category'] as String,
      );

  Map<String, dynamic> toJson() => {
        'photo': photo,
        'photo2': photo2,
        'photo3': photo3,
        'name': name,
        'brand': brand,
        'deliverytime': deliverytime,
        'price': price,
        'discountprice': discountprice,
        'color': color,
        'size': size,
        'star': star,
        'category': category,
        'desc': desc,
      };

  ItemModel copyWith({
    String? newPhoto,
    String? newPhoto2,
    String? newPhoto3,
    String? newBrand,
    String? newDeliveryTime,
    String? newName,
    String? des,
    int? newPrice,
    int? newDiscountPrice,
    String? newColor,
    String? newSize,
    int? newStar,
    String? newCategory,
  }) =>
      ItemModel(
        id: id,
        photo: newPhoto ?? photo,
        photo2: newPhoto2 ?? photo2,
        photo3: newPhoto3 ?? photo3,
        brand: newBrand ?? brand,
        deliverytime: newDeliveryTime ?? deliverytime,
        name: newName ?? name,
        price: newPrice ?? price,
        discountprice: newDiscountPrice ?? discountprice,
        desc: des ?? desc,
        color: newColor ?? color,
        size: newSize ?? size,
        star: newStar ?? star,
        category: newCategory ?? category,
      );
}

class PurchaseItem {
  final String id;
  final int count;
  final String size;
  final String color;
  final int price;

  PurchaseItem(this.id, this.count, this.size, this.color, this.price);
}
