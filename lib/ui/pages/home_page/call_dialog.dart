import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../generated/l10n.dart';
import '../../../models/contact_model.dart';
import '../../../models/item.dart';
import '../../../ui/theme.dart';
import '../../../utils/color_util.dart';

// ignore: non_constant_identifier_names
Future CallDialog(BuildContext context, Item contact) {
  return showCupertinoModalPopup(
    context: context,
    builder: (context) => CupertinoActionSheet(
      title: Text(
        contact.name,
        style: TextStyles.dialogTitle.copyWith(
          color: ColorUtil().colorOnPrimary(context),
        ),
      ),
      message: Text(
        contact.id,
        style: TextStyles.dialogSubtitle.copyWith(
          color: ColorUtil().colorOnPrimary(context),
        ),
      ),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () => {
            Navigator.pop(context),
            Provider.of<ContactModel>(context, listen: false)
                .callPhoneNumber(contact.id)
          },
          isDefaultAction: true,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                  child: Icon(
                    Icons.call,
                    color: Colors.green,
                    size: 30,
                  ),
                ),
                Text(
                  S.of(context).dlgCall,
                  style: TextStyles.dialogActionMain,
                ),
              ],
            ),
          ),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () => {Navigator.pop(context)},
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            S.of(context).dlgCancel,
          ),
        ),
      ),
    ),
  );
}
