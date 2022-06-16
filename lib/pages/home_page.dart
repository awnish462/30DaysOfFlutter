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
      body: (CatelogItem.item != null && CatelogItem.item!.isNotEmpty)
          ? GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // crossAxisSpacing: 16,
                    // mainAxisExtent: 16
                  ),
                  
              itemBuilder: (context, index) {
                final item = CatelogItem.item![index];
                return Card(
                    // clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: GridTile(
                        header: Container(
                          child: Text(item.name,style: TextStyle(color: Colors.white),),

                        decoration: BoxDecoration(
                          color: Colors.purple
                        ),
                        padding: EdgeInsets.all(2),),
                        footer: Text(
                          item.price.toString(),
                        ),
                        child: Image.network(item.image)));
              },
              itemCount: CatelogItem.item!.length,
              )

          : Center(
              child: CircularProgressIndicator(),
            ),
      drawer: MyDrawer(),
    );
  }
}
