import 'package:flutter/material.dart';
import 'package:flutter_catelog/model/catelog.dart';
import 'package:flutter_catelog/pages/widgets/ItemWidget.dart';
import 'package:flutter_catelog/pages/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final int days = 30;
  final String name = "Awnish";

  @override
  Widget build(BuildContext context) {
    final dummylist = List.generate(3, (index) => CatelogItem.item[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Catelog App"),
      ),
      //listview builder gives recyclerview to render items
      body: ListView.builder(
        // itemCount: CatelogItem.item.length,
        itemCount: dummylist.length,
        //how to display item
        itemBuilder: (context, index) {
          return ItemWidget(
            // item: CatelogItem.item[index],
            item: dummylist[index],
          );
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
