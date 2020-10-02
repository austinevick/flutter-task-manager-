import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;

  const CustomTextfield({Key key, this.hintText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
      child: Container(
        padding: EdgeInsets.all(8),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
