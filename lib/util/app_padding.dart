import 'package:flutter/material.dart';

class AppPadding extends StatelessWidget {
  const AppPadding({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: child,
      ),
    );
  }
}
