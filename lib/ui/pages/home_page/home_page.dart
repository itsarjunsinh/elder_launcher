import 'package:auto_size_text/auto_size_text.dart';
import 'package:elder_launcher/constants/edit_mode.dart';
import 'package:elder_launcher/models/date_time_model.dart';
import 'package:elder_launcher/generated/l10n.dart';
import 'package:elder_launcher/ui/pages/home_page/apps_tab.dart';
import 'package:elder_launcher/ui/pages/home_page/contacts_tab.dart';
import 'package:elder_launcher/ui/pages/home_page/edit_dialog.dart';
import 'package:elder_launcher/ui/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AutoSizeGroup _appBarTextSizeGroup = AutoSizeGroup();

    void openEditDialog(int tabIndex) {
      EditMode editMode;

      if (tabIndex == 0) {
        editMode = EditMode.apps;
      } else {
        editMode = EditMode.contacts;
      }

      EditDialog(context, editMode);
    }

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: ChangeNotifierProvider(
        create: (_) =>
            DateTimeModel(MediaQuery.of(context).alwaysUse24HourFormat),
        child: Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () =>
                        openEditDialog(DefaultTabController.of(context).index),
                  ),
                ),
              ],
              centerTitle: true,
              title: Consumer<DateTimeModel>(
                builder: (_, dateTimeModel, __) => AutoSizeText(
                  dateTimeModel.time,
                  maxLines: 1,
                  style: TextStyles.headerTime,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size(0, 80),
                child: Column(
                  children: <Widget>[
                    Consumer<DateTimeModel>(
                      builder: (_, dateTimeModel, __) => AutoSizeText(
                        dateTimeModel.date,
                        group: _appBarTextSizeGroup,
                        maxLines: 1,
                        style: TextStyles.headerDate,
                      ),
                    ),
                    TabBar(tabs: [
                      Tab(
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(Icons.apps),
                              ),
                              AutoSizeText(
                                S.of(context).Apps,
                                group: _appBarTextSizeGroup,
                                maxLines: 1,
                                style: TextStyle(fontSize: 50),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Tab(
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(Icons.contacts),
                              ),
                              Expanded(
                                child: AutoSizeText(
                                  S.of(context).Contacts,
                                  group: _appBarTextSizeGroup,
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 50),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
            body: TabBarView(children: <Widget>[AppsTab(), ContactsTab()])),
      ),
    );
  }
}
