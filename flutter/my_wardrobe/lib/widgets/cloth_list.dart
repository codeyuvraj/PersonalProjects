import 'package:flutter/material.dart';
import '../models/cloth.dart';

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
  

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(        
        // color: Color.fromARGB(50, 77, 5, 5),
        // color: ThemeData.from(colorScheme: ),
        color: Color.fromRGBO(240, 240, 240, 1),
        height: 560,
        width: 420,
        child: ListView.builder(
          itemCount: clothes.length,
          itemBuilder: (context, index) {
            return Card(
                color: Color.fromARGB(20, 77, 5, 5),
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text('${clothes[index].name}'), Text('${clothes[index].category}')],
                ),
              );
          }
            
          ),
      ),
    );
    
  }
}
