import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inlämningsupgift moment 1 TIG333',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainViwe(),
    );
  }
}

class MainViwe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ******************************************
    // bygger temporärt en lista av classen items
    var items = itemCreatorTesting();
    items.forEach((element) => (element.testPrint()));
    // ******************************************
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("TIG 333 ToDo"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: ListView(),
    );
  }

  Widget _itemRow() {
    return Row(
      children: [],
    );
  }

  itemCreatorTesting() {
    var items = [];
    var lista = [
      "Städa",
      "Handla",
      "Gå slackline med Gustaf",
      "Springa med Mårten",
    ];
    for (int i = 0; i < lista.length; i++) {
      items.add(new Item(lista[i]));
    }
    return items;
  }
}

class Item {
  var name;
  var isDone;
  Item(String name, {isDone = false}) {
    this.name = name;
    this.isDone = isDone;
  }
  setIsDone() {
    if (isDone) {
      isDone = false;
    } else {
      isDone = true;
    }
  }

  testPrint() {
    print("Item name: $name");
    print("Item is done: $isDone");
  }
}
