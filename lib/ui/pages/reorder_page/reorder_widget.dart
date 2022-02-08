import 'package:flutter/material.dart';
import '../../../models/item.dart';
import '../../../services/edit_service.dart';
import '../../../ui/theme.dart';

class ReorderWidget extends StatelessWidget {
  final EditService editService;
  final bool showId;

  const ReorderWidget(this.editService, {Key? key, required this.showId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _favItems = editService.sortedItems;

    void reorderItems(int oldIndex, int newIndex) {
      editService.reorderFavItems(oldIndex, newIndex);
    }

    return ReorderableListView(
      onReorder: reorderItems,
      padding: const EdgeInsets.all(6),
      children: _favItems
          .map((item) => ReorderableCard(
                item: item,
                key: Key(item.id),
              ))
          .toList(),
    );
  }
}

class ReorderableCard extends StatelessWidget {
  const ReorderableCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            item.name,
            style: TextStyles.listTitle,
          ),
          leading: item.icon?.isNotEmpty ?? false
              ? Image(
                  image: MemoryImage(item.icon!),
                )
              : const CircleAvatar(),
          trailing: const Icon(Icons.drag_handle),
        ),
      ),
    );
  }
}
