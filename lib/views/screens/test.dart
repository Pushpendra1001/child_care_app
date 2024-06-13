import 'package:flutter/material.dart';

class MyAppTest extends StatefulWidget {
  @override
  _MyAppTestState createState() => _MyAppTestState();
}

class _MyAppTestState extends State<MyAppTest> {
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Time Picker Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  final pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null) {
                    setState(() {
                      _selectedTime = pickedTime;
                    });
                  }
                },
                child: DropdownButton<TimeOfDay>(
                  hint: Text('Select Time'),
                  value: _selectedTime,
                  onChanged: (newTime) {
                    setState(() {
                      _selectedTime = newTime;
                    });
                  },
                  items: [],
                ),
              ),
              SizedBox(height: 16.0),
              Text("hi" + _selectedTime.toString()),
              ElevatedButton(
                onPressed: () {
                  // Handle save button press
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
