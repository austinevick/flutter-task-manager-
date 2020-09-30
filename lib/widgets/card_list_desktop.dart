import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_todo_app_ui/widgets/add_new_category_card.dart';
import 'package:flutter_todo_app_ui/widgets/translate_on_hover.dart';

import 'card_gradients.dart';

class CardListDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Welcome, Peter',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'How are you today?',
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Row(
            children: [
              Expanded(
                child: TranslateOnHover(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CardGradient(
                        taskLength: '1',
                        text: 'Game',
                        icon: Icons.gamepad,
                        colors: [Colors.purple[300], Colors.blue[500]],
                      )),
                ),
              ),
              Expanded(
                child: TranslateOnHover(
                  child: Padding(
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
                ),
              ),
              Expanded(
                child: TranslateOnHover(
                  child: Padding(
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
                ),
              ),
              Expanded(
                child: TranslateOnHover(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CardGradient(
                        ontap: () => print('hello'),
                        taskLength: '8',
                        text: 'Reading',
                        icon: Icons.book_sharp,
                        colors: [
                          Colors.purple,
                          Colors.black,
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: TranslateOnHover(child: AddNewCategoryCard()),
        ))
      ],
    );
  }
}
