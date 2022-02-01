import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/edit_mode.dart';
import '../../../generated/l10n.dart';
import '../../../providers/app_provider.dart';
import '../../../providers/contact_provider.dart';
import '../../../models/edit_model.dart';
import '../../../models/item.dart';
import '../../../ui/common/info_action_widget.dart';
import '../../../ui/pages/reorder_page/reorder_widget.dart';
import '../../../ui/theme.dart';
import '../../common/elder_page_scaffold.dart';

class ReorderPage extends StatelessWidget {
  const ReorderPage(this.editMode, {Key? key}) : super(key: key);

  final EditMode editMode;

  @override
  Widget build(BuildContext context) {
    var _favItems = <Item>[];

    if (editMode == EditMode.apps) {
      _favItems = context.read<AppProvider>().favApps;
    } else {
      _favItems = context.read<ContactProvider>().favContacts;
    }

    void backToHome() {
      Navigator.pop(context);
    }

    void saveFavItems(List<String> newFavItems) {
      if (editMode == EditMode.apps) {
        context.read<AppProvider>().saveFavApps(newFavItems);
      } else {
        context.read<ContactProvider>().saveFavContacts(newFavItems);
      }
    }

    return ChangeNotifierProvider(
      create: (_) => EditModel(favItems: _favItems),
      child: ElderPageScaffold(
        title: editMode == EditMode.apps
            ? S.of(context).dlgAppsReorder
            : S.of(context).dlgContactsReorder,
        body: Consumer<EditModel>(builder: (_, editModel, __) {
          if (editModel.sortedItems.isNotEmpty) {
            return ReorderWidget(editModel,
                showId: editMode == EditMode.contacts ? true : false);
          } else {
            return InfoActionWidget.close(
                message: S.of(context).msgNoData,
                buttonLabel: S.of(context).btnBackToHome,
                buttonOnClickAction: backToHome);
          }
        }),
        floatingActionButton: Consumer<EditModel>(
          builder: (context, editModel, _) {
            if (editModel.isListModified) {
              return Padding(
                padding:
                    const EdgeInsets.only(bottom: Values.fabSafeBottomPadding),
                child: FloatingActionButton.extended(
                  icon: const Icon(Icons.save),
                  label: const Text('Save'),
                  onPressed: () {
                    saveFavItems(editModel.getFavIds());
                    Navigator.pop(context);
                  },
                ),
              );
            } else {
              return const SizedBox(height: 0, width: 0);
            }
          },
        ),
      ),
    );
  }
}
