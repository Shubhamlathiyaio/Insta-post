import 'package:flutter/material.dart';

class CommonChip extends StatelessWidget {
  final Widget child;
  final double horizontalPadding;
  final double verticalPadding;
  final double radius;
  final Color? backgroundColor;
  final IconData? icon; // 🔥 Optional icon
  final Color? iconColor;
  final double iconSize;
  final double? height;
  final double? width;

  const CommonChip({
    Key? key,
    required this.child,
    this.horizontalPadding = 12,
    this.verticalPadding = 5,
    this.radius = 15,
    this.backgroundColor = Colors.black26,
    this.icon,
    this.iconColor,
    this.iconSize = 18,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox( // ✅ Allow dynamic size
      constraints: BoxConstraints(
        minWidth: 0,
        maxWidth: width ?? double.infinity, // ✅ Allow width to expand naturally
      ),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Column( // ✅ Allow multi-line text
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (icon != null) ...[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    size: iconSize,
                    color: iconColor ?? Colors.white,
                  ),
                  const SizedBox(width: 4),
                  Expanded(child: child), // ✅ Make text wrap properly
                ],
              ),
            ] else
              child,
          ],
        ),
      ),
    );
  }
}
