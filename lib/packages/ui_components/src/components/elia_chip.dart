import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EliaChip extends StatelessWidget {
  final String? iconName;
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;

  const EliaChip({
    super.key,
    this.iconName,
    required this.text,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(4.0, 2.0, 6.0, 2.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconName != null) ...[
            SvgPicture.asset(
              iconName!,
              colorFilter: ColorFilter.mode(
                foregroundColor,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 2.0),
          ],
          Text(
            text,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: foregroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
