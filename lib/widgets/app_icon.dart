import 'package:flutter/cupertino.dart';
import 'package:food_delivery/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final double size;
  final double iconSize;
  const AppIcon({
    Key? key,
    required this.onTap,
    required this.icon,
    this.iconColor = const Color(0xFF756d54),
    this.backgroundColor = const Color(0xFFfcf4e4),
    this.size = 40.0,
    this.iconSize = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: backgroundColor,
        ),
        child: Icon(
          icon, color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}
