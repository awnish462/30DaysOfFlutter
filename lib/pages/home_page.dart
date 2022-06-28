// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
// import 'dart:html';
// import 'dart:html';
// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catelog/model/cart_model.dart';

import 'package:flutter_catelog/model/catelog.dart';
import 'package:flutter_catelog/pages/widgets/home_widgets/catelog_header.dart';
import 'package:flutter_catelog/pages/widgets/home_widgets/catelog_list.dart';
import 'package:flutter_catelog/pages/widgets/themes.dart';
import 'package:flutter_catelog/store/store.dart';
import 'package:flutter_catelog/utilities/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Awnish";

  final Url =
      "https://gist.github.com/hiteshsahu/f58bcca95532fde77fd0d9e94a9c3148";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // var itemjson = await rootBundle.loadString("assets/files/items.json");
    final response = await http.get(Uri.parse(Url));
    final itemjson = response.body;
    var decodeData = jsonDecode(itemjson);
    final productsdata = decodeData["products"];
    CatelogItem.item = List.from(productsdata)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (context, store, status) => FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.cartRoute);
            },
            backgroundColor: MyTheme.lightBluishColor,
            child: Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            ),
          ).badge(
              count: _cart.items.length,
              color: Color.fromARGB(255, 228, 158, 157),
              size: 20,
              textStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatelogHeader(),
                if (CatelogItem.item != null && CatelogItem.item.isNotEmpty)
                  CatelogList().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
