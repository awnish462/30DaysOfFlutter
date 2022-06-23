import 'package:flutter/material.dart';
import 'package:flutter_catelog/model/catelog.dart';
import 'package:flutter_catelog/pages/home_detail_page.dart';
import 'package:flutter_catelog/pages/widgets/home_widgets/catelog_image.dart';
import 'package:flutter_catelog/pages/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
        return InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeDetailPage(catelog: catelog))),
          child: CatelogItems(
            catelog: catelog,
          ),
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
        Hero(
          tag: Key(catelog.id.toString()),
          child: CatelogImage(image: catelog.image)),
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
                ElevatedButton(
                  onPressed: () {},
                  child: "Buy".text.make(),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyTheme.darkBluishColor),
                      shape: MaterialStateProperty.all(StadiumBorder())),
                ),
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).white.roundedLg.square(130).make().py16();
  }
}
