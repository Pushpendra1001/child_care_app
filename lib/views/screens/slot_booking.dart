import 'package:child_care/views/common/chip_button.dart';
import 'package:child_care/views/common/day_options.dart';
import 'package:child_care/views/common/table_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class slotBooking extends StatefulWidget {
  const slotBooking({super.key});

  @override
  State<slotBooking> createState() => _slotBookingState();
}

enum SlotType { Regular, Casual, Both }

conditionalRendring() {
  if (selectedIndex == 0) {
    return const Text(" ");
  } else if (selectedIndex == 1) {
    return const Wrap(
      children: [
        DayOption(day: 'Monday'),
        DayOption(day: 'Tuesday'),
        DayOption(day: 'Wednesday'),
        DayOption(day: 'Thursday'),
        DayOption(day: 'Friday'),
        DayOption(day: 'Saturday'),
      ],
    );
  } else if (selectedIndex == 2) {
    return my_table_calendar(header: true);
  } else if (selectedIndex == 3) {
    return const Text(" ");
  }
}

SlotType? _slotType;

int selectedIndex = 0; // Add this variable to hold the selected slot type

class _slotBookingState extends State<slotBooking> {
  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    print(selectedIndex); // Add this line to print the selected index (0, 1, 2
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Slot Booking"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/slotbooking.png'),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Select Session Type',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      child: RadioListTile(
                        contentPadding: const EdgeInsets.all(0.0),
                        value: SlotType.Regular,
                        groupValue: _slotType,
                        title: Text(SlotType.Regular.name),
                        onChanged: (val) {
                          setState(() {
                            _slotType = val;
                            selectedIndex = 1;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      child: RadioListTile(
                        contentPadding: const EdgeInsets.all(0.0),
                        value: SlotType.Casual,
                        groupValue: _slotType,
                        title: Text(SlotType.Casual.name),
                        onChanged: (val) {
                          setState(() {
                            _slotType = val;
                            selectedIndex = 2;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      child: RadioListTile(
                        contentPadding: const EdgeInsets.all(0.0),
                        value: SlotType.Both,
                        groupValue: _slotType,
                        title: Text(SlotType.Both.name),
                        onChanged: (val) {
                          setState(() {
                            _slotType = val;
                            selectedIndex = 3;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              selectedIndex == 1
                  ? const Text(
                      'Choose your prefered days:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  : const Text(" "),
              conditionalRendring(),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  width: screenwidth * 0.5,
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
              ),
              const SizedBox(height: 8.0),
            ],
          ),
        ),
      ),
    );
  }
}
