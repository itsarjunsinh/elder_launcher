import 'package:elder_launcher/models/contact_model.dart';
import 'package:elder_launcher/models/item.dart';
import 'package:elder_launcher/generated/l10n.dart';
import 'package:elder_launcher/ui/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

Future CallDialog(BuildContext context, Item contact) {
  return showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
            title: Text(
              contact.name,
              style: TextStyles.dialogTitle,
            ),
            actions: [
              CupertinoActionSheetAction(
                child: Text(S.of(context).dlgCall),
                onPressed: () => {
                  Navigator.pop(context),
                  Provider.of<ContactModel>(context, listen: false)
                      .callPhoneNumber(contact.id)
                },
                isDefaultAction: true,
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
                child: Text(S.of(context).dlgCancel),
                onPressed: () => {Navigator.pop(context)}),
          ));
}
