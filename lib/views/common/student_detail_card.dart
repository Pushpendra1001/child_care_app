import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter/material.dart';

class student_detail_card extends StatelessWidget {
  student_detail_card(
      {super.key,
      required this.student_name,
      required this.father_name,
      required this.stu_class,
      required this.stu_img});

  String student_name;
  String father_name;
  String stu_class;
  String stu_img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.lightBlueAccent,
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
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
                  trailing: CircleProgressBar(
                    foregroundColor: Colors.blue,
                    backgroundColor: Colors.grey.shade500,
                    value: 0.75,
                    child: const Center(
                      child: Text("75%"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
