import '../category.dart';
import '../item.dart';

class ItemArguments {
  ItemArguments(
    this.item, {
    this.parent,
  });

  Item item;
  Category parent;

  Map<String, dynamic> toMap() => {
        "item": item == null ? null : item.toMap(),
        "parent": parent == null ? null : parent.toMap(),
      };

  @override
  String toString() {
    return this.toMap().toString();
  }
}
