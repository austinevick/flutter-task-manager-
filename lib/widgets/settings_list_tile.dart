import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SettingsListTile extends StatefulWidget {
  @override
  _SettingsListTileState createState() => _SettingsListTileState();
}

class _SettingsListTileState extends State<SettingsListTile> {
  final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
  final hoverTransform = Matrix4.identity()..translate(0, -10, 0);
  bool _hovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedContainer(
          transform: _hovering ? hoverTransform : nonHoverTransform,
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
              gradient: _hovering
                  ? LinearGradient(colors: [
                      Colors.blueAccent,
                      Colors.indigo,
                    ])
                  : null,
              borderRadius: _hovering
                  ? BorderRadius.circular(
                      8,
                    )
                  : null),
          child: ListTile(
            leading: Icon(
              Icons.settings,
              color: _hovering ? Colors.white : Colors.black,
            ),
            title: Text(
              'Settings',
              style: TextStyle(color: _hovering ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}
