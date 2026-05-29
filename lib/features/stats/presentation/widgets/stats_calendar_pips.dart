import 'package:flutter/material.dart';

/// Row of small dot indicators rendered below a calendar day number.
class StatsCalendarPips extends StatelessWidget {
  final int count;
  final Color color;

  const StatsCalendarPips({
    super.key,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (i) {
        return Padding(
          padding: EdgeInsets.only(right: i == count - 1 ? 0 : 2),
          child: Container(
            width: 3,
            height: 3,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
        );
      }),
    );
  }
}
