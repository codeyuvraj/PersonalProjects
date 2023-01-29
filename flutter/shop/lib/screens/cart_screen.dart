import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../widgets/cart_item.dart' as ci;
import '../providers/orders.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartScreen extends StatefulWidget {
  // const CartScreen({Key key}) : super(key: key);
  static const routeName = 'CartScreen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final orders = Provider.of<Orders>(context);
    List<CartItem> cartItems = cart.items.values.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Cart total',
                style: TextStyle(fontSize: 30),
              ),
              // SizedBox(height: 40, width: 20, child: Container(color: Colors.amber,),),
              Spacer(),
              Icon(
                Icons.currency_rupee,
                size: 40,
              ),
              Text(
                cart.cartTotal().toStringAsFixed(2),
                style: TextStyle(fontSize: 40),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Expanded(
            child: OutlinedButton(
                onPressed: () {
                  if(cart.items.isNotEmpty)
                  orders.addOrder(Order(
                      orderId: DateTime.now().toString(),
                      productsOrdered: cart.items.values.toList()));

                  Fluttertoast.showToast(
                      msg: "Order of ${cart.totalItemCount} items placed",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);

                  cart.clearCart();
                },
                child: Expanded(
                    child:
                        Text('Proceed to Buy(${cart.totalItemCount} items)'))),
          ),
        ),
        Divider(),
        Expanded(
          child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (ctx, i) {
                return ci.CartItem(
                  cartId: cartItems[i].id,
                  productId: cart.items.keys.toList()[i],
                  imageUrl: cartItems[i].imageUrl,
                  price: cartItems[i].price,
                  quantity: cartItems[i].quantity,
                  title: cartItems[i].title,
                );
              }),
        )
      ]),
    );
  }
}
