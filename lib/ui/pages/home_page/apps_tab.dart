import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/edit_mode.dart';
import '../../../constants/route_names.dart';
import '../../../generated/l10n.dart';
import '../../../models/app_model.dart';
import '../../../models/item.dart';
import '../../../ui/common/buttons.dart';
import '../../../ui/common/info_action_widget.dart';
import '../../../ui/common/loading_widget.dart';
import '../../../ui/pages/home_page/fav_grid_view.dart';

class AppsTab extends StatelessWidget {
  const AppsTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void openAllApps() {
      Navigator.pushNamed(context, appDrawerRoute);
    }

    void openEditScreen() {
      Navigator.pushNamed(context, editPageRoute, arguments: EditMode.apps);
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
                Expanded(
                  child: InfoActionWidget.add(
                    message: S.of(context).msgNoFavourites,
                    buttonLabel: S.of(context).btnAddFavApps,
                    buttonOnClickAction: openEditScreen,
                  ),
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
        child: PrimaryButton(S.of(context).btnAllApps, openAllApps),
      ),
    ]);
  }
}
