import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../data.dart';

class DrawerWidget extends StatelessWidget {
  // const DrawerWidget({super.key});
  void selectScreen(String routeName, BuildContext ctx) {
    print(items.length);
    Navigator.of(ctx).pushReplacementNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        children: [
          TextButton(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Home',style: TextStyle(fontSize: 40),),
            ),
            onPressed: () => selectScreen('/', context),
          ),
          // TextButton(child: Text(''), onPressed:() => selectScreen('/'),),
        ],
      ),
    );
  }
}
