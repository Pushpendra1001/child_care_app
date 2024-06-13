import 'package:child_care/views/common/chip_button.dart';
import 'package:child_care/views/screens/callender_attendence.dart';
import 'package:child_care/views/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class StudentUpdates extends StatefulWidget {
  const StudentUpdates({super.key});

  @override
  _StudentUpdatesState createState() => _StudentUpdatesState();
}

class _StudentUpdatesState extends State<StudentUpdates> {
  var _calendarFormat = CalendarFormat.month;
  final _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Updates"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TableCalendar(
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
              headerVisible: false,
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
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1523205565295-f8e91625443b?q=80&w=1365&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Anmol Upadhyay",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 8),
                        Text("LK.G."),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        "Clocked-in",
                        style: TextStyle(color: Colors.green, fontSize: 18),
                      ),
                      const SizedBox(width: 30),
                      chipbtn(
                        txt: "09:00 AM",
                        color: Colors.green,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_back,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 20),
                      const Text("Clocked-Out",
                          style: TextStyle(color: Colors.red, fontSize: 18)),
                      const SizedBox(width: 16),
                      chipbtn(
                        txt: "05:00 PM",
                        color: Colors.red,
                      )
                    ],
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Expanded(
                  child: Card(
                    color: Colors.white,
                    margin: const EdgeInsets.all(8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left side: Circle Avatar
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1523205565295-f8e91625443b?q=80&w=1365&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                            ),
                          ),
                        ),
                        // Right side: Post content
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const ListTile(
                                title: Text("Naman kumar"),
                                subtitle: Text("2 hours ago"),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8),
                                child: Text("Playing with water together"),
                              ),
                              Container(
                                height: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: const DecorationImage(
                                    image: NetworkImage(
                                      "https://images.unsplash.com/photo-1523205565295-f8e91625443b?q=80&w=1365&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    color: liked ? Colors.red : Colors.grey,
                                    icon: Icon(Icons.favorite,
                                        color:
                                            liked ? Colors.red : Colors.grey),
                                    onPressed: () {
                                      setState(() {
                                        liked = !liked;
                                        print(liked);
                                      });
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.comment),
                                    onPressed: () {},
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    icon: const Icon(Icons.share),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                child: liked
                                    ? const Text(
                                        "Liked",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    : null,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
