import 'package:flutter/material.dart';

class TimeBlock extends StatelessWidget {
  final String value;
  final String label;

  const TimeBlock({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Schyler',
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Color(0xFF7D23E0),
          ),
        ),
      ],
    );
  }
}
