import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class SkimHeader extends StatelessWidget {
  const SkimHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // "Skiome".text.xl2.bold.color(context.theme.buttonColor).make(),
        "A way to Skill Development".text.xl.make().px32(),
      ],
    );
  }
}
