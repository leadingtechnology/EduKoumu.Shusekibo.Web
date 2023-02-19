
import 'package:flutter/material.dart';

class SeatWidget extends StatefulWidget {
  const SeatWidget({
    super.key,
    
    required this.url,
    required this.studentNumber,
    required this.name,
    required this.stamp,
    required this.reason,
  });
  
  final String url;
  final String studentNumber;
  final String name;
  final String stamp;
  final String reason;

  @override
  State<SeatWidget> createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
