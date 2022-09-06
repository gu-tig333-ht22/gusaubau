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
      body: _itemRow(items),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItemViwe()),
          );
        },
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }

  void _onChanged(bool? value) {}

  Widget _itemRow(items) {
    return ListView.builder(
      itemBuilder: (context, index) => Row(
        children: [
          _itemCheckBox(items[index].isDone),
          _itemText(items[index].name),
          _itemRemove(),
        ],
      ),
      itemCount: items.length,
    );
  }

  Widget _itemCheckBox(itemIsDone) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Checkbox(
        value: false,
        onChanged: _onChanged,
      ),
    );
  }

  Widget _itemText(itemName) {
    return Expanded(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            itemName,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }

  Widget _itemRemove() {
    return IconButton(
      onPressed: () {},
      padding: EdgeInsets.all(20.0),
      icon: Icon(Icons.delete_outline),
    );
  }

// itemCreator är till för testning
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

class AddItemViwe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 60, right: 60),
              child: _textField(),
            ),
            _addButton(),
          ],
        ),
      ),
    );
  }

  Widget _textField() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "What are you gong to add?",
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            width: 1,
          )),
        ),
      ),
    );
  }

  Widget _addButton() {
    return TextButton(
      onPressed: () {},
      child: const Text(
        "+ ADD",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
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

  // endast för att testa så classen byggts korrekt
  testPrint() {
    print("Item name: $name");
    print("Item is done: $isDone");
  }
}
