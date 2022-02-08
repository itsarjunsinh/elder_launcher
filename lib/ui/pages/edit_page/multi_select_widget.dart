import 'package:flutter/material.dart';
import '../../../services/edit_service.dart';
import '../../../ui/theme.dart';

class MultiSelectWidget extends StatelessWidget {
  final EditService editService;
  final bool showId;

  const MultiSelectWidget(this.editService, {Key? key, required this.showId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _allItems = editService.sortedItems;

    void toggleFav(int position) {
      editService.toggleFav(position);
    }

    return ListView.separated(
      itemCount: _allItems.length,
      padding: const EdgeInsets.symmetric(vertical: 6),
      itemBuilder: (context, position) {
        var item = _allItems[position];
        var isFav = editService.isFav(position);

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
