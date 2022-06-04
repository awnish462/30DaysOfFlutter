// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_catelog/model/catelog.dart';

class ItemWidget extends StatelessWidget {
  //const ItemWidget({Key? key}) : super(key: key);
  final Item item;

  // ignore: unnecessary_null_comparison
  const ItemWidget({super.key, required this.item}) : assert(item != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: ListTile(
          onTap: (() => print(item.name+ " pressed")),
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: Text(item.desc),
          trailing: Text(
            "\$${item.price}",
            textScaleFactor: 1.5,
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          ),
          
        ),
      ),
    );
  }
}
