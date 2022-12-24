import 'package:flutter/material.dart';
import './widgets/addCloth.dart';
import './models/cloth.dart';
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
      theme: ThemeData(
        // primaryColor: Color.fromRGBO(142, 108, 79, 1),
        // backgroundColor: Color.fromRGBO(180, 108, 79, 1),
        

      ),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(79, 32, 15, 1),
        appBar: AppBar(

          actions: [Builder(
            builder: (context) {
              return IconButton(
                onPressed: () => _openAddNewcloth(context),
                 icon: Icon(Icons.add));
            }
          )],
          backgroundColor: Color.fromRGBO(199, 108, 63, 1),
          title: const Text(
            'My Wardrobe',
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                 fontSize: 30),
          ),
        ),
        //Create a Cloth Widget
        body: Column(
          children: [
            
            ClothList(),
            // ElevatedButton(onPressed:
            // () => print(clothes), child: Text('Click Me'))
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Builder(builder: (context) => FloatingActionButton(
          onPressed: () => _openAddNewcloth(context),
          child: Icon(Icons.add),
          // backgroundColor: Color.fromRGBO(149, 69, 32, 1),
          backgroundColor: Color.fromRGBO(199, 108, 63, 1),
        )),
      ),
    );
  }
}
