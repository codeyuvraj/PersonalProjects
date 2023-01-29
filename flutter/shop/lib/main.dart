import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/screens/order_details_screen.dart';
import 'package:shop/screens/product_details_screen.dart';
import './screens/cart_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './screens/products_overview_screen.dart';
import './providers/orders.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products()),
        ChangeNotifierProvider.value(
          value: Cart()),
          ChangeNotifierProvider.value(
          value: Orders()),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => ProductOverview(),
          CartScreen.routeName: (context) =>  CartScreen(),
          ProductDetail.routeName: (context) => ProductDetail(),
          OrderDetails.routeName:(context) => OrderDetails(),
        }, 
        
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: Center(
        child: Text('Let\'s build a shop!'),
      ),
    );
  }
}
