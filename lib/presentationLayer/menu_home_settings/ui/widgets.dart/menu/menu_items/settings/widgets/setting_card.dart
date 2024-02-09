import 'package:flutter/material.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

class SettingCard extends StatelessWidget {
  final Widget childWidget;
  const SettingCard({super.key, required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      foregroundDecoration: const RotatedCornerDecoration.withColor(
        color: Colors.indigo,
        badgeSize: Size(64, 64),
        badgePosition: BadgePosition.bottomStart,
        textDirection: TextDirection.rtl,
      ),
      child: Center(
        child: childWidget,
      ),
    );
  }
}
