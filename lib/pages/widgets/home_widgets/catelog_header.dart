import 'package:flutter/material.dart';
import 'package:flutter_catelog/pages/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';



class CatelogHeader extends StatelessWidget {
  const CatelogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: [
        "Catelog App".text.xl5.bold.color(context.theme.errorColor).make(),
        "Trending products".text.xl2.make().py8(),
      ],
    );
  }
}