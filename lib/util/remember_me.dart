import 'package:babylon_task/util/app_fonts.dart';
import 'package:flutter/material.dart';

class RememberMeWidget extends StatefulWidget {
  const RememberMeWidget({super.key});

  @override
  State<RememberMeWidget> createState() => _RememberMeWidgetState();
}

class _RememberMeWidgetState extends State<RememberMeWidget> {
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Checkbox(
              value: _rememberMe,
              onChanged: (bool? value) {
                setState(() {
                  _rememberMe = value ?? false;
                });
              },
              activeColor: Colors.black,
              checkColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const Text(
              'Remember me',
              style: AppFonts.stylew40014,
            ),
          ],
        ),
      ],
    );
  }
}