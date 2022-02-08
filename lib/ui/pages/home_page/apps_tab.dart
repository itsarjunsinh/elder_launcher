import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/edit_mode.dart';
import '../../../constants/route_names.dart';
import '../../../generated/l10n.dart';
import '../../../providers/app_provider.dart';
import '../../../models/item.dart';
import '../../../ui/common/buttons.dart';
import '../../../ui/common/info_action_widget.dart';
import '../../../ui/common/loading_widget.dart';
import '../../../ui/pages/home_page/fav_grid_view.dart';
import '../../common/action_panel.dart';

class AppsTab extends StatelessWidget {
  const AppsTab({
    Key? key,
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
      context.read<AppProvider>().launchApp(app.id);
    }

    void setDefaultLauncher() {
      context.read<AppProvider>().setDefaultLauncher();
    }

    return Column(children: <Widget>[
      Flexible(
        child: Consumer<AppProvider>(
          builder: (_, appProvider, __) => Column(
            children: <Widget>[
              if (appProvider.isFavListLoaded &&
                  appProvider.favApps.isNotEmpty &&
                  !appProvider.canSetDefaultLauncher) ...[
                // Show Favourite Apps
                FavGridView(appProvider.favApps, launchApp),
              ] else if (appProvider.isFavListLoaded &&
                  appProvider.favApps.isNotEmpty &&
                  appProvider.canSetDefaultLauncher) ...[
                // Show Favourite Apps with Set Default Launcher Prompt
                ActionPanel(
                  heading: S.of(context).btnSetDefaultLauncher,
                  body: InfoActionWidget(
                      S.of(context).msgNotDefaultLauncher,
                      S.of(context).btnSetDefaultLauncher,
                      Icons.home,
                      setDefaultLauncher),
                ),
                FavGridView(appProvider.favApps, launchApp)
              ] else if (appProvider.isFavListLoaded &&
                  appProvider.favApps.isEmpty) ...[
                // Show Add Favourites Prompt
                Expanded(
                  child: InfoActionWidget.add(
                    message: S.of(context).msgNoFavourites,
                    buttonLabel: S.of(context).btnAddFavApps,
                    buttonOnClickAction: openEditScreen,
                  ),
                ),
              ] else ...[
                const LoadingWidget()
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
