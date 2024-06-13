import 'package:child_care/views/common/parent_container.dart';
import 'package:child_care/views/common/student_list_card.dart';
import 'package:child_care/views/screens/callender_attendence.dart';
import 'package:child_care/views/screens/leave_request.dart';
import 'package:child_care/views/screens/photogallery/gallery_homepage.dart';
import 'package:child_care/views/screens/photogallery/image_gallery_screen.dart';
import 'package:child_care/views/screens/slot_booking.dart';
import 'package:child_care/views/screens/students_attendence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

bool showAll = false;

class ContainerData {
  final String title;
  final String imageSource;
  Function ontap;
  Color color;

  ContainerData(this.title, this.imageSource, this.ontap, this.color);
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var phoneHeight = MediaQuery.of(context).size.height;
    var phoneWidth = MediaQuery.of(context).size.width;
    List<ContainerData> containers = [
      ContainerData('Annoucement', "assets/images/annouce.png", () {},
          const Color(0xffF7ECFE)),
      ContainerData('Attendace', "assets/images/attend.png", () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AttendencePage(),
            ));
      }, const Color(0xffFFF7E9)),
      ContainerData('Weekly routine', "assets/images/week.png", () {},
          const Color(0xffD1EEF3)),
      ContainerData('Food Menu', "assets/images/food.png", () {},
          const Color(0xffD1EEF3)),
      ContainerData('Nappy Change', "assets/images/nappy.png", () {},
          const Color(0xffF7ECFE)),
      ContainerData('Scorecard', "assets/images/scorecard.png", () {},
          const Color(0xffECF2F9)),
      ContainerData('Transportaion', "assets/images/transport.png", () {},
          const Color(0xffFFF7E9)),
      ContainerData('Photo Gallery', "assets/images/gallery.png", () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => galleryHomePage(),
            ));
      }, const Color(0xffFFE4B3)),
      ContainerData('Fees Section', "assets/images/fees.png", () {},
          const Color(0xffFFF7E9)),
      ContainerData('Child Details', "assets/images/childdetails.png", () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AttendencePage(),
            ));
      }, const Color(0xffFFE4B3)),
      ContainerData('Slot Booking', "assets/images/slotbook.png", () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => slotBooking(),
            ));
      }, const Color(0xffECF2F9)),
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      drawer: const Drawer(),
      appBar: AppBar(
        actions: [
          const InkWell(child: Icon(Icons.notifications)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
                onTap: () {}, child: const Icon(Icons.person_outline_sharp)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.grey.shade400,
              height: MediaQuery.of(context).size.height * 0.40,
              child: Column(
                children: [
                  SizedBox(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: SvgPicture.asset(
                              alignment: Alignment.topCenter,
                              fit: BoxFit.contain,
                              'assets/images/family.svg',
                              semanticsLabel: 'My SVG Image',
                              height: MediaQuery.of(context).size.height * 0.40,
                              width: MediaQuery.of(context).size.width * 0.40,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 30,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: student_list_item(
                              gradient: true,
                              box_color: Colors.blue,
                              student_name: "Anmol Upadhyay",
                              father_name: "Ved Prakash",
                              stu_class: "LKG GRADE 1",
                              stu_img: "",
                              attendence_circle: false,
                              btn_text: "Check today update",
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/teddy_bear.png",
                              height: 18),
                          const Text(
                            "Features",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Image.asset(
                            "assets/images/teddy_bear.png",
                            height: 18,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Flexible(
                              child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true, // Add this line
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                ),
                                itemCount: showAll ? containers.length : 9,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      containers[index].ontap();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: containers[index].color,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                              containers[index].imageSource),
                                          const SizedBox(height: 5),
                                          Text(containers[index].title),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            showAll = !showAll;
                          });
                        },
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: showAll
                                ? const Text("See Less...")
                                : const Text("See More...")),
                      ),
                      Container(
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                "Parents Section",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  parent_container(
                                      ontapping: () {
                                        print("namstai");
                                      },
                                      image: "assets/images/phone.png",
                                      text: "Contact Us"),
                                  parent_container(
                                      ontapping: () {
                                        print("chating...");
                                      },
                                      image: "assets/images/message.png",
                                      text: "Chat with tutor"),
                                  parent_container(
                                      ontapping: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  LeaveRequestPage(),
                                            ));
                                      },
                                      image: "assets/images/leave.png",
                                      text: "Request Leave"),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
