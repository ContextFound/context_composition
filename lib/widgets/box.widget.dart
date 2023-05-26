import 'package:flutter/material.dart';
import 'package:context_composition/constants.dart';

class Box extends StatelessWidget {
  final String title;
  final Widget child;

  const Box({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: titleText,
          ),
        ),
        Container(
          decoration: roundedBox,
          child: child,
        ),
      ],
    );
  }
}
