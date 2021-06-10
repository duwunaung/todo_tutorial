import "package:flutter/material.dart";

class Item extends StatelessWidget {

  final String title;
  final Function finish;

  Item({required this.title, required this.finish});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(12.0),
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12.0),
        color: Colors.grey.withOpacity(.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(42, 0, 0, 0),
              child: Text(title),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
              child: ElevatedButton(onPressed: (){finish();}, child: Text("Finish"))

            ),
          ],)
    );
  }
}
