import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/edit_mode.dart';
import '../../../constants/route_names.dart';
import '../../../generated/l10n.dart';
import '../../../models/app_model.dart';
import '../../../models/contact_model.dart';
import '../../../ui/theme.dart';
import '../../../utils/color_util.dart';

// ignore: non_constant_identifier_names
Future EditDialog(BuildContext context, EditMode editMode) {
  return showCupertinoModalPopup(
    context: context,
    builder: (context) => CupertinoActionSheet(
      title: Text(
        S.of(context).dlgEditTitle,
        style: TextStyles.dialogTitle.copyWith(
          color: ColorUtil().colorOnPrimary(context),
        ),
      ),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () => {
            Navigator.pop(context),
            Navigator.pushNamed(context, editPageRoute, arguments: editMode)
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              editMode == EditMode.apps
                  ? S.of(context).dlgAppsAddRemove
                  : S.of(context).dlgContactsAddRemove,
              style: TextStyles.dialogAction,
            ),
          ),
        ),
        CupertinoActionSheetAction(
          onPressed: () => {
            Navigator.pop(context),
            Navigator.pushNamed(context, reorderPageRoute, arguments: editMode)
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              editMode == EditMode.apps
                  ? S.of(context).dlgAppsReorder
                  : S.of(context).dlgContactsReorder,
              style: TextStyles.dialogAction,
            ),
          ),
        ),
        CupertinoActionSheetAction(
          onPressed: () => {
            Navigator.pop(context),
            if (editMode == EditMode.apps)
              {Provider.of<AppModel>(context, listen: false).reloadLists()}
            else
              {Provider.of<ContactModel>(context, listen: false).reloadLists()}
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              editMode == EditMode.apps
                  ? S.of(context).dlgAppsReload
                  : S.of(context).dlgContactsReload,
              style: TextStyles.dialogAction,
            ),
          ),
        ),
        CupertinoActionSheetAction(
          onPressed: () => {
            Navigator.pop(context),
            Navigator.pushNamed(context, settingsPageRoute)
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              S.of(context).dlgOpenSettings,
              style: TextStyles.dialogAction,
            ),
          ),
        ),
      ],
      cancelButton: Padding(
        padding: const EdgeInsets.all(4.0),
        child: CupertinoActionSheetAction(
          onPressed: () => {Navigator.pop(context)},
          child: Text(S.of(context).dlgCancel),
        ),
      ),
    ),
  );
}
