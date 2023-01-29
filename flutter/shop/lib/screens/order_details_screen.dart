import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../providers/orders.dart';
import '../widgets/order_item.dart';

class OrderDetails extends StatefulWidget {
  // const OrderDetails({Key key}) : super(key: key);
  static const String routeName = 'OrderDetails';

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text('My Orders')),
      body: ListView.builder(
        itemCount: orders.orders.length,
        itemBuilder: ((context, index) => OrderItem(orders.orders[index])),
      ),
    );
  }
}
