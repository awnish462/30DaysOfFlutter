// ignore_for_file: public_member_api_docs, sort_constructors_first, empty_constructor_bodies
import 'dart:convert';

class CatelogItem {
  static List<Item> item=[
    Item(name: "", desc: "", price:0, color: "", id:0, image: "")
  ];

  //get item by Id

  Item getById(int id) =>
      item.firstWhere((element) => element.id == id.toString(), orElse: null);

  //Get Item by position
   Item getByPosition(int pos) => item[pos];

  // = [
  //   Item(
  //       name: "Iphone 13",
  //       desc: "World's best smartphone ",
  //       price: 999,
  //       color: "#f0928b",
  //       id: "abcde",
  //       image:
  //           "https://www.apple.com/v/iphone-13-pro/f/images/overview/design/finishes_1_gold__crqf8jzxwr6u_large_2x.jpg")
  // ];
}

class Item {
  final String name;
  final String desc;
  final num price;
  final String color;
  final int id;
  final String image;
  Item({
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.id,
    required this.image,
  });

  // Item(
  //    this.name,
  //   this.desc,
  //   this.price,
  //   this.color,
  //   this.id,
  //   this.image,
  // );

  //on the basis of logic we us factory

  Item copyWith({
    String? name,
    String? desc,
    num? price,
    String? color,
    int? id,
    String? image,
  }) {
    return Item(
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      id: id ?? this.id,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'id': id,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      name: map['name'] as String,
      desc: map['desc'] as String,
      price: map['price'] as num,
      color: map['color'] as String,
      id: map['id'] as int,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(name: $name, desc: $desc, price: $price, color: $color, id: $id, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.id == id &&
        other.image == image;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        id.hashCode ^
        image.hashCode;
  }
}
