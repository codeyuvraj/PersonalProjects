import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import '../screens/edit_products.dart';
import '../providers/products.dart';

class ManageProducts extends StatelessWidget {
  // const ManageProducts({Key key}) : super(key: key);
  static const routeName = 'manageProducts';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return Scaffold(
        appBar: AppBar(
          title: Text('Manage Products'),
          actions: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextButton(
                    onPressed: () => Navigator.of(context).pushNamed(
                        EditProducts.routeName,
                        arguments: null), //add products
                    child: CircleAvatar(
                        child: Icon(
                      Icons.add,
                      color: Colors.white,
                    )))),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, i) {
              return Container(
                // padding: EdgeInsets.all(5),
                // margin: EdgeInsets.all(5),
                child: Card(
                  elevation: 2,
                  margin: EdgeInsets.all(1),
                  child: ListTile(
                    leading: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.network(products[i].imageUrl),
                    ),
                    // subtitle: Text(products[i].title),
                    trailing: Container(
                      width: 200,
                      child: Row(children: [
                        Text(products[i].title),
                        Spacer(),
                        IconButton(
                            onPressed: () => Navigator.of(context).pushNamed(
                                EditProducts.routeName,
                                arguments: products[i].id),
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () => Provider.of<Products>(context,listen: false).deleteProduct(products[i].id),
                            icon: Icon(Icons.delete))
                      ]),
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
