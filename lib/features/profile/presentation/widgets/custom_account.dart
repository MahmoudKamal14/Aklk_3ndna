import 'package:aklk_3ndna/core/cubit/app_cubit/app_cubit.dart';
import 'package:aklk_3ndna/core/cubit/app_cubit/app_states.dart';
import 'package:aklk_3ndna/core/utils/app_assets.dart';
import 'package:aklk_3ndna/core/utils/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileUserScreen extends StatelessWidget {
  const EditProfileUserScreen({super.key});

  static const String id = "editProfileUserScreen";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        // var user = AppCubit.get(context).userModel!;
        var editProfileImage = AppCubit.get(context).profileImageFile;

        // nameController.text = user.name!;
        // phoneController.text = user.phone!;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            titleSpacing: 0.0,
            title: const Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white54,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextButton(
                  onPressed: () {
                    // AppCubit.get(context).updateUserData(
                    //   name: nameController.text,
                    //   phone: phoneController.text,
                    // );
                  },
                  child: const Text(
                    'Update',
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                if (state is UpdateUserDataLoadingState)
                  const LinearProgressIndicator(),
                if (state is! UpdateUserDataLoadingState)
                  const SizedBox(
                    height: 15,
                  ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      children: [
                        SizedBox(
                            width: double.infinity,
                            child: Card(
                              margin: const EdgeInsets.all(8.0),
                              elevation: 5,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Container(
                                width: double.infinity,
                                height: 200,
                                color: Colors.blueGrey,
                              ),
                            )),
                      ],
                    ),
                    Positioned(
                      top: 150,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 64,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              backgroundImage: editProfileImage == null
                                  ? NetworkImage(
                                      Assets.imagesOnBoradingChooseyourfood)
                                  : FileImage(editProfileImage)
                                      as ImageProvider,
                              radius: 60,
                            ),
                          ),
                          Positioned(
                            top: 14,
                            right: 4,
                            child: IconButton(
                              onPressed: () {
                                AppCubit.get(context).getProfileImage();
                                print('object');
                              },
                              icon: const Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 64,
                ),
                if (AppCubit.get(context).profileImageFile != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        if (AppCubit.get(context).profileImageFile != null)
                          Expanded(
                            child: OutlinedButton(
                                onPressed: () {
                                  AppCubit.get(context).uploadProfileImage(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                  );
                                  print('$editProfileImage');
                                },
                                child: const Text(
                                  'Update Profile Image',
                                  style: TextStyle(
                                    color: Colors.white54,
                                  ),
                                )),
                          ),
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: textFieldProfile(
                    controller: nameController,
                    type: TextInputType.name,
                    prefix: Icons.person_2,
                    hintText: 'Mahmoud Kamal',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: textFieldProfile(
                    controller: nameController,
                    type: TextInputType.name,
                    prefix: Icons.email,
                    hintText: 'mkelsafty1838@gmail.com',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: textFieldProfile(
                    controller: phoneController,
                    type: TextInputType.phone,
                    prefix: Icons.phone,
                    hintText: '0115066097',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget textFieldProfile({
  required TextEditingController controller,
  required TextInputType type,
  dynamic validator,
  Function? onSubmit,
  Function? onChanged,
  Function()? onTap,
  bool isPassword = false,
  String? label,
  String? hintText,
  IconData? prefix,
  IconData? suffix,
  Function()? suffixClicked,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 22,
      ),
      validator: validator,
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      onTap: onTap,
      obscureText: isPassword,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 22,
        ),
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixClicked!();
                },
                icon: Icon(suffix),
              )
            : null,
      ),
    );
