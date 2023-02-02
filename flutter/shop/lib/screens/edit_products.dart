import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/products.dart';
import '../widgets/preview_image.dart';

class EditProducts extends StatefulWidget {
  // const MyWidget({Key key}) : super(key: key);
  static const routeName = 'editProducts';

  @override
  State<EditProducts> createState() => _EditProductsState();
}

class _EditProductsState extends State<EditProducts> {
  final _form = GlobalKey<FormState>();
  final _priceNode = FocusNode();
  final _quantityNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlNode = FocusNode();
  final _descriptionNode = FocusNode();
  var price, description, title, imageUrl;
  var productId;
  var initialProd =
      Product(id: '', title: '', description: '', price: null, imageUrl: '');

  @override
  void initState() {
    // TODO: implement initState
    _imageUrlNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('running dependencies');
    // TODO: implement didChangeDependencies
    productId = ModalRoute.of(context).settings.arguments;

    if (productId != null) {
      initialProd = Provider.of<Products>(context).findProductById(productId);
      _imageUrlController.text = initialProd.imageUrl;
    }
    super.didChangeDependencies();
  }

  void _saveform() {
    if (!_form.currentState.validate()) return;
    _form.currentState.save();

    if (productId == null) {
      Provider.of<Products>(context, listen: false).addProduct(
          title: title,
          description: description,
          imageUrl: imageUrl,
          price: price);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Product Added',
        ),
        duration: Duration(seconds: 1),
      ));
    } else {
      Provider.of<Products>(context, listen: false).updateProduct(
          id: productId,
          title: title,
          description: description,
          imageUrl: imageUrl,
          price: price);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Product updated'),
        duration: Duration(seconds: 1),
      ));
    }

    Navigator.of(context).pop();
  }

  void _updateImageUrl() {
    if (!_imageUrlNode.hasFocus) {
      // if ((!_imageUrlController.text.startsWith('http') &&
      //         !_imageUrlController.text.startsWith('https')) ||
      //     (!_imageUrlController.text.endsWith('.png') &&
      //         !_imageUrlController.text.endsWith('.jpg') &&
      //         !_imageUrlController.text.endsWith('.jpeg'))) {
      //   return;
      // }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Products'), actions: [
        ElevatedButton(onPressed: _saveform, child: Icon(Icons.save))
      ]),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: _form,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                TextFormField(
                  initialValue: initialProd.title,
                  decoration: InputDecoration(
                      label: Text('Enter the title of product')),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_descriptionNode),
                  validator: (value) {
                    if (value.isEmpty) return 'Please enter a title text';
                    return null;
                  },
                  onSaved: (newValue) {
                    title = newValue;
                  },
                ),
                TextFormField(
                  initialValue: initialProd.description,
                  decoration:
                      InputDecoration(label: Text('Description of product')),
                  textInputAction: TextInputAction.next,
                  focusNode: _descriptionNode,
                  validator: (value) {
                    if (value.isEmpty) return 'enter a description';
                    if (value.length < 20)
                      return 'Atleast 20 characters required';
                    return null;
                  },
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_priceNode),
                  onSaved: (newValue) => description = newValue,
                ),
                TextFormField(
                  
                  initialValue:
                      productId != null ? initialProd.price.toString() : '',
                  decoration: InputDecoration(label: Text('Price')),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: _priceNode,
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_imageUrlNode),
                  validator: (value) {
                    if (value.isEmpty) return 'enter a valid price';
                    if (double.parse(value) < 0)
                      return 'enter a non negative value';
                    return null;
                  },
                  onSaved: (newValue) => price = double.parse(newValue),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 75,
                      width: 75,
                      child: PreviewImage(productId, _imageUrlController.text),
                    ),
                    Expanded(
                      child: TextFormField(
                        // initialValue: initialProd.imageUrl,
                        decoration: InputDecoration(label: Text('Image Url')),
                        textInputAction: TextInputAction.done,
                        focusNode: _imageUrlNode,
                        controller: _imageUrlController,
                        onFieldSubmitted: (_) => _saveform(),
                        onSaved: (newValue) => imageUrl = newValue,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
