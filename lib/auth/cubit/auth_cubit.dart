import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  AuthCubit() : super(AuthInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginErrorState(errMsg: 'No user found'));
      } else if (e.code == 'wrong-password') {
        emit(LoginErrorState(errMsg: 'Wrong email or password provided.'));
      } else if (e.code == 'invalid-email') {
        emit(LoginErrorState(errMsg: 'The email address is not valid'));
      } else {
        emit(LoginErrorState(
            errMsg: 'An unexpected error occurred: ${e.message}'));
      }
    } catch (e) {
      emit(LoginCustomException(errMsg: e.toString()));
    }
  }

  Future<void> register({
  required String email,
  required String password,
  required String username,
}) async {
  emit(RegisterLoadingState()); 
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;
    if (user != null) {
      await user.updateDisplayName(username);
      await user.reload();

      await _firestore.collection('users').doc(user.uid).set({
        'username': username,
        'email': email,
      });
      emit(RegisterSuccessState());
      return; 
    } else {
      emit(RegisterErrorState(errMsg: 'User creation failed unexpectedly.'));
    }
  } on FirebaseAuthException catch (e) {
   
    if (e.code == 'weak-password') {
      emit(RegisterErrorState(errMsg: 'The password provided is too weak.'));
    } else if (e.code == 'email-already-in-use') {
      emit(RegisterErrorState(
          errMsg: 'The account already exists for that email.'));
    } else if (e.code == 'invalid-email') {
      emit(RegisterErrorState(errMsg: 'The email address is not valid.'));
    } else {
      log(e.toString());
      emit(RegisterErrorState(
          errMsg: e.message ?? 'An unknown error occurred.'));
    }
  } catch (e) {
    
    log(e.toString());
    emit(RegisterCustomException(errMsg: e.toString()));
  }
}

Future<void> logout() async {
    emit(LogoutLoadingState());  
    try {
      await _auth.signOut();  

      emit(LogoutSuccessState()); 
    } catch (e) {
      log(e.toString());
      emit(LogoutErrorState(errMsg: 'An error occurred while logging out.')); 
    }
  }

}
