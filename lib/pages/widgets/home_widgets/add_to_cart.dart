import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catelog/model/cart_model.dart';
import 'package:flutter_catelog/model/catelog.dart';
import 'package:flutter_catelog/pages/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class Addtocart extends StatelessWidget {
 
  const Addtocart({
    Key? key,
    required this.catelog,
  }) : super(key: key);

  @override

   final Item catelog;
  @override
  Widget build(BuildContext context) {
    
    final _cart = CartModel();
    bool isInCart = _cart.items.contains(catelog)?? false;
    return ElevatedButton(
      onPressed: () {
        
        if (!isInCart) {

          isInCart = isInCart.toggle();
          final _catelog = CatelogItem();

          _cart.catelog = _catelog;
          _cart.add(catelog);
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
