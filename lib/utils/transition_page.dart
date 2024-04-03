import 'package:flutter/material.dart';

class CustomRouter extends PageRouteBuilder {
  final Widget page;

  CustomRouter({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            double  begin =  0;
            double end = 1;
            var curve = Curves.bounceInOut;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return ScaleTransition(
              scale: animation.drive(tween),
              child: child,
            );
          },
        );
}
