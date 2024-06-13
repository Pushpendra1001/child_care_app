import 'package:flutter/material.dart';

class chipbtn extends StatelessWidget {
  chipbtn({super.key, required this.txt, required this.color});

  String txt;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        txt,
        style: TextStyle(color: color),
      ),
      // backgroundColor: _getBackgroundColor(_leaves[index].status),
      side: BorderSide(color: color),
    );
  }
}
