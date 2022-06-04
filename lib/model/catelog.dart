class CatelogItem {
  static final item = [
    Item(name: "Iphone 13", desc: "World's best smartphone ", price: 999, color: "#f0928b",id: "abcde",image: "https://www.apple.com/v/iphone-13-pro/f/images/overview/design/finishes_1_gold__crqf8jzxwr6u_large_2x.jpg")
  ];
}

class Item {
  final String name;
  final String desc;
  final num price;
  final String color;
  final String id;
  final String image;

  Item({required this.name, required this.desc,required this.price,required this.color,required this.id,required this.image});

 
}
