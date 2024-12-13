import 'package:babylon_task/auth/cubit/auth_cubit.dart';
import 'package:babylon_task/splash/splash_view.dart';
import 'package:babylon_task/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const BabylonApp());
}

class BabylonApp extends StatelessWidget {
  const BabylonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: AppColors.primary),
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          body: SplashView(),
        ),
      ),
    );
  }
}
