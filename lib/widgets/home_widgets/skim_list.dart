import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skiome/widgets/home_widgets/skim_image.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/skim.dart';
import '../../pages/Home_details.dart';
import 'add_to_cart.dart';

class SkimList extends StatelessWidget {
  const SkimList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: SkimModel.items.length,
        itemBuilder: ((context, index) {
          final skim = SkimModel.items[index];
          return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeDetailPage(skim: skim))),
              child: SkimItem(skim: skim));
        }));
  }
}

class SkimItem extends StatelessWidget {
  const SkimItem({
    Key? key,
    required this.skim,
  })  : assert(skim != null),
        super(key: key);
  final Item skim;
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(tag: Key(skim.id.toString()), child: SkimImage(image: skim.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            skim.name.text.bold.lg.color(context.theme.buttonColor).make(),
            skim.desc.text.textStyle(context.captionStyle).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "Rs.${skim.price}".text.bold.xl2.make(),
                AddtoCart(skim: skim),
              ],
            ),
          ],
        ))
      ],
    )).color(context.cardColor).rounded.square(150).make().py8();
  }
}