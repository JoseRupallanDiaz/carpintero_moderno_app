import 'package:flutter/material.dart';

class DisplayCounter extends StatelessWidget {
  String label;
  String value;

  DisplayCounter({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Text(label),
      ],
    );
  }
}
