import 'package:elder_launcher/constants/edit_mode.dart';
import 'package:elder_launcher/constants/route_names.dart';
import 'package:elder_launcher/models/app_model.dart';
import 'package:elder_launcher/models/item.dart';
import 'package:elder_launcher/generated/l10n.dart';
import 'package:elder_launcher/ui/common/buttons.dart';
import 'package:elder_launcher/ui/common/loading_widget.dart';
import 'package:elder_launcher/ui/pages/home_page/fav_grid_view.dart';
import 'package:elder_launcher/ui/common/info_action_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppsTab extends StatelessWidget {
  const AppsTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void openAllApps() {
      Navigator.pushNamed(context, AppDrawerRoute);
    }

    void openEditScreen() {
      Navigator.pushNamed(context, EditPageRoute,
          arguments: EditMode.apps);
    }

    void launchApp(Item app) {
      Provider.of<AppModel>(context, listen: false).launchApp(app.id);
    }

    return Column(children: <Widget>[
      Flexible(
        child: Consumer<AppModel>(
          builder: (_, appModel, __) => Column(
            children: <Widget>[
              if (appModel.isFavListLoaded && appModel.favApps.isNotEmpty) ...[
                FavGridView(appModel.favApps, launchApp, openEditScreen),
              ] else if (appModel.isFavListLoaded &&
                  appModel.favApps.isEmpty) ...[
                InfoActionWidget.add(
                  message: S.of(context).msgNoFavourites,
                  buttonLabel: S.of(context).btnAddFavApps,
                  buttonOnClickAction: openEditScreen,
                ),
              ] else ...[
                LoadingWidget()
              ],
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: PrimaryButton(
            S.of(context).btnAllApps, openAllApps),
      ),
    ]);
  }
}
