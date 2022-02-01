import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/edit_mode.dart';
import '../../../constants/route_names.dart';
import '../../../generated/l10n.dart';
import '../../../providers/contact_provider.dart';
import '../../../models/item.dart';
import '../../../ui/common/buttons.dart';
import '../../../ui/common/info_action_widget.dart';
import '../../../ui/common/loading_widget.dart';
import '../../../ui/pages/home_page/call_dialog.dart';
import '../../../ui/pages/home_page/fav_grid_view.dart';
import '../../common/action_panel.dart';

class ContactsTab extends StatelessWidget {
  const ContactsTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void openAllContacts() {
      context.read<ContactProvider>().launchContactsApp();
    }

    void openContactDialog(Item contact) {
      CallDialog(context, contact);
    }

    void openEditScreen() {
      Navigator.pushNamed(context, editPageRoute, arguments: EditMode.contacts);
    }

    void requestContactsPermission() {
      context.read<ContactProvider>().requestContactsPermission();
    }

    void requestPhonePermission() {
      context.read<ContactProvider>().requestPhonePermission();
    }

    return Column(
      children: <Widget>[
        Flexible(
          child: Consumer<ContactProvider>(
            builder: (_, contactProvider, __) => Column(
              children: <Widget>[
                if (contactProvider.isFavListLoaded &&
                    contactProvider.favContacts.isNotEmpty &&
                    contactProvider.isPhonePermissionChecked &&
                    contactProvider.isPhonePermissionGranted) ...[
                  // Show Favourite Contacts
                  FavGridView(contactProvider.favContacts, openContactDialog)
                ] else if (contactProvider.isFavListLoaded &&
                    contactProvider.favContacts.isNotEmpty &&
                    contactProvider.isPhonePermissionChecked &&
                    !contactProvider.isPhonePermissionGranted &&
                    contactProvider.isTelephoneFeatureChecked &&
                    contactProvider.hasTelephoneFeature) ...[
                  // Show Favourite Contacts with Phone Permission Prompt
                  ActionPanel(
                    heading: S.of(context).btnGrantPermission,
                    body: InfoActionWidget(
                        S.of(context).msgNoPhonePermission,
                        S.of(context).btnGrantPermission,
                        Icons.phone,
                        requestPhonePermission),
                  ),
                  FavGridView(contactProvider.favContacts, openContactDialog)
                ] else if (contactProvider.isFavListLoaded &&
                    contactProvider.favContacts.isEmpty) ...[
                  // Show Add Favourites Prompt
                  Expanded(
                    child: InfoActionWidget.add(
                      message: S.of(context).msgNoFavourites,
                      buttonLabel: S.of(context).btnAddFavContacts,
                      buttonOnClickAction: openEditScreen,
                    ),
                  ),
                ] else if (contactProvider.isContactsPermissionChecked &&
                    !contactProvider.isContactsPermissionGranted) ...[
                  // Show Contacts Permission Prompt
                  Expanded(
                    child: InfoActionWidget(
                        S.of(context).msgNoContactsPermission,
                        S.of(context).btnGrantPermission,
                        Icons.perm_contact_calendar,
                        requestContactsPermission),
                  )
                ] else ...[
                  const LoadingWidget(),
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
