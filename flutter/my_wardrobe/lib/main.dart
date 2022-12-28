import 'package:flutter/material.dart';
import './widgets/addCloth.dart';
import 'models/item.dart';
import './widgets/cloth_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  void _newCloth(String name, int id, String ctg) {
    if (name == "" || ctg == null) return;
    setState(() {
      clothes.add(Cloth(name: name, id: clothes.length, category: ctg));
    });
  }

  void _openAddNewcloth(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return ClothWidget(_newCloth);
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [Builder(
            builder: (context) {
              return IconButton(
                onPressed: () => _openAddNewcloth(context),
                 icon: Icon(Icons.add));
            }
          )],
          title: const Text(
            'My Wardrobe',
          ),
        ),
        //Create a Cloth Widget
        body: Column(
          children: [
            ClothList(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Builder(builder: (context) => FloatingActionButton(
          onPressed: () => _openAddNewcloth(context),
          child: Icon(Icons.add),
        )),
      ),
    );
  }
}
