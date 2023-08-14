import 'package:flutter/material.dart';

class BrandIcon extends StatelessWidget {
  const BrandIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.play_circle,
          color: Colors.white,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "Movie App",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
