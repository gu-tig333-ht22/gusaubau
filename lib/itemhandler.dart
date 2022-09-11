import 'package:flutter/cupertino.dart';

class ItemHandler extends ChangeNotifier {
  var _items;
  ItemHandler() {
    _items = itemCreatorTesting();
    _items.forEach((element) => (element.testPrint()));
  }

  List get items => _items;

  void addItem(String newItemName) {
    _items.add(Item(newItemName));
    notifyListeners();
  }

  void updateItemIsDone(Item itemToUpdate) {
    itemToUpdate.setIsDone();
    notifyListeners();
  }

  void removeItem(Item itemToRemove) {
    _items.remove(itemToRemove);
    notifyListeners();
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
      items.add(Item(lista[i]));
    }
    return items;
  }
}

class Item {
  var _name;
  var _isDone;
  Item(String name, {isDone = false}) {
    this._name = name;
    this._isDone = isDone;
  }
  String get name => _name;
  bool get isDone => _isDone;

  set name(String newName) {
    _name = newName;
  }

  setIsDone() {
    _isDone = !_isDone;
  }

  // endast för att testa så classen byggts korrekt
  testPrint() {
    print("Item name: $_name");
    print("Item is done: $_isDone");
  }
}
