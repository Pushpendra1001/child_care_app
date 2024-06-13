import 'package:flutter/material.dart';

class DayOption extends StatefulWidget {
  final String day;

  const DayOption({Key? key, required this.day}) : super(key: key);

  @override
  _DayOptionState createState() => _DayOptionState();
}

class _DayOptionState extends State<DayOption> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              setState(() {
                isSelected = !isSelected;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color:
                      isSelected ? const Color(0xffa1a1e9) : Colors.transparent,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Container(
                    child: Text(
                      widget.day,
                      style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
