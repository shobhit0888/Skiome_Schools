import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';
import '../models/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.bold.color(context.theme.buttonColor).xl3.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    // VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: {},
            mutations: {RemoveMutation},
            builder: (context, _, _CartList) {
              return "Rs.${_cart.totalPrice}"
                  .text
                  .xl3
                  .color(context.accentColor)
                  .make();
            },
          ),
          30.widthBox,
          ElevatedButton(
                  onPressed: (() {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: "Buying not supported yet".text.make()),
                    );
                  }),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(context.theme.buttonColor)),
                  child: "Buy".text.bold.white.make())
              .w20(context),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                  onPressed: () {
                    RemoveMutation(_cart.items[index]);
                    // setState(() {});
                  },
                  icon: Icon(Icons.remove_circle_outline)),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
