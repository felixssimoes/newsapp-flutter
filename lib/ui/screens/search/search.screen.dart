import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                // border: InputBorder.none,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5), gapPadding: 0)),
          ),
        ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.cancel),
        //     onPressed: () {},
        //   )
        // ],
      ),
    );
  }
}
