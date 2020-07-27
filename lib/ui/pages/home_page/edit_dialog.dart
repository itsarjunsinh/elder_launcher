import 'package:elder_launcher/constants/edit_mode.dart';
import 'package:elder_launcher/constants/route_names.dart';
import 'package:elder_launcher/generated/l10n.dart';
import 'package:elder_launcher/models/app_model.dart';
import 'package:elder_launcher/models/contact_model.dart';
import 'package:elder_launcher/ui/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

Future EditDialog(BuildContext context, EditMode editMode) {
  return showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
            title: Text(
              S.of(context).dlgEditTitle,
              style: TextStyles.dialogTitle,
            ),
            actions: [
              CupertinoActionSheetAction(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    editMode == EditMode.apps
                        ? S.of(context).dlgAppsAddRemove
                        : S.of(context).dlgContactsAddRemove,
                    style: TextStyles.dialogAction,
                  ),
                ),
                onPressed: () => {
                  Navigator.pop(context),
                  Navigator.pushNamed(context, EditPageRoute,
                      arguments: editMode)
                },
              ),
              CupertinoActionSheetAction(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    editMode == EditMode.apps
                        ? S.of(context).dlgAppsReorder
                        : S.of(context).dlgContactsReorder,
                    style: TextStyles.dialogAction,
                  ),
                ),
                onPressed: () => {
                  Navigator.pop(context),
                  Navigator.pushNamed(context, ReorderPageRoute,
                      arguments: editMode)
                },
              ),
              CupertinoActionSheetAction(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    editMode == EditMode.apps
                        ? S.of(context).dlgAppsReload
                        : S.of(context).dlgContactsReload,
                    style: TextStyles.dialogAction,
                  ),
                ),
                onPressed: () => {
                  editMode == EditMode.apps
                      ? Provider.of<AppModel>(context, listen: false)
                          .reloadLists()
                      : Provider.of<ContactModel>(context, listen: false)
                          .reloadLists()
                },
              ),
            ],
            cancelButton: Padding(
              padding: const EdgeInsets.all(4.0),
              child: CupertinoActionSheetAction(
                  child: Text(S.of(context).dlgCancel),
                  onPressed: () => {Navigator.pop(context)}),
            ),
          ));
}
