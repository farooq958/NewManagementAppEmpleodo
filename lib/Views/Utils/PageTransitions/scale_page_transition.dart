import 'package:flutter/material.dart';

class ScalePageTransition {
  //scalePageTransition method
  static PageRouteBuilder scalePageTransition({
    required Widget page,
    required Alignment alignment,
  }) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, animationTime, child) {
        animation = CurvedAnimation(parent: animation, curve: Curves.easeIn);
        return ScaleTransition(
          alignment: alignment,
          scale: animation,
          child: child,
        );
      },
      pageBuilder: (context, animation, animationTime) {
        return page;
      },
    );
  }
}
