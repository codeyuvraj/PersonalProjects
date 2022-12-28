import 'package:flutter/material.dart';
import '../models/item.dart';

List<String> categories = ['T Shirt', 'Jacket', 'Shoes', 'Shorts'];
List<Cloth> clothes = [
  Cloth(category: 'Shirt', name: 'Blue shirt', id: 0),
  Cloth(category: 'Shoes', name: 'Adidas Shoes', id: 1),
];

class ClothList extends StatefulWidget {
  @override
  State<ClothList> createState() => _ClothListState();
}

class _ClothListState extends State<ClothList> {
  Widget _buildClothList() {
    return Container(
      height: 560,
      width: 420,
      child: ListView.builder(
          itemCount: clothes.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('${clothes[index].name}'),
                  Text('${clothes[index].category}')
                ],
              ),
            );
          }),
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: _buildClothList(),
    );
  }
}
