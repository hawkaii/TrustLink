import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineComponent extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isCompleted;
  final String text;
  final String description;

  const TimelineComponent(
      {super.key,
      this.isFirst = false,
      this.isLast = false,
      required this.text,
      this.isCompleted = false,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      endChild: CardWidget(
        text: text,
        isCompleted: isCompleted,
        description: description,
      ),
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle: LineStyle(color: Colors.grey.shade100, thickness: 3),
      indicatorStyle: const IndicatorStyle(color: Color.fromRGBO(57, 210, 192, 1)),
    );
  }
}

class CardWidget extends StatelessWidget {
  final bool isCompleted;
  final String text;
  final String description;

  const CardWidget(
      {super.key,
      this.isCompleted = false,
      required this.text,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 10.0, top: 20), // Reduced top padding
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: GoogleFonts.inter(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          Text(
            description,
            style: GoogleFonts.inter(
                color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
