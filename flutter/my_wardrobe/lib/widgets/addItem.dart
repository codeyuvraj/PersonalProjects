import 'package:flutter/material.dart';
import '../models/category.dart';
import '../data.dart';
import 'package:tailor/widgets/category_list.dart';
import '../models/item.dart';

class AddItemWidget extends StatefulWidget {
  @override
  State<AddItemWidget> createState() => _AddItemWidgetState();
}

class _AddItemWidgetState extends State<AddItemWidget> {
  final clothNameController = TextEditingController();
  String? selectedCategory;
  // final categoryNameController;

  addItems(String name, String category) {
    setState(() {
      items.add(Item(name, category, items.length));
      Category categoryToBeUpdated =
          categories.firstWhere((element) => element.name == category);
      categoryToBeUpdated.itemIds?.add(items.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: clothNameController,
              onChanged: (text) {
                clothNameController.text = text;
                clothNameController.selection = TextSelection.collapsed(
                    offset: clothNameController.text.length);
              },
              decoration: InputDecoration(
                label: Text(
                  'Item Name',
                ),
              ),
            ),
            DropdownButton<String>(
              elevation: 20,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              items: categories.map(
                (categ) {
                  // if(categ.id > 10)
                  return DropdownMenuItem<String>(
                      value: categ.name,
                      child: Text(
                        categ.name,
                      ));
                },
              ).toList(),
              onChanged: (item) => setState(() {
                selectedCategory = item;
              }),
              value: selectedCategory,
            ),
            TextButton(
                onPressed: () => addItems(
                    clothNameController.text, selectedCategory as String),
                child: Text('Add cloth'))
          ],
        ),
      ),
    );
  }
}
