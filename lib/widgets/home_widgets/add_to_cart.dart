import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/store.dart';
import '../../models/cart.dart';
import '../../models/skim.dart';

class AddtoCart extends StatelessWidget {
  final Item skim;

  AddtoCart({super.key, required this.skim});

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    bool isInCart = _cart.items.contains(skim) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(skim);

          // setState(() {});
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      child: isInCart ? Icon(Icons.done) : Icon(Icons.add),
    );
  }
}
