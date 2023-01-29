import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductDetail extends StatelessWidget {
  // const ProductDetail({Key key}) : super(key: key);
  static const String routeName = 'ProductDetail';
  

  @override
  Widget build(BuildContext context) {
    final String productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<Products>(context).findProductById(productId);
    return Scaffold(
      appBar: AppBar(title: Text(loadedProduct.title)),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Image.network(loadedProduct.imageUrl),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(loadedProduct.title,style: TextStyle(fontSize: 20),),
                  Spacer(),
                  Icon(Icons.currency_rupee),
                  Text(loadedProduct.price.toString(),style: TextStyle(fontSize: 20),),
                ],
      
              ),
              
            ),
            SizedBox(height: 10,),
            Text('Description', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            SizedBox(height: 5,),
            Text(loadedProduct.description,style: TextStyle(fontSize: 15),)
          ]),
        ),
      ),
    );
  }
}
