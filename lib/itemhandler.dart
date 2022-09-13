import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ItemHandler extends ChangeNotifier {
  List<Item> _items = [];
  ItemHandler() {
    // _items = itemCreatorTesting(); // för test skapas en lista med Item

    // _items.forEach((element) => (element
    //     .testPrint())); // lista skrivs ut i konsollen för att underlätta testande.
  }

  List<Item> get items => _items;

  // void newItemList(json){
  //   Factory Item.fromJson(Map<String, dynamic> json){
  //     return Item(

  //     )
  //   }
  // }
  void newAddItem(json) {
    Item.fromJson(json);
  }

  void addItem(String newItemName) {
    _items.add(Item(name: newItemName));
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

  // itemCreatorTesting() {
  //   List<Item> items = [];
  //   var lista = [
  //     "Städa",
  //     "Handla",
  //     "Gå slackline med Gustaf",
  //     "Springa med Mårten",
  //   ];
  //   for (int i = 0; i < lista.length; i++) {
  //     items.add(Item(lista[i]));
  //   }
  //   return items;
  // }
}

class Item {
  var _name;
  var _isDone;
  var _id;
  Item({String name = "", String id = "", isDone = false}) {
    this._name = name;
    this._isDone = isDone;
    this._id = id;
  }
  factory Item.fromJson(Map<String, Object> json) {
    return Item(
      id: json["id"].toString(),
      name: json["title"].toString(),
      isDone: json["done"].toString(),
    );
  }

  String get name => _name;
  bool get isDone => _isDone;
  String get id => _id;

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
