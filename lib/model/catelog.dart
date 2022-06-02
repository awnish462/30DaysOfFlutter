class Item {
  final String? name;
  final String? desc;
  final num? price;
  final String? color;
  final String? id;
  final String? image;

  Item({this.name, this.desc, this.price, this.color, this.id, this.image});

  final product = [
    Item(name: "Watch", desc: "Branded watch", price: 2000, color: "#f0928b",id: "abcde",image: "https://images.unsplash.com/photo-1648737966636-2fc3a5fffc8a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80")
  ];
}
