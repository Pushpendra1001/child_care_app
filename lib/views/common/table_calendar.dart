import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class my_table_calendar extends StatefulWidget {
  my_table_calendar({super.key, required this.header});

  bool header;

  @override
  State<my_table_calendar> createState() => _my_table_calendarState();
}

var _calendarFormat = CalendarFormat.month;
final _focusedDay = DateTime.now();
DateTime _selectedDay = DateTime.now();
var today = DateTime.now();

late Set<DateTime> _selectedDates;

@override
class _my_table_calendarState extends State<my_table_calendar> {
  @override
  void initState() {
    super.initState();

    _selectedDates = {};
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarStyle: const CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
      ),
      calendarFormat: _calendarFormat,
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
        CalendarFormat.week: 'Week',
      },
      onFormatChanged: (format) {
        setState(() {
          _calendarFormat = format;
        });
      },
      focusedDay: today,
      headerVisible: widget.header,
      headerStyle: const HeaderStyle(
        leftChevronIcon: Center(
          child: Icon(
            Icons.arrow_back_ios,
            size: 15,
            color: Colors.blue,
          ),
        ),
        rightChevronIcon: Center(
          child: Icon(
            Icons.arrow_forward_ios,
            size: 15,
            color: Colors.blue,
          ),
        ),
        formatButtonVisible: false,
        titleCentered: true,
        headerMargin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      ),
      availableGestures: AvailableGestures.all,
      selectedDayPredicate: (day) {
        return _selectedDates.contains(day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (selectedDay.isBefore(DateTime.now())) return;
        setState(() {
          final isSelected = _selectedDates.contains(selectedDay);
          if (isSelected) {
            _selectedDates.remove(selectedDay);
          } else {
            _selectedDates.add(selectedDay);
          }
        });
      },
      firstDay: DateTime.utc(2024, 1, 1),
      lastDay: DateTime.utc(2030, 3, 14),
    );
  }
}
