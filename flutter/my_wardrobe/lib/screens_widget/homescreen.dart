import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tailor/models/category.dart';
import 'package:tailor/models/item.dart';
import 'package:tailor/screens_widget/additemsscreen.dart';
import '../widgets/drawerwidget.dart';
import 'package:tailor/widgets/item_widget.dart';
import '../data.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
  
}

class _HomeScreenState extends State<HomeScreen> {
  // const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        actions: [
          Builder(builder: (context) {
            return IconButton(onPressed: () => null, icon: Icon(Icons.delete));
          })
        ],
        title: const Text(
          'My Wardrobe',
        ),
      ),
      body: ListView.builder(
          // itemExtent: 1,
          itemCount: men.categoryIds.length,
          itemBuilder: (context, index) {
            int categoryId = men.categoryIds[index];
            Category selectedCategory = categories[index];
            for (Category category in categories) {
              if (category.id == categoryId) {
                selectedCategory = category;
                break;
              }
            }
            return selectedCategory.itemIds == null
                ? Container()
                : Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          selectedCategory.name,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Wrap(
                        children: (selectedCategory.itemIds?.map((itemId) {
                          return ItemWidget(
                              items[itemId - 1].name as String, Colors.black);
                        }))?.toList() as List<ItemWidget>,
                      )
                    ],
                  );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/additemscreen'),
        child: Icon(Icons.add),
      ),
    );
  }
}
