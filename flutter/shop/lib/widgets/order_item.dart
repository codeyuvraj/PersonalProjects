import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shop/providers/orders.dart';

class OrderItem extends StatelessWidget {
  // const OrderItem({Key key}) : super(key: key);
  final Order order;
  OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.all(2),
      child: Card(
        elevation: 2,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Order Id: ${order.orderId}'),
          SizedBox(
            height: 5,
          ),
          Text('Order Total: ${order.getTotal().toString()}'),
          SizedBox(
            height: 5,
          ),
          ...order.productsOrdered.map((product) {
            return Row(
              children: [
                Text(product.title),
                Spacer(),
                Text('Price: ${product.price}  '),
                Text('Quantity: ${product.quantity}'),
              ],
            );
          }).toList()
        ]),
      ),
    );
  }
}
