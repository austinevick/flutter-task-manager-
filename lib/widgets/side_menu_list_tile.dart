import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_todo_app_ui/widgets/settings_list_tile.dart';
import 'package:table_calendar/table_calendar.dart';

import 'custom_list_tile.dart';

class SideMenuListTile extends StatefulWidget {
  @override
  _SideMenuListTileState createState() => _SideMenuListTileState();
}

class _SideMenuListTileState extends State<SideMenuListTile> {
  CalendarController calendarController = CalendarController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.purple),
                accountName: Text('Victor Augustine'),
                currentAccountPicture: CircleAvatar(
                  child: Icon(
                    Icons.person,
                    size: 32,
                  ),
                ),
                accountEmail: Text('austine@gmail.com')),
          ),
          CustomListTile(
            title: 'Home',
            icon: Icons.home,
          ),
          CustomListTile(
            title: 'Meetings',
            icon: Icons.people,
          ),
          CustomListTile(
            title: 'Design',
            icon: Icons.design_services,
          ),
          CustomListTile(
            title: 'Gaming',
            icon: Icons.gamepad,
          ),
          CustomListTile(
            title: 'Reading',
            icon: Icons.book,
          ),
          Container(
            child: TableCalendar(
              calendarController: calendarController,
            ),
          ),
          SettingsListTile()
        ],
      ),
    );
  }
}
