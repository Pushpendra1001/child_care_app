import 'package:child_care/views/common/student_list_card.dart';
import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter/material.dart';

class studentAttendence extends StatelessWidget {
  const studentAttendence({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Attendence"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(21, 45, 161, 0.68),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              height: MediaQuery.of(context).size.height / 6,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Flexible(
                      child: Image.asset(
                        "assets/images/attendace.png",
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mark the Attendance",
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        Text(
                          "Empoweing Education ,One ",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Attendance at a Time.",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Student Name",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return student_list_item(
                    box_color: Colors.blue.shade400,
                    student_name: "Anmol Upadhya",
                    father_name: "Ved Prakash",
                    stu_class: "LKG GRADE 1",
                    stu_img: "",
                    gradient: false,
                    attendence_circle: true,
                    btn_text: "Mark the attendence",
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
