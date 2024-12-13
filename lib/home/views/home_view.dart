import 'package:babylon_task/util/app_fonts.dart';
import 'package:babylon_task/util/app_padding.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppPadding(
        child: Column(
          children: [
            const Center(
              child: Text(
                'Hey, Seif Rashed! You’re successfully logged in.',
                textAlign: TextAlign.center,
                style: AppFonts.styleSemibold24,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Babylon Radio!',
              style: AppFonts.stylew40014,
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.logout, color: Colors.red),
                label: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.red),
                ),
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
