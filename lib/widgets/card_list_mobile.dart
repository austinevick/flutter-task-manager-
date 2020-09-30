import 'package:flutter/material.dart';
import 'package:flutter_todo_app_ui/widgets/card_gradients.dart';

class CardListMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardGradient(
                taskLength: '1',
                text: 'Game',
                icon: Icons.gamepad,
                colors: [Colors.purple[300], Colors.blue[500]],
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardGradient(
                taskLength: '5',
                text: 'Meeeting',
                icon: Icons.people,
                colors: [
                  Colors.pink[300],
                  Colors.yellow[500],
                ],
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardGradient(
                taskLength: '4',
                text: 'Design',
                icon: Icons.design_services,
                colors: [
                  Color(0xff000044),
                  Colors.orangeAccent[200],
                ],
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardGradient(
                taskLength: '8',
                text: 'Reading',
                icon: Icons.book_sharp,
                colors: [
                  Colors.purple,
                  Colors.black,
                ],
              )),
        ]);
  }
}
