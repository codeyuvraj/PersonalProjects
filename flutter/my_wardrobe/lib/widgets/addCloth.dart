import 'package:flutter/material.dart';
import 'package:tailor/widgets/cloth_list.dart';
import '../models/cloth.dart';

class ClothWidget extends StatefulWidget {
  Function? adclt;
  ClothWidget(this.adclt);

  @override
  State<ClothWidget> createState() => _ClothWidgetState();
}

class _ClothWidgetState extends State<ClothWidget> {
  final clothNameController = TextEditingController();

  String? selectedCategory;

  // final categoryNameController;
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
                  'Cloth Name',
                  selectionColor: Color.fromARGB(250, 89, 189, 60),
                  style: TextStyle(color: Color.fromARGB(230, 77, 5, 5)),
                ),
              ),
            ),
            DropdownButton<String>(
              elevation: 20,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              dropdownColor: Color.fromARGB(250, 189, 189, 60),
              items: categories
                  .map(
                    (categ) => DropdownMenuItem<String>(
                        value: categ,
                        child: Text(
                          categ,
                          style:
                              TextStyle(color: Color.fromARGB(230, 77, 5, 5)),
                        )),
                  )
                  .toList(),
              onChanged: (item) => setState(() {
                selectedCategory = item;
              }),
              value: selectedCategory,
            ),
            TextButton(
                onPressed: () {
                  widget.adclt!(clothNameController.text, clothes.length,
                      selectedCategory);
                  clothNameController.text = "";
                  // selectedCategory = null;
                  Navigator.of(context).pop();
                },
                child: Text('Add cloth'))
          ],
        ),
      ),
    );
  }
}
