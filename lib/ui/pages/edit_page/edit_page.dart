import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/edit_mode.dart';
import '../../../generated/l10n.dart';
import '../../../models/app_model.dart';
import '../../../models/contact_model.dart';
import '../../../models/edit_model.dart';
import '../../../models/item.dart';
import '../../../ui/common/buttons.dart';
import '../../../ui/common/info_action_widget.dart';
import '../../../ui/pages/edit_page/multi_select_widget.dart';
import '../../../ui/theme.dart';

class EditPage extends StatelessWidget {
  final EditMode editMode;

  const EditPage(this.editMode);

  @override
  Widget build(BuildContext context) {
    List<Item> allItems;
    List<Item> favItems;

    if (editMode == EditMode.apps) {
      allItems = Provider.of<AppModel>(context).allApps;
      favItems = Provider.of<AppModel>(context).favApps;
    } else {
      allItems = Provider.of<ContactModel>(context).allContacts;
      favItems = Provider.of<ContactModel>(context).favContacts;
    }

    void backToHome() {
      Navigator.pop(context);
    }

    void saveFavItems(List<String> newFavItems) {
      if (editMode == EditMode.apps) {
        Provider.of<AppModel>(context, listen: false).saveFavApps(newFavItems);
      } else {
        Provider.of<ContactModel>(context, listen: false)
            .saveFavContacts(newFavItems);
      }
    }

    return ChangeNotifierProvider(
      create: (_) => EditModel(favItems: favItems, allItems: allItems),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Flexible(
                child: Consumer<EditModel>(
                  builder: (_, editModel, __) => Column(
                    children: <Widget>[
                      if (editModel.sortedItems.isNotEmpty) ...[
                        Expanded(
                          child: MultiSelectWidget(editModel,
                              showId:
                                  editMode == EditMode.contacts ? true : false),
                        ),
                      ] else ...[
                        InfoActionWidget.close(
                          message: S.of(context).msgNoData,
                          buttonLabel: S.of(context).btnBackToHome,
                          buttonOnClickAction: backToHome,
                        )
                      ]
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: PrimaryButton(S.of(context).btnBackToHome, backToHome),
              ),
            ],
          ),
        ),
        floatingActionButton: Consumer<EditModel>(
          builder: (context, editModel, _) {
            if (editModel.isListModified) {
              return Padding(
                padding: EdgeInsets.only(bottom: Values.fabSafeBottomPadding),
                child: FloatingActionButton.extended(
                  icon: Icon(Icons.save),
                  label: Text('Save'),
                  onPressed: () {
                    saveFavItems(editModel.getFavIds());
                    Navigator.pop(context);
                  },
                ),
              );
            } else {
              return Container(height: 0, width: 0);
            }
          },
        ),
      ),
    );
  }
}
