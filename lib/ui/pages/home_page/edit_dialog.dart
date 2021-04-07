import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../constants/edit_mode.dart';
import '../../../constants/route_names.dart';
import '../../../generated/l10n.dart';
import '../../../models/app_model.dart';
import '../../../models/contact_model.dart';
import '../../../ui/theme.dart';

// ignore: non_constant_identifier_names
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
                  Navigator.pushNamed(context, editPageRoute,
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
                  Navigator.pushNamed(context, reorderPageRoute,
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
