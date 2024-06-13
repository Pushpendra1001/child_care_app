import 'package:flutter/material.dart';

class MedicalLeave {
  String name;
  String date;
  String status;

  MedicalLeave(this.name, this.date, this.status);
}

class MedicalLeaveList extends StatefulWidget {
  const MedicalLeaveList({super.key});

  @override
  _MedicalLeaveListState createState() => _MedicalLeaveListState();
}

class _MedicalLeaveListState extends State<MedicalLeaveList> {
  final List<MedicalLeave> _leaves = [
    MedicalLeave("Medical Leave", "30 Jan, 2024 - 03 Feb 2024", "Pending"),
    MedicalLeave("Medical Leave", "30 Jan, 2024 - 03 Feb 2024", "Approved"),
    MedicalLeave("Medical Leave", "30 Jan, 2024 - 03 Feb 2024", "Approved"),
    MedicalLeave("Medical Leave", "30 Jan, 2024 - 03 Feb 2024", "Rejected"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _leaves.length,
      itemBuilder: (context, index) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListTile(
                title: Text(_leaves[index].name),
                subtitle: Text(_leaves[index].date),
                trailing: Chip(
                  label: Text(
                    _leaves[index].status,
                    style: TextStyle(
                        color: _getBackgroundColor(_leaves[index].status)),
                  ),
                  // backgroundColor: _getBackgroundColor(_leaves[index].status),
                  side: BorderSide(
                      color: _getBackgroundColor(_leaves[index].status)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Color _getBackgroundColor(String status) {
    switch (status) {
      case "Pending":
        return Colors.yellow;
      case "Approved":
        return Colors.green;
      case "Rejected":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
