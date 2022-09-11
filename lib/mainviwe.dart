import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './itemrow.dart';
import './addviwe.dart';

class MainViwe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ******************************************
    // bygger temporärt en lista av classen items
    //var items = itemCreatorTesting();
    // items.forEach((element) => (element.testPrint()));

    // ******************************************
    String valtFilter = "All";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Center(child: const Text("TIG 333 ToDo")),
        actions: [
          DropdownButtonHideUnderline(
            child: Container(
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: DropdownButton(
                    icon: Icon(Icons.more_vert),
                    items: [
                      filterVal("All"),
                      filterVal("Done"),
                      filterVal("Undone")
                    ],
                    onChanged: (value) {}),
              ),
            ),
          ),
        ],
      ),
      body: ItemRow(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItemViwe()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  DropdownMenuItem<String> filterVal(String value) {
    return DropdownMenuItem(value: value, child: Text(value));
  }
}
