import 'package:flutter/material.dart';

class Checklist extends StatefulWidget {
  const Checklist({Key? key}) : super(key: key);

  @override
  State<Checklist> createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  final item = <String>["Apples", "Oranges", "Butter"];
  final quantity = [2, 4, 5];
  final price = ["5usd", "10usd", "10usd"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Free2GO"),
      ),
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          child: Row(
            children: <Widget>[
              Expanded(child: Icon(Icons.apple)),
              Expanded(
                  child: Column(
                children: <Widget>[
                  Container(
                    child: Text('${item[index]}'),
                  ),
                  Container(
                    child: Text('${price[index]}'),
                  ),
                  Container(
                    child: Text('${quantity[index]}'),
                  )
                ],
              ))
            ],
          ),
        );
      }),
    );
  }
}
