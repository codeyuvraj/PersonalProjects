import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/product_item.dart';
import '../screens/product_details_screen.dart';

class ProductsGrid extends StatelessWidget {
  // const ProductsGrid({Key key}) : super(key: key);
  final bool _showFavs;
  ProductsGrid(this._showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final loadedProducts =
        _showFavs ? productsData.favouriteItems : productsData.items;
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2 / 3,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            crossAxisSpacing: 10),
        itemCount: loadedProducts.length,
        itemBuilder: ((context, index) {
          // return ProductItem(loadedProducts[index]);
          return ChangeNotifierProvider.value(
            value: loadedProducts[index],
            child: GestureDetector( 
              onTap: () => {Navigator.of(context).pushNamed(ProductDetail.routeName,arguments: loadedProducts[index].id)},
              child: ProductItem(loadedProducts[index])),
          );
        }));
  }
}
