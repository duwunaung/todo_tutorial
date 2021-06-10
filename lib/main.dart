import 'package:flutter/material.dart';

import './widgets/item.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool listViewStatus = true;
  List<Map<String, dynamic>> items = [
    {
      "title" : "Task 1"
    },
    {
      "title" : "Task 2"
    },
    {
      "title" : "Task 3"
    },
    {
      "title" : "Task 4"
    },
  ];

  final taskController = TextEditingController();

  void removeItem(item){
    items.remove(item);
  }

  int itemCount = 3;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('To-Do List'),
        ),
        body: Container(
          child: (listViewStatus == true ?
            ListView(
                children: items.map((e) =>
                    Item(
                        title: e["title"],
                        finish: () {
                          setState(() {
                            items.remove(e);
                          });
                        })
                ).toList()
            )
            : Padding(
              padding: EdgeInsets.all(20),
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: taskController,
                    decoration: const InputDecoration(
                      hintText: 'What you want to do...',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height:20),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: (){

                      setState(() {
                        this.items.add({"title": taskController.text});
                        taskController.text = "";
                        listViewStatus = true;
                      });
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
          )
          ),
        ),
        floatingActionButton: AnimatedOpacity(
          opacity: listViewStatus ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: FloatingActionButton(
            onPressed: (){
              setState(() {
                listViewStatus = false;
              });
            },
            child: new Icon(Icons.add),
          ),
        )
      ),
    );
  }
}