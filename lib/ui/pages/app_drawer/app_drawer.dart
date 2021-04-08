import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/custom_functions.dart';
import '../../../generated/l10n.dart';
import '../../../models/app_model.dart';
import '../../../models/item.dart';
import '../../../ui/common/buttons.dart';
import '../../../ui/common/loading_widget.dart';
import '../../../ui/theme.dart';

class AppDrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void backToHome() {
      Navigator.pop(context);
    }

    void launchApp(String packageName) {
      Provider.of<AppModel>(context, listen: false).launchApp(packageName);
      Navigator.pop(context);
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Flexible(
              child: Consumer<AppModel>(
                  builder: (context, appService, _) => Column(
                        children: <Widget>[
                          if (appService.isAppListLoaded &&
                              appService.allApps.isNotEmpty) ...[
                            AppDrawer(appService.allApps, launchApp)
                          ] else ...[
                            LoadingWidget()
                          ]
                        ],
                      )),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: PrimaryButton(S.of(context).btnBackToHome, backToHome),
            ),
          ],
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  final List<Item> allItems;
  final VoidStringFunction itemOnClickAction;

  const AppDrawer(
    this.allItems,
    this.itemOnClickAction, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        itemCount: allItems.length,
        itemBuilder: (context, position) {
          var app = allItems[position];
          return ListTile(
            leading: app.icon != null
                ? Image(
                    image: MemoryImage(app.icon),
                  )
                : null,
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
