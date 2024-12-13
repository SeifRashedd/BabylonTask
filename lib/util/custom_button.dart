import 'package:babylon_task/util/app_fonts.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, this.text, this.onTap, this.style, this.aspectRatio});

  final String? text;
  final VoidCallback? onTap;
  final TextStyle? style;
  final double? aspectRatio;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: GestureDetector(
        onTap: onTap,
        child: AspectRatio(
          aspectRatio: aspectRatio ?? 6.8,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                text ?? 'LOG IN',
                style: style ?? AppFonts.styleBold14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
