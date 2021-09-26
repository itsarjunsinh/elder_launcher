import 'package:flutter/material.dart';
import '../models/item.dart';

class EditModel extends ChangeNotifier {
  final sortedItems = <Item>[];
  final _favPositions = <int>[];

  bool isListLoaded = false;
  bool isListModified = false;

  var _allItems = <Item>[];
  var _favItems = <Item>[];

  EditModel({required List<Item> favItems, List<Item>? allItems}) {
    _favItems = favItems;
    if (allItems != null) _allItems = allItems;
    _generateSortedList();
  }

  /// Sort favourite items to top of the list
  Future<void> _generateSortedList() async {
    for (var i = 0; i < _favItems.length; i++) {
      sortedItems.add(_favItems[i]);
      _favPositions.add(i);
    }
    for (var item in _allItems) {
      if (!_favItems.contains(item)) sortedItems.add(item);
    }
    isListLoaded = true;
  }

  bool isFav(int position) {
    if (_favPositions.contains(position)) {
      return true;
    } else {
      return false;
    }
  }

  void toggleFav(int position) {
    isFav(position)
        ? _favPositions.remove(position)
        : _favPositions.add(position);
    isListModified = true;
    notifyListeners();
  }

  void reorderFavItems(int oldIndex, int newIndex) {
    sortedItems.insert(newIndex, sortedItems[oldIndex]);
    sortedItems.removeAt(oldIndex > newIndex ? oldIndex + 1 : oldIndex);
    isListModified = true;
    notifyListeners();
  }

  List<String> getFavIds() {
    _favPositions.sort();
    var favIds = <String>[];
    for (var i in _favPositions) {
      favIds.add(sortedItems[i].id);
    }
    return favIds;
  }
}
