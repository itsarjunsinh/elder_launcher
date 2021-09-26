import 'package:flutter/material.dart';
import '../../../models/edit_model.dart';
import '../../../ui/theme.dart';

class MultiSelectWidget extends StatelessWidget {
  final EditModel editModel;
  final bool showId;

  const MultiSelectWidget(this.editModel, {Key? key, required this.showId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _allItems = editModel.sortedItems;

    void toggleFav(int position) {
      editModel.toggleFav(position);
    }

    return ListView.separated(
      itemCount: _allItems.length,
      padding: const EdgeInsets.symmetric(vertical: 6),
      itemBuilder: (context, position) {
        var item = _allItems[position];
        var isFav = editModel.isFav(position);

        return CheckboxListTile(
          key: Key(item.id),
          title: Text(
            item.name,
            style: TextStyles.listTitle,
          ),
          subtitle: showId
              ? Text(
                  item.id,
                  style: TextStyles.listTitle,
                )
              : null,
          secondary: item.icon?.isNotEmpty ?? false
              ? Image(
                  image: MemoryImage(item.icon!),
                )
              : const CircleAvatar(),
          value: isFav,
          onChanged: (isChecked) {
            toggleFav(position);
          },
        );
      },
      separatorBuilder: (_, __) {
        return const Divider(
          thickness: Values.dividerThickness,
        );
      },
    );
  }
}
