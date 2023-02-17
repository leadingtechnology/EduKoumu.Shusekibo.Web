import 'package:flutter/material.dart';

class DialogUtil {
  static Future<void> show({
    required BuildContext context,
    required Widget Function(
      BuildContext context,
    )
        builder,
  }) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: builder(_context),
        );
      },
    );
  }
}
