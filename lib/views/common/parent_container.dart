import 'package:flutter/material.dart';

class parent_container extends StatelessWidget {
  parent_container({
    super.key,
    required this.ontapping,
    required this.image,
    required this.text,
  });

  Function ontapping;
  String image;
  String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => ontapping(),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 0.2)),
        height: 100,
        width: MediaQuery.of(context).size.width / 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(image),
            const SizedBox(
              height: 10,
            ),
            Text(text)
          ],
        ),
      ),
    );
  }
}
