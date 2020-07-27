import 'package:elder_launcher/constants/edit_mode.dart';
import 'package:elder_launcher/constants/route_names.dart';
import 'package:elder_launcher/models/contact_model.dart';
import 'package:elder_launcher/models/item.dart';
import 'package:elder_launcher/generated/l10n.dart';
import 'package:elder_launcher/ui/common/buttons.dart';
import 'package:elder_launcher/ui/common/loading_widget.dart';
import 'package:elder_launcher/ui/pages/home_page/call_dialog.dart';
import 'package:elder_launcher/ui/pages/home_page/fav_grid_view.dart';
import 'package:elder_launcher/ui/common/info_action_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactsTab extends StatelessWidget {
  const ContactsTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void openAllContacts() {
      Provider.of<ContactModel>(context, listen: false).launchContactsApp();
    }

    void openContactDialog(Item contact) {
      CallDialog(context, contact);
    }

    void openEditScreen() {
      Navigator.pushNamed(context, EditPageRoute, arguments: EditMode.contacts);
    }

    void requestContactsPermission() {
      Provider.of<ContactModel>(context, listen: false)
          .requestContactsPermission();
    }

    void requestPhonePermission() {
      Provider.of<ContactModel>(context, listen: false)
          .requestPhonePermission();
    }

    return Column(
      children: <Widget>[
        Flexible(
          child: Consumer<ContactModel>(
            builder: (_, contactModel, __) => Column(
              children: <Widget>[
                if (contactModel.isFavListLoaded &&
                    contactModel.favContacts.isNotEmpty &&
                    contactModel.isPhonePermissionChecked &&
                    contactModel.isPhonePermissionGranted) ...[
                  // Show Favourite Contacts
                  FavGridView(contactModel.favContacts, openContactDialog,
                      openEditScreen)
                ] else if (contactModel.isFavListLoaded &&
                    contactModel.favContacts.isNotEmpty &&
                    contactModel.isPhonePermissionChecked &&
                    !contactModel.isPhonePermissionGranted) ...[
                  // Show Favourite Contacts with Phone Permission Prompt
                  InfoActionWidget(
                      S.of(context).msgNoPhonePermission,
                      S.of(context).btnGrantPermission,
                      Icons.perm_contact_calendar,
                      requestPhonePermission),
                  FavGridView(contactModel.favContacts, openContactDialog,
                      openEditScreen)
                ] else if (contactModel.isFavListLoaded &&
                    contactModel.favContacts.isEmpty) ...[
                  // Show Add Favourites Prompt
                  Expanded(
                    child: InfoActionWidget.add(
                      message: S.of(context).msgNoFavourites,
                      buttonLabel: S.of(context).btnAddFavContacts,
                      buttonOnClickAction: openEditScreen,
                    ),
                  ),
                ] else if (contactModel.isContactsPermissionChecked &&
                    !contactModel.isContactsPermissionGranted) ...[
                  // Show Contacts Permission Prompt
                  Expanded(
                    child: InfoActionWidget(
                        S.of(context).msgNoContactsPermission,
                        S.of(context).btnGrantPermission,
                        Icons.perm_contact_calendar,
                        requestContactsPermission),
                  )
                ] else ...[
                  LoadingWidget(),
                ],
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: PrimaryButton(
            S.of(context).btnAllContacts,
            openAllContacts,
          ),
        ),
      ],
    );
  }
}
