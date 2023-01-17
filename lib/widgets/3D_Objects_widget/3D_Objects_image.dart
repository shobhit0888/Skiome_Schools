import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:velocity_x/velocity_x.dart';

class ObjectImage extends StatelessWidget {
  final String image;
  const ObjectImage({super.key, required this.image});
  
  @override
  Widget build(BuildContext context) {
    return Image.network(image,).box.rounded.p16.color(context.canvasColor).make().p16().w40(context);
  }
}
