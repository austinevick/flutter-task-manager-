import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class AddNewCategoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await FlutterIconPicker.showIconPicker(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 190,
              width: 175,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(
                    10,
                  )),
            ),
            DottedBorder(
              dashPattern: [6, 4],
              strokeWidth: 2,
              radius: Radius.circular(15),
              color: Colors.white,
              child: Container(
                height: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text(
                      'Add new category',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                width: 130,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(
                      15,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
