import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catelog/model/cart_model.dart';
import 'package:flutter_catelog/model/catelog.dart';
import 'package:flutter_catelog/pages/widgets/themes.dart';
import 'package:flutter_catelog/store/store.dart';
import 'package:velocity_x/velocity_x.dart';

class Addtocart extends StatelessWidget {
  Addtocart({
    Key? key,
    required this.catelog,
  }) : super(key: key);

  @override
  final Item catelog;
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    // final CatelogItem _catelog = (VxState.store as MyStore).catelog;

    bool isInCart = _cart.items.contains(catelog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          // isInCart = isInCart.toggle();
    // final _catelog = CatelogItem();

          // _cart.catelog = _catelog;
          AddMutation(catelog);
          // setState(() {});
        }
      },
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyTheme.lightBluishColor),
          shape: MaterialStateProperty.all(StadiumBorder())),
    );
  }
}
