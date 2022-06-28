import 'package:flutter_catelog/model/catelog.dart';
import 'package:flutter_catelog/store/store.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late CatelogItem _catelog;

  final List<int> _itemids = [];

  //Get Catelog
  CatelogItem get catelog => _catelog;
  //Set Catelog
  set catelog(CatelogItem newCatelog) {
    // assert(newCatelog != null);
    _catelog = newCatelog;
  }

  //Get items in the cart

  List<Item> get items => _itemids.map((id) => _catelog.getById(id)).toList();

  //Get total price

  num get totalprice =>
      items.fold(0, (total, current) => total + current.price);

  // //Add item

  // void add(Item item) {
  //   _itemids.add(item.id);
  // }

  //Remove item
  void remove(Item item) {
    _itemids.remove(item.id);
  }

  toMap() {}

  // static CartModel fromMap(Map<String, dynamic> map) {}
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemids.add(item.id);
  }
}
