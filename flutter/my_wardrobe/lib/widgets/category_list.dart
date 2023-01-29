// import 'package:flutter/material.dart';
// import '../models/category.dart';

// class CategoryList extends StatefulWidget {
//   final GenderCategory men;
//   CategoryList({required this.men});
//   @override
//   State<CategoryList> createState() => _CategoryListState();
// }

// class _CategoryListState extends State<CategoryList> {
//   @override
//   Widget build(BuildContext context) {
//     var lengthMen = widget.men.categories.length;
//     int rows = lengthMen ~/ 4;

//     // return Container(
//     //   height: MediaQuery.of(context).size.height -
//     //       (MediaQuery.of(context).size.width * 0.12 * 3) -
//     //       100,
//     //   child: ListView(children: [
//     return Wrap(
//       children: [
//         Container(
//           height: (MediaQuery.of(context).size.height -
//                   (MediaQuery.of(context).size.width * 0.12 * 3) -
//                   5) /
//               2,
//           width: MediaQuery.of(context).size.width / 2,
//           color: Colors.blue,
//         ),
//         Container(
//           height: (MediaQuery.of(context).size.height -
//                   (MediaQuery.of(context).size.width * 0.12 * 3) -
//                   5) /
//               2,
//           width: MediaQuery.of(context).size.width / 2,
//           color: Colors.red,
//         ),
//         Container(
//           height: (MediaQuery.of(context).size.height -
//                   (MediaQuery.of(context).size.width * 0.12 * 3) -
//                   5) /
//               2,
//           width: MediaQuery.of(context).size.width / 2,
//           color: Colors.green,
//         ),
//         Container(
//           height: (MediaQuery.of(context).size.height -
//                   (MediaQuery.of(context).size.width * 0.12 * 3) -
//                   5) /
//               2,
//           width: MediaQuery.of(context).size.width / 2,
//           color: Colors.yellow,
//         ),
//         Container(
//           height: (MediaQuery.of(context).size.height -
//                   (MediaQuery.of(context).size.width * 0.12 * 3) -
//                   5) /
//               2,
//           width: MediaQuery.of(context).size.width / 2,
//           color: Colors.orange,
//         ),
//       ],
//     );
//     //   ]),
//     // );
//     // ]
//   }
// }

// class CategorySelectorMenu extends StatefulWidget {
//   List<Category> categories;
//   CategorySelectorMenu({required this.categories});

//   @override
//   State<CategorySelectorMenu> createState() => _CategorySelectorMenuState();
// }

// class _CategorySelectorMenuState extends State<CategorySelectorMenu> {
//   // List<Row> menu(BuildContext context, List<Category> categories) {
//   //   List<Container> categoryMenu = [];
//   //   List<Row> rows = [];
//   //   int lengthCategory = categories.length;
//   //   int rowCount = lengthCategory ~/ lengthCategory;
//   //   for (int i = 0; i < lengthCategory; i++) {
//   //     //i<length of categories
//   //     categoryMenu.add(Container(
//   //       width: MediaQuery.of(context).size.width * 0.248,
//   //       child: Text(categories[i].name),
//   //     ));
//   //   }
//   //   for (int i = 0; i < rowCount; i++) {
//   //     rows.add(Row());
//   //     for (int j = 0; j < 4; j++) {
//   //       rows[i].children.add(categoryMenu[i * 4 + j]);
//   //     }
//   //   }
//   //   return rows;
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.topCenter,
//       padding: const EdgeInsets.all(2.0),
//       child: Wrap(
//         // crossAxisAlignment: WrapCrossAlignment.center,
//         // clipBehavior: Clip.hardEdge,
//         // runSpacing: 5,
//         // runAlignment: ,
//         alignment: WrapAlignment.spaceBetween,
//         spacing: 2,
//         runSpacing: 2,

//         children: widget.categories.map((category) {
//           return Container(
//               decoration: BoxDecoration(
//                   border: Border.all(
//                 width: 0.5,
//               )),
//               width: MediaQuery.of(context).size.width * 0.24,
//               height: MediaQuery.of(context).size.width * 0.12,
//               // margin: EdgeInsets.all(1),
//               // padding: EdgeInsets.all(5),
//               child: TextButton(
//                 onPressed: null,
//                 child: Text(category.name),
//               ));
//         }).toList(),
//       ),
//     );
//   }
// }
