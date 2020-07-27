import 'package:elder_launcher/constants/edit_mode.dart';
import 'package:elder_launcher/constants/route_names.dart';
import 'package:elder_launcher/generated/l10n.dart';
import 'package:elder_launcher/ui/theme.dart';
import 'package:flutter/cupertino.dart';

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
                isDefaultAction: true,
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
                isDefaultAction: true,
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
