import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_todo_app_ui/screens/input_screen.dart';
import 'package:flutter_todo_app_ui/widgets/card_list_desktop.dart';
import 'package:flutter_todo_app_ui/widgets/card_list_mobile.dart';
import 'package:flutter_todo_app_ui/widgets/responsive.dart';
import 'package:flutter_todo_app_ui/widgets/search_bar.dart';
import 'package:flutter_todo_app_ui/widgets/side_menu_list_tile.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CalendarController calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Responsive.isLargeScreen(context)
            ? Size(80, 80)
            : Size(
                0,
                0,
              ),
        child: Responsive(
          smallScreen: Container(),
          mediumScreen: Container(
            color: Colors.black,
            child: SearchBar(),
          ),
          largeScreen: Container(
            color: Colors.black,
            child: SearchBar(),
          ),
        ),
      ),
      body: Responsive(
        largeScreen: DesktopHomeScreen(),
        smallScreen: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Responsive(
              largeScreen: Container(),
              smallScreen: SearchBar(),
            ),
            Container(
                child: TableCalendar(calendarController: calendarController)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Categories'),
            ),
            Expanded(child: CardListMobile()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Today\'s Lists'),
            ),
            Card(
              elevation: 8,
              child: ListTile(
                subtitle: Text('2 Tasks'),
                title: Text('Sketching'),
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue),
                  child: Icon(
                    Icons.brush,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Responsive(
        largeScreen: Container(),
        smallScreen: FloatingActionButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => InputScreen())),
          shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class DesktopHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            child: SideMenuListTile(),
          ),
        ),
        Expanded(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Container(
                child: Bounce(
                    duration: Duration(seconds: 1),
                    onPressed: () {},
                    child: CardListDesktop())),
          ),
        )
      ],
    );
  }
}
