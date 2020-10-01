import 'package:flutter/material.dart';
import 'package:flutter_todo_app_ui/widgets/custom_button.dart';
import 'package:table_calendar/table_calendar.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final CalendarController calendarController = CalendarController();

  TimeOfDay time = TimeOfDay.now();
  pickTime() async {
    TimeOfDay timeOfDay = await showTimePicker(
      initialTime: time,
      context: context,
    );
    if (timeOfDay != null) {
      setState(() {
        time = timeOfDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        centerTitle: true,
        title: Text('Add New'),
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                  ),
                  Text('Back',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
                child: TableCalendar(
              calendarController: calendarController,
            )),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Input time'),
                      Spacer(),
                      GestureDetector(
                        onTap: () => pickTime(),
                        child: Card(
                          elevation: 5,
                          child: Container(
                            height: 25,
                            child: Text(
                              '${time.format(context)}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                      ),
                    ])),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Select category'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 6,
                child: DropdownButtonFormField(
                  value: 'Reading',
                  items: [DropdownMenuItem(child: Text('data'))],
                  onChanged: (val) {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Description'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  elevation: 6,
                  child: TextField(
                    maxLines: null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  )),
            ),
            CustomButton()
          ],
        ),
      ),
    );
  }
}
