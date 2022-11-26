import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/skim.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("3D Objects pressed");
        },
        leading: Image.asset(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "Rs. " + item.price.toString(),
          textScaleFactor: 1.2,
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
