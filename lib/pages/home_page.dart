// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
// import 'dart:html';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_catelog/model/catelog.dart';
import 'package:flutter_catelog/pages/widgets/drawer.dart';
import 'package:flutter_catelog/pages/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
        backgroundColor: MyTheme.creamColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatelogHeader(),
                if (CatelogItem.item != null && CatelogItem.item!.isNotEmpty)
                  CatelogList().expand()
                else
                  Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ));
  }
}

class CatelogHeader extends StatelessWidget {
  const CatelogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catelog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Trending products".text.xl2.make(),
      ],
    );
  }
}

class CatelogList extends StatelessWidget {
  const CatelogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatelogItem.item?.length,
      itemBuilder: (context, index) {
        final catelog = CatelogItem.item![index];
        //catelogitems is widget which we will make
        return CatelogItems(
          catelog: catelog,
        );
      },
    );
  }
}

class CatelogItems extends StatelessWidget {
  final Item catelog;
  const CatelogItems({
    Key? key,
    required this.catelog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatelogImage(image: catelog.image),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catelog.name.text.xl.color(MyTheme.darkBluishColor).bold.make(),
            catelog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catelog.price}".text.bold.xl.make(),
                ElevatedButton(onPressed: (){}, child:"Buy".text.make(),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                shape: MaterialStateProperty.all(StadiumBorder())
                ),
                ),
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).white.roundedLg.square(130).make().py16();
  }
}

class CatelogImage extends StatelessWidget {
  const CatelogImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .p8
        .color(MyTheme.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}
