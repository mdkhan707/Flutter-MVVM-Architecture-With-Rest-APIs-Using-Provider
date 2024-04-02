import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class utils {
  static double averageRating(List<int> rating) {
    var avgrating = 0;
    for (int i = 0; i < rating.length; i++) {
      avgrating = avgrating + rating[i];
    }
    return double.parse((avgrating / rating.length).toStringAsFixed(1));
  }

  static void fieldfocuschange(
      BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static void flushbarmessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        borderRadius: BorderRadius.circular(10),
        flushbarPosition: FlushbarPosition.TOP,
        forwardAnimationCurve: Curves.decelerate,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        message: message,
        padding: const EdgeInsets.all(15),
        positionOffset: 20,
        reverseAnimationCurve: Curves.bounceInOut,
        icon: const Icon(Icons.error, size: 15),
        backgroundColor: Colors.red,
      )..show(context),
    );
  }
}
