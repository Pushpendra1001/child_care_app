import 'package:child_care/views/common/history_listview.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LeaveRequestPage extends StatefulWidget {
  const LeaveRequestPage({super.key});

  @override
  _LeaveRequestPageState createState() => _LeaveRequestPageState();
}

class _LeaveRequestPageState extends State<LeaveRequestPage> {
  String _leaveType = "Medical leave";
  DateTime _fromDate = DateTime(2024, 01, 30);
  DateTime _toDate = DateTime(2024, 02, 03);

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Leave Request",
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Type of leave",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: [
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.all(12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  value: _leaveType,
                  onChanged: (value) {
                    setState(() {
                      _leaveType = value!;
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                      value: "",
                      child: Text("Select Type of leave"),
                    ),
                    DropdownMenuItem(
                      value: "Medical leave",
                      child: Text("Medical leave"),
                    ),
                    DropdownMenuItem(
                      value: "Casual",
                      child: Text("Casual"),
                    ),
                    DropdownMenuItem(
                      value: "Vocation",
                      child: Text("Vocation"),
                    ),

                    DropdownMenuItem(
                      value: "Travel",
                      child: Text("Travel"),
                    ),

                    DropdownMenuItem(
                      value: "Maternity",
                      child: Text("Maternity"),
                    ),

                    DropdownMenuItem(
                      value: "Others",
                      child: Text("Other"),
                    ),
                    // Add more leave types here
                  ],
                ),
                const SizedBox(width: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("From"),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                  DateFormat('dd MMM yyyy').format(_fromDate)),
                            ),
                            IconButton(
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: _fromDate,
                                  firstDate: DateTime(2022),
                                  lastDate: DateTime(2025),
                                ).then((value) {
                                  if (value != null) {
                                    setState(() {
                                      _fromDate = value;
                                    });
                                  }
                                });
                              },
                              icon: const Icon(Icons.calendar_today),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("To"),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child:
                                Text(DateFormat('dd MMM yyyy').format(_toDate)),
                          ),
                          IconButton(
                            onPressed: () {
                              showDatePicker(
                                context: context,
                                initialDate: _toDate,
                                firstDate: DateTime(2022),
                                lastDate: DateTime(2025),
                              ).then((value) {
                                if (value != null) {
                                  setState(() {
                                    _toDate = value;
                                  });
                                }
                              });
                            },
                            icon: const Icon(Icons.calendar_today),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: SizedBox(
                width: screenwidth * 0.5,
                height: screenwidth * 0.1,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your onPressed  here
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xff6363DB)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'Apply',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenwidth *
                          0.04, // Adjust text size based on screen width
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "History",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const Expanded(child: MedicalLeaveList()),
          ],
        ),
      ),
    );
  }
}
