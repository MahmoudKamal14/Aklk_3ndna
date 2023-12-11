import 'package:aklk_3ndna/core/cubit/app_cubit/app_cubit.dart';
import 'package:aklk_3ndna/core/cubit/app_cubit/app_states.dart';
import 'package:aklk_3ndna/core/utils/app_controller.dart';
import 'package:aklk_3ndna/features/profile/presentation/widgets/image_profile.dart';
import 'package:aklk_3ndna/features/profile/presentation/widgets/text_field_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileUserScreen extends StatelessWidget {
  const EditProfileUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var user = AppCubit.get(context).userModel;
        var editProfileImage = AppCubit.get(context).profileImageFile;

        nameController.text = user.name;
        phoneController.text = user.phone;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            title: const Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                if (state is UpdateUserDataLoadingState)
                  const LinearProgressIndicator(),
                if (state is! UpdateUserDataLoadingState)
                  const SizedBox(
                    height: 15,
                  ),
                ImageProfile(editProfileImage: editProfileImage, user: user),
                const SizedBox(
                  height: 10,
                ),
                if (state is ProfileImagePickerSuccessState)
                  UpdateProfileImage(editProfileImage: editProfileImage),
                if (state is ProfileImagePickerSuccessState) SizedBox(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: textFieldProfile(
                    controller: nameController,
                    type: TextInputType.name,
                    prefix: Icons.person_2,
                    label: 'Name',
                    hintText: '${user.name}',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: textFieldProfile(
                    controller: phoneController,
                    type: TextInputType.phone,
                    prefix: Icons.phone,
                    label: 'Phone',
                    hintText: '${user.phone}',
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
