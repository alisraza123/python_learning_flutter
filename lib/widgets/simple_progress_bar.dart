import 'package:flutter/material.dart';

class SimpleProgressBar extends StatelessWidget {
  final double value; // 0.0 - 1.0
  const SimpleProgressBar({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: LinearProgressIndicator(
        value: value,
        minHeight: 8,
        backgroundColor: Theme.of(context).colorScheme.surface.withOpacity(0.2),
      ),
    );
  }
}
