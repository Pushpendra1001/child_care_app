import 'package:child_care/views/common/parent_container.dart';
import 'package:child_care/views/screens/homepage.dart';
import 'package:child_care/views/screens/photogallery/image_gallery_screen.dart';
import 'package:flutter/material.dart';

class galleryHomePage extends StatelessWidget {
  const galleryHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Gallery"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffD1EEF3),
                  image: DecorationImage(
                    image: AssetImage('assets/images/gallerybg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 200,
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "All Images",
                            style: TextStyle(fontSize: 24),
                          ),
                          Text("Total Images : 20"),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ImageGalleryScreen(),
                              ));
                        },
                        child: Text("Explore"))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
