import 'package:child_care/views/common/student_detail_card.dart';
import 'package:child_care/views/common/student_list_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendencePage extends StatefulWidget {
  const AttendencePage({super.key});

  @override
  State<AttendencePage> createState() => _AttendencePageState();
}

var today = DateTime.now();

class _AttendencePageState extends State<AttendencePage> {
  List<TimeRange> timeRanges = [];
  TimeOfDay? _checkInTime;
  TimeOfDay? _checkOutTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendence"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: _showTimeRangeDialog, icon: Icon(Icons.add))
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 120,
              child: student_detail_card(
                student_name: "Anmol",
                father_name: "Ved Prakash",
                stu_class: "LKG GRADE 1",
                stu_img: "",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TableCalendar(
              calendarFormat: CalendarFormat.month,
              focusedDay: today,
              headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  headerMargin:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  today = focusedDay;
                });
              },
              firstDay: DateTime.utc(2024, 1, 1),
              lastDay: DateTime.utc(2030, 3, 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                attendence_button(btn_color: Colors.yellow, txt: "Early"),
                attendence_button(btn_color: Colors.green, txt: "On-time"),
                attendence_button(btn_color: Colors.red, txt: "Late"),
                attendence_button(btn_color: Colors.black, txt: "Absent"),
                attendence_button(btn_color: Colors.black, txt: "Holiday"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Text(
              "Full Details of the day",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: timeRanges.length,
              itemBuilder: (context, index) {
                final timeRange = timeRanges[index];
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          child: Text("Child Timing"),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Check-in"),
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                            "${timeRange.checkInTime!.format(context)}"),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Text("On Time"),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Check-Out"),
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                            "${timeRange.checkOutTime!.format(context)}"),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Text("On Time"),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showTimeRangeDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Check-in'),
                InkWell(
                  onTap: () => _showTimePicker(context, isCheckIn: true)
                      .then((value) => setState(() {
                            _checkInTime = value;
                          })),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      _checkInTime != null
                          ? _checkInTime!.format(context)
                          : 'Select Time',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Check-out'),
                InkWell(
                  onTap: () {
                    _showTimePicker(context, isCheckIn: false).then(
                      (value) => setState(() {
                        _checkOutTime = value;
                      }),
                    );

                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      _checkOutTime != null
                          ? _checkOutTime!.format(context)
                          : 'Select Time',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 53, 52, 52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_checkInTime != null && _checkOutTime != null) {
                final timeRange = TimeRange(
                  checkInTime: _checkInTime!,
                  checkOutTime: _checkOutTime!,
                );
                setState(() {
                  timeRanges.add(timeRange);
                  _checkInTime = null;
                  _checkOutTime = null;
                });
              }
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff5FE6F9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Future<TimeOfDay?> _showTimePicker(BuildContext context,
      {required bool isCheckIn}) async {
    final initialTime = isCheckIn ? _checkInTime : _checkOutTime;
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
    );

    return pickedTime;
  }
}

class attendence_button extends StatefulWidget {
  attendence_button({
    super.key,
    required this.txt,
    required this.btn_color,
  });

  String txt;
  Color btn_color;

  @override
  State<attendence_button> createState() => _attendence_buttonState();
}

class _attendence_buttonState extends State<attendence_button> {
  bool counter = false;
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 50,
          height: 50,
          child: TextButton(
            onPressed: () {
              setState(() {
                counter = !counter;

                if (counter == true) {
                  value += 1;
                } else {
                  value -= 1;
                }
              });
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: widget.btn_color),
                ),
              ),
            ),
            child: Text(value.toString()),
          ),
        ),
        Text(widget.txt),
      ],
    );
  }
}

class TimeRange {
  final TimeOfDay checkInTime;
  final TimeOfDay checkOutTime;

  TimeRange({required this.checkInTime, required this.checkOutTime});
}
