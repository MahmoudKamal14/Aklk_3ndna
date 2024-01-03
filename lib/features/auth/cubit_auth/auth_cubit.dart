import 'dart:developer';

import 'package:aklk_3ndna/core/database/cache/cache_helper.dart';
import 'package:aklk_3ndna/core/models/user_model.dart';
import 'package:aklk_3ndna/core/services/service_locator.dart';
import 'package:aklk_3ndna/features/auth/cubit_auth/auth_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  static const String primaryKey = 'primaryKey';

//! SignUp With Email And Password
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String userName,
    required String phone,
  }) async {
    try {
      emit(SignupLoadingState());
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) async {
        await addUserProfile(
          userName: userName,
          email: email,
          phone: phone,
        );
      });
      await verifyEmail();
      emit(SignupSuccessState());
    } on FirebaseAuthException catch (e) {
      _signUpHandleException(e);
    } catch (e) {
      emit(SignupFailureState(errMessage: e.toString()));
    }
  }

//! user Create
  Future<void> addUserProfile({
    required String email,
    required String userName,
    required String phone,
  }) async {
    UserModel model = UserModel(
        userName: userName,
        email: email,
        phone: phone,
        image:
            'https://firebasestorage.googleapis.com/v0/b/aklk-3ndna-e9035.appspot.com/o/user.jpg?alt=media&token=81eaf114-1074-46fc-a8f7-db64a67252ca'); //!
    FirebaseFirestore.instance
        .collection('users')
        .doc(email)
        .set(model.toMap())
        .then((value) {
      getIt<CacheHelper>().put(key: primaryKey, value: email);
    });
  }

//! verify Email

  Future<void> verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

//! SignUp Handle Exception
  void _signUpHandleException(FirebaseAuthException error) {
    if (error.code == 'weak-password') {
      emit(SignupFailureState(errMessage: 'The password provided is too weak'));
    } else if (error.code == 'email-already-in-use') {
      emit(SignupFailureState(
          errMessage: 'The account already exists for that email.'));
    } else if (error.code == 'invalid-email') {
      emit(SignupFailureState(errMessage: 'The email is invalid.'));
    } else if (error.code == 'network-request-failed') {
      emit(SignupFailureState(
          errMessage: 'Please check your network connection.'));
    } else {
      log(error.code);
      emit(SignupFailureState(errMessage: error.code));
    }
  }

//! Login User => SigIn With Email And Password
  Future<void> sigInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      emit(SigninLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      getIt<CacheHelper>().put(key: primaryKey, value: email);
      emit(SigninSuccessState());
    } on FirebaseAuthException catch (erorr) {
      _signInHandleException(erorr);
    } catch (e) {
      emit(
        SigninFailureState(errMessage: e.toString()),
      );
    }
  }

//! SignIn Handle Exception
  void _signInHandleException(FirebaseAuthException error) {
    if (error.code == 'user-not-found') {
      emit(SigninFailureState(errMessage: 'No user found for that email.'));
    } else if (error.code == 'wrong-password') {
      emit(SigninFailureState(
          errMessage: 'Wrong password provided for that user.'));
    } else {
      emit(SigninFailureState(errMessage: 'Check your Email and password!'));
    }
  }

//! Reset Password With Link
  Future<void> resetPasswordWithLink({required String email}) async {
    try {
      emit(ResetPasswordLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(ResetPasswordSuccessState());
    } catch (erorr) {
      emit(ResetPasswordFailureState(errMessage: erorr.toString()));
    }
  }

//! obscure Password Text
  bool obscurePasswordTextValue = true;
  void obscurePasswordText() {
    if (obscurePasswordTextValue == true) {
      obscurePasswordTextValue = false;
    } else {
      obscurePasswordTextValue = true;
    }
    emit(ObscurePasswordTextUpdateState());
  }

//! Update Terms And Condition CheckBox
  bool? termsAndConditionCheckBoxValue = false;
  void updateTermsAndConditionCheckBox({required newValue}) {
    termsAndConditionCheckBoxValue = newValue;
    emit(TermsAndConditionUpdateState());
  }
}
