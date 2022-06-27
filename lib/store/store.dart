// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_catelog/model/cart_model.dart';
import 'package:flutter_catelog/model/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatelogItem catelog;
  late CartModel cart;

  Mystore() {
    catelog = CatelogItem();
    cart = CartModel();
    cart.catelog = catelog;
  }
  // MyStore({
  //   required this.catelog,
  //   required this.cart,
  // });
}
