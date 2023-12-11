import 'package:aklk_3ndna/core/cubit/app_cubit/app_cubit.dart';
import 'package:aklk_3ndna/core/cubit/app_cubit/app_states.dart';
import 'package:aklk_3ndna/core/utils/app_assets.dart';
import 'package:aklk_3ndna/core/utils/app_colors.dart';
import 'package:aklk_3ndna/core/utils/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileUserScreen extends StatelessWidget {
  const EditProfileUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var editProfileImage = AppCubit.get(context).profileImageFile;

        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: kPrimaryColor,
            titleSpacing: 0.0,
            centerTitle: true,
            title: const Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextButton(
                  onPressed: () {
                    AppCubit.get(context).updateUser(
                      name: nameController.text,
                      phone: phoneController.text,
                      email: emailController.text,
                    );
                  },
                  child: const Text(
                    'Update',
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              if (state is UpdateUserDataLoadingState)
                const LinearProgressIndicator(),
              if (state is! UpdateUserDataLoadingState)
                const SizedBox(
                  height: 15,
                ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundImage: editProfileImage == null
                            ? AssetImage(Assets.imagesLogonameAklk3ndnaEn1)
                            : FileImage(editProfileImage) as ImageProvider,
                        radius: 60,
                      ),
                    ),
                    Positioned(
                      left: 14,
                      child: IconButton(
                        onPressed: () {
                          AppCubit.get(context).getProfileImage();
                          print('object');
                        },
                        icon: Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              if (AppCubit.get(context).profileImageFile != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                            onPressed: () {
                              AppCubit.get(context).uploadProfileImage(
                                name: nameController.text,
                                phone: phoneController.text,
                                email: emailController.text,
                              );
                            },
                            child: const Text(
                              'Update Profile Image',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefix: Icon(Icons.person_2),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
