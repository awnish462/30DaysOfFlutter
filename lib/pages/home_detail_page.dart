// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_catelog/pages/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catelog/model/catelog.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({
    Key? key,
    required this.catelog,
  })  : assert(catelog != null),
        super(key: key);
  final Item catelog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catelog.price}".text.bold.xl3.color(Colors.red).make(),
                  ElevatedButton(
                    onPressed: () {},
                    child: "Buy".text.make(),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluishColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                  ).wh(90,40),
                ],
              ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catelog.id.toString()),
                    child: Image.network(catelog.image))
                .h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                width: context.screenWidth,
                  color: Colors.white,
                  child: Column(
                    children: [
                      catelog.name.text.xl4
                          .color(MyTheme.darkBluishColor)
                          .bold
                          .make(),
                      catelog.desc.text.textStyle(context.captionStyle).xl.make(),
                      // 10.heightBox,
                    ],
                  ).py64(),
                  ),
            ))
          ],
        ),
      ),
    );
  }
}
