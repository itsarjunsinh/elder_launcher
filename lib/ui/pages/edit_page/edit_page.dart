import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/edit_mode.dart';
import '../../../generated/l10n.dart';
import '../../../providers/app_provider.dart';
import '../../../providers/contact_provider.dart';
import '../../../models/edit_model.dart';
import '../../../models/item.dart';
import '../../../ui/common/info_action_widget.dart';
import '../../../ui/pages/edit_page/multi_select_widget.dart';
import '../../../ui/theme.dart';
import '../../common/elder_page_scaffold.dart';

class EditPage extends StatelessWidget {
  const EditPage(this.editMode, {Key? key}) : super(key: key);

  final EditMode editMode;

  @override
  Widget build(BuildContext context) {
    List<Item> allItems;
    List<Item> favItems;

    if (editMode == EditMode.apps) {
      allItems = context.read<AppProvider>().allApps;
      favItems = context.read<AppProvider>().favApps;
    } else {
      allItems = context.read<ContactProvider>().allContacts;
      favItems = context.read<ContactProvider>().favContacts;
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
      create: (_) => EditModel(favItems: favItems, allItems: allItems),
      child: ElderPageScaffold(
        title: editMode == EditMode.apps
            ? S.of(context).dlgAppsAddRemove
            : S.of(context).dlgContactsAddRemove,
        body: Consumer<EditModel>(builder: (_, editModel, __) {
          if (editModel.sortedItems.isNotEmpty) {
            return MultiSelectWidget(editModel,
                showId: editMode == EditMode.contacts);
          } else {
            return InfoActionWidget.close(
              message: S.of(context).msgNoData,
              buttonLabel: S.of(context).btnBackToHome,
              buttonOnClickAction: backToHome,
            );
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
