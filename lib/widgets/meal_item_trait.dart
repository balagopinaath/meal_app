import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({required this.iconData, required this.label, super.key});

  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 17,
          color: Colors.white,
        ),
        const Gap(6),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
