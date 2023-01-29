import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/screens/cart_screen.dart';
import '../widgets/product_item.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../widgets/app_drawer.dart';


enum FilterOptions {
  favorites,
  all,
}


class ProductOverview extends StatefulWidget {
  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  bool _showFavs = false;
  // const ProductOverview({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Show All Items'),
                value: FilterOptions.all,
              ),
              PopupMenuItem(
                child: Text('Show Favorites'),
                value: FilterOptions.favorites,
              )
            ],
            icon: Icon(Icons.menu),
            onSelected: (FilterOptions selected) {
              if (selected == FilterOptions.all && _showFavs == true) {
                setState(() {
                  _showFavs = false;
                });
              }
              if (selected == FilterOptions.favorites && _showFavs == false) {
                setState(() {
                  _showFavs = true;
                });
              }
              }
          ),
          
          Consumer<Cart>(
            builder: (context, value, child) => Badge(
              child: child, value: value.itemCount.toString()),
            child: FloatingActionButton(
              onPressed: () => Navigator.of(context).pushNamed(CartScreen.routeName),
              child: Icon(Icons.shopping_cart),
            ),
          )
        ],
        title: Text('Shop'),
      ),
      body: ProductsGrid(_showFavs),
    );
  }
}
