import 'package:flutter/material.dart';

class AwarenessDialog extends StatelessWidget {
  const AwarenessDialog({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.transparent,
      body: Container(
          color: Colors.grey.withOpacity(0.5), child: const Text('data'),),
    );
  }
}
