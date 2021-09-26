import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../constants/custom_functions.dart';
import '../../../models/item.dart';
import '../../../ui/theme.dart';

class FavGridView extends StatelessWidget {
  final List<Item> favItems;
  final VoidItemFunction itemOnClickAction;

  const FavGridView(
    this.favItems,
    this.itemOnClickAction, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemName = AutoSizeGroup();

    return Expanded(
      child: GridView.count(
        childAspectRatio: 1.25,
        crossAxisCount: 2,
        padding: const EdgeInsets.all(6),
        children: favItems.map((item) {
          return FavItemCard(
              item: item,
              itemOnClickAction: itemOnClickAction,
              itemName: itemName);
        }).toList(),
      ),
    );
  }
}

class FavItemCard extends StatelessWidget {
  const FavItemCard({
    Key? key,
    required this.item,
    required this.itemOnClickAction,
    required this.itemName,
  }) : super(key: key);

  final Item item;
  final VoidItemFunction itemOnClickAction;
  final AutoSizeGroup itemName;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      elevation: 4,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(50),
        onTap: () => itemOnClickAction(item),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (item.icon?.isNotEmpty ?? false) ...[
              Image(
                height: 70,
                image: MemoryImage(item.icon!),
              ),
            ],
            Flexible(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                child: AutoSizeText(
                  item.name,
                  group: itemName,
                  maxLines: 2,
                  style: TextStyles.cardTitle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
