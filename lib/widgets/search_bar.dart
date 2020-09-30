import 'package:flutter/material.dart';
import 'package:flutter_todo_app_ui/widgets/responsive.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Center(
        child: Container(
          width: 400,
          decoration: BoxDecoration(
              color: const Color(0xff251f46),
              borderRadius: BorderRadius.circular(
                50,
              )),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: TextField(
              controller: textController,
              style: const TextStyle(fontSize: 22, color: Colors.white),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: 22, color: Colors.grey),
                enabledBorder: InputBorder.none,
                suffixIcon: textController.text.isEmpty
                    ? Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            50,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.red,
                          ),
                        ))
                    : IconButton(
                        icon: Icon(
                          Icons.clear,
                          size: 30,
                          color: Colors.red,
                        ),
                        onPressed: () {}),
                hintText: 'Search',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
