import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catelog/model/catelog.dart';
import 'package:flutter_catelog/pages/widgets/ItemWidget.dart';
import 'package:flutter_catelog/pages/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Awnish";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var itemjson = await rootBundle.loadString("assets/files/items.json");
    var decodeData = jsonDecode(itemjson);
    final productsdata = decodeData["products"];
    CatelogItem.item = List.from(productsdata)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catelog App"),
      ),
      //listview builder gives recyclerview to render items
      body: (CatelogItem.item!=null && CatelogItem.item!.isNotEmpty)? 
      ListView.builder(
        // itemCount: CatelogItem.item.length,
        itemCount: CatelogItem.item!.length,
        //how to display item
        itemBuilder: (context, index) {
          return ItemWidget(
            // item: CatelogItem.item[index],
            item: CatelogItem.item![index],
          );
        },
      ):const Center(
        child: CircularProgressIndicator(),
      ),
      drawer: MyDrawer(),
    );
  }
}
