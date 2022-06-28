import 'package:flutter/material.dart';
import 'package:flutter_catelog/model/cart_model.dart';
import 'package:flutter_catelog/pages/widgets/themes.dart';
import 'package:flutter_catelog/store/store.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.bold.make(),
      ),
      body: Column(
        children: [
          CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
        height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            "\$${_cart.totalprice}"
                .text
                .xl5
                .color(context.theme.errorColor)
                .make(),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: "Buying not supported yet".text.make()));
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(MyTheme.lightBluishColor)),
                child: "Buy".text.make())
          ],
        ));
  }
}

class CartList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart; 
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: ((context, index) => ListTile(
                  leading: Icon(Icons.done),
                  trailing: IconButton(
                      onPressed: () {
                        _cart.remove(_cart.items[index]);
                        // setState(() {
                          
                        // });
                      },
                      icon: Icon(Icons.remove_circle_outline)),
                  title: _cart.items[index].name.text.make(),
                )));
  }
}
