import 'package:flutter_catelog/model/catelog.dart';

class CartModel {
  static final cartModel = CartModel.internal();
  CartModel.internal();
  factory CartModel() => cartModel;
  late CatelogItem _catelog;

  final List<int> _itemids = [];

  //Get Catelog
  CatelogItem get catelog => _catelog;
  //Set Catelog
  set catelog(CatelogItem newCatelog) {
    assert(newCatelog != null);
    _catelog = newCatelog;
  }

  //Get items in the cart

  List<Item> get items => _itemids.map((id) => _catelog.getById(id)).toList();

  //Get total price

  num get totalprice =>
      items.fold(0, (total, current) => total + current.price);

  //Add item

  void add(Item item) {
    _itemids.add(item.id);
  }

  //Remove item
  void remove(Item item) {
    _itemids.remove(item.id);
  }
}
