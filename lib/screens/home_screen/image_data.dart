import 'package:flutter/material.dart';

class ImageData extends StatelessWidget {
  final String url;

  const ImageData({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(height: 200.0),
      decoration: BoxDecoration(color: Colors.grey),
      child: Image.asset(url, fit: BoxFit.cover),
    );
  }
}
