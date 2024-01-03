import 'dart:io';

import 'package:aklk_3ndna/core/cubit/app_cubit/app_cubit.dart';
import 'package:aklk_3ndna/core/models/user_model.dart';
import 'package:aklk_3ndna/core/utils/app_colors.dart';
import 'package:aklk_3ndna/core/utils/app_controller.dart';
import 'package:flutter/material.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({
    super.key,
    required this.editProfileImage,
    required this.user,
  });

  final File? editProfileImage;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 64,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundImage: editProfileImage == null
                    ? NetworkImage('${user.image}')
                    : FileImage(editProfileImage!) as ImageProvider,
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
      ],
    );
  }
}

class UpdateProfileImage extends StatelessWidget {
  const UpdateProfileImage({
    super.key,
    required this.editProfileImage,
  });

  final File? editProfileImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: OutlinedButton(
            style:
                ButtonStyle(backgroundColor: MaterialStatePropertyAll(color)),
            onPressed: () {
              AppCubit.get(context).uploadProfileImage(
                userName: nameController.text,
                phone: phoneController.text,
                email: emailController.text,
              );
              print('$editProfileImage');
            },
            child: const Text(
              'Update Profile Image',
              style: TextStyle(
                color: Colors.black,
              ),
            )),
      ),
    );
  }
}
