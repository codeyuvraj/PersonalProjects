import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  // const ProductItem({Key key}) : super(key: key);
  final Product item;
  ProductItem(this.item);
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return GridTile(
      child: Image.network(item.imageUrl),
      footer: GridTileBar(
        backgroundColor: Colors.black45,
        leading: Consumer<Product>(
          builder: (ctx, prod, _) => IconButton(
            icon: prod.isFavorite
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
            onPressed: () {
              prod.toggleFavorite();
            },
          ),
        ),
        title: (Text(
          item.title,
          textAlign: TextAlign.center,
        )),
        trailing: IconButton(
          icon: Icon(Icons.shopping_basket),
          onPressed: (() {
            cart.addItem(product.id, product.price, product.title,product.imageUrl);
          }),
        ),
      ),
    );
  }
}
