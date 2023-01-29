import 'package:flutter/material.dart';
import './cart.dart';

class Order {
  final String orderId;
  final List<CartItem> productsOrdered;

  Order({
    this.orderId,
    this.productsOrdered,
  });

  double getTotal() {
    double total = 0;
    productsOrdered.forEach((prod) {
      total += prod.quantity * prod.price;
    });

    return total;
  }
}

class Orders with ChangeNotifier {
  List<Order> _orders = [];

  void addOrder(Order order) {
    _orders.add(order);
  }

  List<Order> get orders {
    return [..._orders];
  }
}
