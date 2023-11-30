import 'package:aklk_3ndna/core/models/user_model.dart';
import 'package:aklk_3ndna/features/auth/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(RegisterInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  // Register User

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      emit(RegisterUserLoadingState());
      print(value.user!.email);
      print(value.user!.uid);
      userCreate(
        email: email,
        name: name,
        phone: phone,
        uid: value.user!.uid,
      );
    }).catchError((error) {
      emit(RegisterUserErrorState(error.toString()));
    });
  }

  void userCreate({
    String? email,
    required String name,
    required String phone,
    String? uid,
  }) {
    UserModel model = UserModel(
      name: name,
      email: email,
      phone: phone,
      uid: uid,
      image:
          'https://image.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg',
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState(error));
    });
  }

// Login User

  void userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginInUserLoadingState());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print('Email => ${value.user!.email}');
      print('Id => ${value.user!.uid}');

      emit(LoginInUserSuccessState(value.user!.uid));
    }).catchError((onError) {
      print(onError.toString());
      emit(LoginInUserErrorState(onError.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool showPassword = true;
  void changePasswordVisibility() {
    showPassword = !showPassword;
    suffix = showPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibility());
  }

  // obscure Password Text
  bool? obscurePasswordTextValue = true;
  GlobalKey<FormState> signupFormKey = GlobalKey();

  void obscurePasswordText() {
    if (obscurePasswordTextValue == true) {
      obscurePasswordTextValue = false;
    } else {
      obscurePasswordTextValue = true;
    }
    emit(ObscurePasswordTextUpdateState());
  }
}
