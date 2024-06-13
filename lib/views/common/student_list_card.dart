import 'package:child_care/views/screens/callender_attendence.dart';
import 'package:child_care/views/screens/child_today_update_page.dart';
import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter/material.dart';

class student_list_item extends StatelessWidget {
  student_list_item(
      {super.key,
      required this.student_name,
      required this.father_name,
      required this.stu_class,
      required this.attendence_circle,
      required this.box_color,
      required this.btn_text,
      required this.gradient,
      required this.stu_img});

  String student_name;
  String father_name;
  String stu_class;
  String stu_img;
  String btn_text;
  bool attendence_circle;
  Color box_color;
  bool gradient;

  @override
  Widget build(BuildContext context) {
    var phoneHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
          gradient: gradient
              ? const LinearGradient(
                  begin: Alignment(-1.0, 0.5), // Start from the left edge
                  end: Alignment(1.0, -0.5), // End at the right edge
                  colors: [
                    Color(0xFF797979),
                    Color(0xFF6363DB),
                  ],
                  stops: [0.0101, 0.7736],
                )
              : null,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, 2),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: ListTile(
                  title: Text(student_name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        stu_class,
                        style: const TextStyle(fontSize: 12),
                      ),
                      Text(
                        "Father's Name : $father_name",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ],
                  ),
                  leading: const CircleAvatar(
                      radius: 32,
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bW9kZWx8ZW58MHx8MHx8fDA%3D")),
                  trailing: attendence_circle
                      ? CircleProgressBar(
                          foregroundColor: Colors.blue,
                          backgroundColor: Colors.grey.shade500,
                          value: 0.75,
                          child: const Center(
                            child: Text("75%"),
                          ),
                        )
                      : null,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 230,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const StudentUpdates(),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(btn_text),
                            const Spacer(),
                            const Icon(Icons.arrow_forward)
                          ],
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
