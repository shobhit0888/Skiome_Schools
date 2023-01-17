// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:skiome/models/3D_Models/Physics_Models/Optics3D.dart';
import 'package:velocity_x/velocity_x.dart';

import '3D_Objects_image.dart';

class ObjectList extends StatelessWidget {
  const ObjectList({
    Key? key,
    required this.op,
  }) : super(key: key);
  final Optics op;
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(tag: Key(op.id.toString()), child: ObjectImage(image: op.image)),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            op.name.text.bold.lg.color(context.theme.buttonColor).make(),
            
          ],
        ))
      ],
    )).color(context.cardColor).rounded.square(150).make().py8();
  }
}
