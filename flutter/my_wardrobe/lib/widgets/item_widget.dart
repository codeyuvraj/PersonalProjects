import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ItemWidget extends StatelessWidget {
  // const ItemWidget({super.key});
  final String itemName;
  final Color color;
  ItemWidget(this.itemName, this.color);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          
          margin: const EdgeInsets.only(left: 1, right: 1, top: 1, bottom: 5),
          decoration: BoxDecoration(border: Border.all(width: 0.5,
          ),
          color: color),
          width: width/2 - 2,
          height: ((width- 4)/2) * (4/3),
          // color: color,
        ),
        // SizedBox(),
        Container(margin: EdgeInsets.only(bottom: 5),child: Text(itemName)),
      ],
    );
  }
}
