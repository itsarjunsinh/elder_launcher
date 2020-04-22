import 'package:elder_launcher/models/edit_model.dart';
import 'package:elder_launcher/models/item.dart';
import 'package:flutter/material.dart';

class ReorderWidget extends StatelessWidget {
  final EditModel editModel;
  final bool showId;

  const ReorderWidget(this.editModel, {Key key, @required this.showId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Item> _favItems = editModel.sortedItems;

    void reorderItems(int oldIndex, int newIndex) {
      editModel.reorderFavItems(oldIndex, newIndex);
    }

    return ReorderableListView(
      children: _favItems
          .map((Item item) => ReorderableCard(
                item: item,
                key: Key(item.id),
              ))
          .toList(),
      onReorder: (oldIndex, newIndex) => reorderItems(oldIndex, newIndex),
    );
  }
}

class ReorderableCard extends StatelessWidget {
  const ReorderableCard({
    Key key,
    @required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4),
      child: ListTile(
        title: Text(item.name),
        leading: item.icon.isNotEmpty
            ? Image(
                image: MemoryImage(item.icon),
              )
            : CircleAvatar(),
        trailing: Icon(Icons.drag_handle),
      ),
    );
  }
}
