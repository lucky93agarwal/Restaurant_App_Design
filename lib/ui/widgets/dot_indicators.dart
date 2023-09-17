import 'package:flutter/material.dart';

class DotIndicators extends StatelessWidget {
  final int dotLength;
  final double currentIndex;

  const DotIndicators({
    super.key,
    required this.dotLength,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        dotLength,
            (index) => Padding(
              padding: const EdgeInsets.all(3.0),
              child: Icon(
          index == currentIndex.round() ? Icons.circle : Icons.circle_outlined,
          color:index == currentIndex.round() ? Colors.white: const Color(0xff857998),
          size: 8,
        ),
            ),
      ),
    );
  }
}