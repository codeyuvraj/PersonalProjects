import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PreviewImage extends StatelessWidget {
  // const PreviewWidget({Key key}) : super(key: key);
  var id;
  var url;

  PreviewImage(this.id, this.url);

  @override
  Widget build(BuildContext context) {
    print('preview called');
    if (url == '' || url == null) {
      return Text('No url for preview');
    } else
      return Image.network(url);
  }
}
