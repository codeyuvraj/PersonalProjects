import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  int quantity;
  final double price;
  final String imageUrl;

  CartItem({
    this.id,
    this.title,
    this.quantity,
    this.price,
    this.imageUrl,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {
    'parv': CartItem(
        id: 'Arvind Kejriwal',
        title: 'Arvind, Delhi CM',
        quantity: 1,
        price: 20.00,
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/0/04/Arvind_Kejriwal_in_Punjab.png')
  };
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String productId, double productPrice, String productTitle,
      String imageUrl) {
    if (_items.containsKey(productId)) {
      _items[productId].quantity++;
      // _items.update(productId, (existingCartItem) {existingCartItem.quantity = existingCartItem + 1}
      // _items.update(productId, (existingCartItem) {existingCartItem.quantity = existingCartItem + 1} CartItem(
      //   id: existingCartItem.id,
      //   price: existingCartItem.price,
      //   quantity: existingCartItem.quantity + 1,
      // title: existingCartItem
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: productTitle,
              price: productPrice,
              quantity: 1,
              imageUrl: imageUrl));
    }
    notifyListeners();
  }

  double cartTotal() {
    double total = 0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
      // return {key: value};
    });
    return total;
  }

  int get totalItemCount {
    int count = 0;
    _items.forEach((key, value) {
      count += value.quantity;
    });
    return count;
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
