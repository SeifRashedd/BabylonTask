import 'package:babylon_task/home/views/home_view.dart';
import 'package:babylon_task/util/app_fonts.dart';
import 'package:babylon_task/util/app_padding.dart';
import 'package:babylon_task/util/custom_button.dart';
import 'package:babylon_task/util/custom_password_text_filed.dart';
import 'package:babylon_task/util/custom_text_filed.dart';
import 'package:babylon_task/util/remember_me.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppPadding(
          child: ListView(
        children: [
          const Center(
              child: Text(
            'Register',
            style: AppFonts.styleSemibold24,
          )),
          const SizedBox(height: 33),
          const Text(
            'Hello ,',
            style: AppFonts.styleSemibold24,
          ),
          const Text(
            'Create your accout in Babylon App Now',
            style: AppFonts.styleSemibold24,
          ),
          const SizedBox(height: 30),
          const CustomTextFormFiled(
            hint: 'Type your Name',
            label: 'Type your Name',
          ),
          const SizedBox(height: 30),
          const CustomTextFormFiled(
            hint: 'Type your email',
            label: 'Type your email',
          ),
          const SizedBox(height: 30),
          const PasswordTextField(
            label: 'Type your password',
            hint: 'Type your password',
          ),
          const SizedBox(height: 10),
          const RememberMeWidget(),
          CustomButton(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeView(),
                )),
            aspectRatio: 5.63,
            text: 'Register',
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Do you Have Account ?',
                style: AppFonts.styleBold14,
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Text(
                  'LogIn',
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
