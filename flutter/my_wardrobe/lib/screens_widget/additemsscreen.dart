import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import '../widgets/drawerwidget.dart';
import '../widgets/addItem.dart';
import '../data.dart';

class AddItemScreen extends StatelessWidget {
  // const AddItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(title: const Text('Add Items'),),
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              Container(height: MediaQuery.of(context).size.height/2,
                margin: EdgeInsets.all(5),
                color: Colors.grey,
                child: Center(child: Text('Add your Image items')),),
              Positioned(
                bottom: 20,
                right: 20,
                child: Text('Add Image button will be added in future'),
              )
            ]
          ),
          Container(margin: EdgeInsets.all(5),
          child: AddItemWidget(),)
        ],),
      ),
    );
  }
}