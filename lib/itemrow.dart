import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/itemhandler.dart';

class ItemRow extends StatelessWidget {
  build(BuildContext context) {
    return Consumer<ItemHandler>(
      builder: (context, ItemHandler, _) {
        return ListView.builder(
          itemCount: (ItemHandler.items.length),
          itemBuilder: (context, index) => Row(
            children: [
              ItemCheckbox(ItemHandler.items[index]),
              _itemText(ItemHandler.items[index]),
              _itemRemove(ItemHandler.items[index])
            ],
          ),
        );
      },
    );
  }
}

class ItemCheckbox extends StatelessWidget {
  var _item;
  ItemCheckbox(Item item) {
    _item = item;
  }

  build(BuildContext context) {
    return Consumer<ItemHandler>(builder: (
      context,
      ItemHandler,
      _,
    ) {
      return Container(
        margin: EdgeInsets.all(20.0),
        child: Checkbox(
            value: _item.isDone,
            onChanged: (bool? newValue) {
              ItemHandler.updateItemIsDone(_item);
              _item.testPrint();
            }),
      );
    });
  }
}

Widget _itemText(item) {
  return Expanded(
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          item.name,
          overflow: TextOverflow.ellipsis,
          style: item.isDone
              ? const TextStyle(
                  fontSize: 24, decoration: TextDecoration.lineThrough)
              : const TextStyle(fontSize: 24),
        ),
      ),
    ),
  );
}

Widget _itemRemove(item) {
  return Consumer<ItemHandler>(builder: (context, ItemHandler, _) {
    return IconButton(
      onPressed: () {
        ItemHandler.removeItem(item);
      },
      padding: EdgeInsets.all(20.0),
      icon: Icon(Icons.delete_outline),
    );
  });
}
