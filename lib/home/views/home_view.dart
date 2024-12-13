import 'package:babylon_task/auth/cubit/auth_cubit.dart';
import 'package:babylon_task/splash/splash_view.dart';
import 'package:babylon_task/util/app_fonts.dart';
import 'package:babylon_task/util/app_padding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    String userName = user?.displayName ?? 'User';

    return Scaffold(
      body: AppPadding(
        child: Column(
          children: [
            Center(
              child: Text(
                'Hey, $userName! You’re successfully logged in.',
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
              child: BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is LogoutSuccessState) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SplashView()),
                    );
                  } else if (state is LogoutErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errMsg)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is LogoutLoadingState) {
                    return const CircularProgressIndicator();
                  }

                  return TextButton.icon(
                    onPressed: () {
                      BlocProvider.of<AuthCubit>(context).logout();
                    },
                    icon: const Icon(Icons.logout, color: Colors.red),
                    label: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.red),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
