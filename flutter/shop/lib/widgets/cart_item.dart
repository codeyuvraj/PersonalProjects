// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  // const CartItem({Key key}) : super(key: key);
  final String imageUrl;
  final String productId;
  final String cartId;
  final double price;
  final int quantity;
  final String title;

  CartItem({
    this.imageUrl,
    this.productId,
    this.cartId,
    this.price,
    this.quantity,
    this.title,
  });

  double min(double a, double b) {
    if (a < b)
      return a;
    else
      return b;
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartId),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        child: Icon(Icons.delete, size: 80),
        alignment: Alignment.centerRight,
        // margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(5),
      ),
      onDismissed: (_) => {Provider.of<Cart>(context,listen: false).removeItem(productId),
      print(Provider.of<Cart>(context).items)},
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Card(
          child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  imageUrl,
                  height: 200,
                  width: 200,
                ),
                SizedBox(
                  height: 200,
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Price: ',
                          style: TextStyle(fontSize: 20),
                        ),
                        Icon(Icons.currency_rupee),
                        Text(
                          '${price}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Quantity: $quantity',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Total: ${price * quantity}',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Icon(Icons.plus_one),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
