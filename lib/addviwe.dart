import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/mainviwe.dart';
import './itemhandler.dart';

class AddItemViwe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  left: 60, right: 60, top: 20, bottom: 20),
              child: AddItem(),
            ),
          ],
        ),
      ),
    );
  }
}

class AddItem extends StatelessWidget {
  TextEditingController userInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemHandler>(builder: (context, ItemHandler, _) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: userInput,
              decoration: const InputDecoration(
                hintText: "What are you gong to add?",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              ItemHandler.addItem(userInput.text);
              Navigator.pop(context);
            },
            child: const Text(
              "+ ADD",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      );
    });
  }
}
