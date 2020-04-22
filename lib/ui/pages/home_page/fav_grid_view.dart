import 'package:auto_size_text/auto_size_text.dart';
import 'package:elder_launcher/constants/custom_functions.dart';
import 'package:elder_launcher/models/item.dart';
import 'package:elder_launcher/ui/theme.dart';
import 'package:flutter/material.dart';

class FavGridView extends StatelessWidget {
  final List<Item> favItems;
  final VoidItemFunction itemOnClickAction;
  final VoidFunction openEditScreenFunction;

  const FavGridView(
    this.favItems,
    this.itemOnClickAction,
    this.openEditScreenFunction, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AutoSizeGroup itemName = AutoSizeGroup();

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
        child: GridView.count(
          childAspectRatio: 1.25,
          crossAxisCount: 2,
          children: favItems.map((item) {
            return Card(
              elevation: 4,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(50),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (item.icon.isNotEmpty) ...[
                      Image(
                        height: 70,
                        image: MemoryImage(item.icon),
                      ),
                    ],
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
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
                onTap: () => itemOnClickAction(item),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
