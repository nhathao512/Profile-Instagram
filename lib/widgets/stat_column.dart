import 'package:flutter/material.dart';

class StatColumn extends StatelessWidget {
  final String count;
  final String label;

  const StatColumn({super.key, required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label, style: TextStyle(color: Colors.grey[400])),
      ],
    );
  }
}
