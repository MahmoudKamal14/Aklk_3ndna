import 'dart:async';
import 'dart:developer';
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

  late UserModel userModel;
  MealModel? mealModel;

  void getUserData() {
    log('message');
    emit(GetUserDataLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(getIt<CacheHelper>().getDataString(key: AuthCubit.primaryKey))
        .get()
        .then((value) {
      print(value.data());
      userModel = UserModel.fromJson(value.data()!);

      log('Name => ${userModel.name}');
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
        log('الوجبات جاهزة للعرض');
        emit(GetAllMealsSuccessState());
      });

      emit(GetAllMealsSuccessState());
    }).catchError((error) {
      emit(GetAllMealsErrorState(error.toString()));
      print(error);
    });
  }

  // Set All Meals Favorite

  void setAllMealsFavorite({
    required String name,
    required String price,
    required String description,
    required String photo,
    required String rate,
  }) {
    MealModel meal = MealModel(
        name: name,
        price: price,
        description: description,
        photo: photo,
        rate: rate);

    FirebaseFirestore.instance
        .collection('users')
        .doc(getIt<CacheHelper>().getDataString(key: AuthCubit.primaryKey))
        .collection('favorites')
        .doc(name)
        .set(meal.toMap())
        .then((value) {
      mealModel = MealModel.fromJson(meal.toMap());
      print('The Favorite meal => ${mealModel!.name}');
    }).catchError((onError) {});
  }

  void deleteMealFromFavorite({
    required String name,
    required String price,
    required String description,
    required String photo,
    required String rate,
  }) {
    MealModel meal = MealModel(
        name: name,
        price: price,
        description: description,
        photo: photo,
        rate: rate);

    FirebaseFirestore.instance
        .collection('users')
        .doc(getIt<CacheHelper>().getDataString(key: AuthCubit.primaryKey))
        .collection('favorites')
        .doc(name)
        .delete()
        .then((value) {
      mealModel = MealModel.fromJson(meal.toMap());
      print('The Favorite meal => ${mealModel}');
    }).catchError((onError) {});
  }

  // Get All Meals Favorite

  List<MealModel> allMealsFavorite = [];

  void getAllMealsFavorite() {
    allMealsFavorite.clear();
    emit(GetAllMealsFavoriteLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(getIt<CacheHelper>().getDataString(key: AuthCubit.primaryKey))
        .collection('favorites')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        allMealsFavorite.add(MealModel.fromJson(element.data()));
        print(allMealsFavorite);
        emit(GetAllMealsFavoriteSuccessState());
      });

      emit(GetAllMealsFavoriteSuccessState());
    }).catchError((error) {
      emit(GetAllMealsFavoriteErrorState(error.toString()));
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
    required String email,
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
          email: email,
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
    required String email,
    String? image,
  }) {
    emit(UpdateUserDataLoadingState());
    UserModel modelMap = UserModel(
      name: name,
      phone: phone,
      image: image ?? userModel.image,
      email: userModel.email,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.email)
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
