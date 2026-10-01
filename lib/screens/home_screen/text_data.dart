import 'package:flutter/material.dart';

class TextData extends StatelessWidget {
  final String title;
  final String body;
  // final Color color;

  static const double horizontalPadding = 16.0;

  const TextData({
    super.key,
    // required this.color,
    required this.title,
    required this.body,
    // required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 35,
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(16,5,16,3),
          child: Text(title, style:Theme.of(context).textTheme.titleLarge),
        ),
        Container(
          height: 85,
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(
            horizontalPadding,
            .0,
            horizontalPadding,
            5.0,
          ),
          // decoration: BoxDecoration(color: color),
          child: Text(body, style:Theme.of(context).textTheme.bodySmall),
          // child: Text(body, style: TextStyle(color: color)),
        ),
      ],
    );
    // Container(
    // height: 50,
    // width: double.infinity,
    // decoration: BoxDecoration(color: color),
    // child: const Text("Color"),
    // );
  }
}
