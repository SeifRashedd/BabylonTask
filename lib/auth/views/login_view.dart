import 'package:babylon_task/auth/cubit/auth_cubit.dart';
import 'package:babylon_task/auth/views/register_view.dart';
import 'package:babylon_task/home/views/home_view.dart';
import 'package:babylon_task/util/app_fonts.dart';
import 'package:babylon_task/util/app_padding.dart';
import 'package:babylon_task/util/custom_button.dart';
import 'package:babylon_task/util/custom_password_text_filed.dart';
import 'package:babylon_task/util/custom_text_filed.dart';
import 'package:babylon_task/util/remember_me.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
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
                'Login',
                style: AppFonts.styleSemibold24,
              ),
            ),
            const SizedBox(height: 33),
            const Text(
              'Hello ,',
              style: AppFonts.styleSemibold24,
            ),
            const Text(
              'Welcome Back to Babylon App',
              style: AppFonts.styleSemibold24,
            ),
            const SizedBox(height: 40),
            CustomTextFormFiled(
              controller: emailController,
              hint: 'Type your email',
              label: 'Type your email',
            ),
            const SizedBox(height: 40),
            PasswordTextField(
              controller: passwordController,
              label: 'Type your password',
              hint: 'Type your password',
            ),
            const SizedBox(height: 10),
            const RememberMeWidget(),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is LoginErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errMsg)),
                  );
                } else if (state is LoginCustomException) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errMsg)),
                  );
                } else if (state is LoginSuccessState) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeView()),
                  );
                }
              },
              builder: (context, state) {
                if (state is LoginLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CustomButton(
                  onTap: () {
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();
                    if (email.isNotEmpty && password.isNotEmpty) {
                      if (!email.contains('@gmail.com')) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text('Please enter a valid Gmail address')),
                        );
                        return;
                      }
                      BlocProvider.of<AuthCubit>(context)
                          .login(email: email, password: password);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please fill in all fields')),
                      );
                    }
                  },
                  aspectRatio: 6,
                  text: 'LogIn',
                );
              },
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don’t Have an Account?',
                  style: AppFonts.styleBold14,
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterView()),
                    );
                  },
                  child: const Text(
                    'Register',
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
}
