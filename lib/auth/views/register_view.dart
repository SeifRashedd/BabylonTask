import 'package:babylon_task/auth/cubit/auth_cubit.dart';
import 'package:babylon_task/home/views/home_view.dart';
import 'package:babylon_task/util/app_fonts.dart';
import 'package:babylon_task/util/app_padding.dart';
import 'package:babylon_task/util/custom_button.dart';
import 'package:babylon_task/util/custom_password_text_filed.dart';
import 'package:babylon_task/util/custom_text_filed.dart';
import 'package:babylon_task/util/remember_me.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
              ),
            ),
            const SizedBox(height: 33),
            const Text(
              'Hello ,',
              style: AppFonts.styleSemibold24,
            ),
            const Text(
              'Create your account in Babylon App Now',
              style: AppFonts.styleSemibold24,
            ),
            const SizedBox(height: 30),
            CustomTextFormFiled(
              controller: nameController,
              hint: 'Type your Name',
              label: 'Type your Name',
            ),
            const SizedBox(height: 30),
            CustomTextFormFiled(
              controller: emailController,
              hint: 'Type your email',
              label: 'Type your email',
            ),
            const SizedBox(height: 30),
            PasswordTextField(
              controller: passwordController,
              label: 'Type your password',
              hint: 'Type your password',
            ),
            const SizedBox(height: 10),
            const RememberMeWidget(),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is RegisterErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errMsg)),
                  );
                } else if (state is RegisterCustomException) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errMsg)),
                  );
                } else if (state is RegisterSuccessState) {
                  showDialog(
                    context: context,
                    builder: (context) => _buildSuccessDialog(context),
                  );
                }
              },
              builder: (context, state) {
                if (state is RegisterLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CustomButton(
                  onTap: () {
                    final name = nameController.text.trim();
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();
                    if (!email.contains('@gmail.com')) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text('Please enter a valid Gmail address')),
                      );
                      return;
                    }
                    if (name.isNotEmpty &&
                        email.isNotEmpty &&
                        password.isNotEmpty) {
                      BlocProvider.of<AuthCubit>(context).register(
                        username: name,
                        email: email,
                        password: password,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please fill in all fields')),
                      );
                    }
                  },
                  aspectRatio: 6,
                  text: 'Register',
                );
              },
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Do you Have Account?',
                  style: AppFonts.styleBold14,
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Text(
                    'LogIn',
                    style: AppFonts.stylew40014,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessDialog(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Registration Successful!',
        style: AppFonts.styleSemibold22,
      ),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Welcome to Babylon App!'),
          SizedBox(height: 10),
          Text('Thank you for registering with us.'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeView()),
            );
          },
          child: const Text(
            'Go to Home',
            style: AppFonts.styleSemibold16,
          ),
        ),
      ],
    );
  }
}
