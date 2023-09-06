import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopTiles extends StatelessWidget {
  final String title, subtitle;

  const TopTiles({super.key, required this.subtitle, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: kToolbarHeight + 10,
        ),
        if (title == 'Login' || title == "Create Account")
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios),
          ),
        const SizedBox(
          height: 12.0,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(subtitle,
            style:
                const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400)),
      ],
    );
  }
}
