import '../category.dart';

class CategoryArguments {
  CategoryArguments(
    this.category, {
    this.parent,
  });

  Category category;
  Category parent;

  Map<String, dynamic> toMap() => {
        "category": category == null ? null : category.toMap(),
        "parent": parent == null ? null : parent.toMap(),
      };

  @override
  String toString() {
    return this.toMap().toString();
  }
}
