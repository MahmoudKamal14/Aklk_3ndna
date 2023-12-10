import 'dart:async';
import 'dart:io';

import 'package:aklk_3ndna/core/cubit/app_cubit/app_states.dart';
import 'package:aklk_3ndna/core/database/cache/cache_helper.dart';
import 'package:aklk_3ndna/core/models/meal_model.dart';
import 'package:aklk_3ndna/core/models/user_model.dart';
import 'package:aklk_3ndna/core/services/service_locator.dart';
import 'package:aklk_3ndna/features/auth/cubit_auth/auth_cubit.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;
  MealModel? mealModel;

  void getUserData() {
    emit(GetUserDataLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(getIt<CacheHelper>().getDataString(key: AuthCubit.primaryKey))
        .get()
        .then((value) {
      //userModel = UserModel.fromJson(value.data()!);
      print(value.data());
      emit(GetUserDataSuccessState());
    }).catchError((onError) {
      emit(GetUserDataErrorState(onError.toString()));
    });
  }

  List<MealModel> allMeals = [];

  void getAllMeals() {
    allMeals.clear();
    emit(GetAllMealsLoadingState());
    FirebaseFirestore.instance.collection('meals').get().then((value) {
      value.docs.forEach((element) {
        allMeals.add(MealModel.fromJson(element.data()));
        print(allMeals);
        emit(GetAllMealsSuccessState());
      });

      emit(GetAllMealsSuccessState());
    }).catchError((error) {
      emit(GetAllMealsErrorState(error.toString()));
      print(error);
    });
  }

// Pick an image
  File? profileImageFile;
  var picker = ImagePicker();
  Future getProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImageFile = File(pickedFile.path);
      print(pickedFile.path.toString());
      emit(ProfileImagePickerSuccessState());
    } else {
      print('No Image Selected');
      emit(ProfileImagePickerErrorState());
    }
  }

  //upload Profile Image

  void uploadProfileImage({
    required String name,
    required String phone,
  }) {
    emit(UpdateProfileImageLoadingState());
    FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImageFile!.path).pathSegments.last}')
        .putFile(profileImageFile!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        updateUser(
          name: name,
          phone: phone,
          image: value,
        );
        emit(UpdateProfileImageLoadingState());
      }).catchError((error) {
        emit(UpdateProfileImageErrorState());
      });
    }).catchError((error) {
      emit(UpdateProfileImageErrorState());
    });
  }

  void updateUser({
    required String name,
    required String phone,
    String? image,
  }) {
    emit(UpdateUserDataLoadingState());
    UserModel modelMap = UserModel(
      name: name,
      phone: phone,
      image: image ?? userModel!.image,
      email: userModel!.email,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.email)
        .update(modelMap.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(UpdateUserDataErrorState(error.toString()));
    });
  }

  // Search by meal name

  List<MealModel> resultSearch = [];
  void Search(String text) async {
    emit(SearchMealLoadingState());
    await FirebaseFirestore.instance
        .collection('meals')
        .where('name')
        .get()
        .then((value) {
      resultSearch = value.docs.map((e) => e.data()).cast<MealModel>().toList();
      emit(SearchMealSuccessState());
    }).catchError((onError) {
      emit(SearchMealErrorState());
    });
  }
}
