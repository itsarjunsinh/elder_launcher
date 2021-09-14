import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/custom_functions.dart';
import '../../../generated/l10n.dart';
import '../../../models/app_model.dart';
import '../../../models/item.dart';
import '../../../ui/common/loading_widget.dart';
import '../../../ui/theme.dart';
import '../../common/elder_page_scaffold.dart';

class AppDrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void launchApp(String packageName) {
      Provider.of<AppModel>(context, listen: false).launchApp(packageName);
      Navigator.pop(context);
    }

    return ElderPageScaffold(
      title: S.of(context).btnAllApps,
      body: Consumer<AppModel>(
        builder: (context, appService, _) => Column(
          children: <Widget>[
            if (appService.isAppListLoaded &&
                appService.allApps.isNotEmpty) ...[
              AppDrawer(appService.allApps, launchApp)
            ] else ...[
              LoadingWidget()
            ]
          ],
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  // Creates a vertical list of given apps and handles click events.
  const AppDrawer(
    this.allItems,
    this.itemOnClickAction, {
    Key? key,
  }) : super(key: key);

  final List<Item> allItems;
  final VoidStringFunction itemOnClickAction;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        itemCount: allItems.length,
        itemBuilder: (context, position) {
          var app = allItems[position];
          return ListTile(
            leading: app.icon?.isNotEmpty ?? false
                ? Image(
                    image: MemoryImage(app.icon!),
                  )
                : CircleAvatar(),
            title: Text(
              app.name,
              style: TextStyles.listTitle,
            ),
            onTap: () => itemOnClickAction(app.id),
          );
        },
        separatorBuilder: (_, __) {
          return Divider(
            thickness: Values.dividerThickness,
          );
        },
      ),
    );
  }
}
