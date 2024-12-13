import 'package:babylon_task/auth/views/register_view.dart';
import 'package:babylon_task/home/views/home_view.dart';
import 'package:babylon_task/util/app_fonts.dart';
import 'package:babylon_task/util/app_padding.dart';
import 'package:babylon_task/util/custom_button.dart';
import 'package:babylon_task/util/custom_password_text_filed.dart';
import 'package:babylon_task/util/custom_text_filed.dart';
import 'package:babylon_task/util/remember_me.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppPadding(
        child: ListView(
          children: [
            const Center(
                child: Text(
              'Login',
              style: AppFonts.styleSemibold24,
            )),
            const SizedBox(height: 33),
            const Text(
              'Hello ,',
              style: AppFonts.styleSemibold24,
            ),
            const Text(
              'Wlecom Back to Babylon App',
              style: AppFonts.styleSemibold24,
            ),
            const SizedBox(height: 40),
            const CustomTextFormFiled(
              hint: 'Type your email',
              label: 'Type your email',
            ),
            const SizedBox(height: 40),
            const PasswordTextField(
              label: 'Type your password',
              hint: 'Type your password',
            ),
            const SizedBox(height: 10),
            const RememberMeWidget(),
             CustomButton(
              onTap: () => Navigator.push(context , MaterialPageRoute(builder: (context) => const HomeView(),)),
              aspectRatio: 5.63,
              text: 'LogIn',
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Dont Have Account ?',
                  style: AppFonts.styleBold14,
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterView(),
                      )),
                  child: const Text(
                    'Register',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


