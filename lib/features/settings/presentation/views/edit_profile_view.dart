//EditProfileView

import 'package:aklk_3ndna/core/cubit/app_cubit/app_cubit.dart';
import 'package:aklk_3ndna/core/cubit/app_cubit/app_states.dart';
import 'package:aklk_3ndna/core/utils/app_controller.dart';
import 'package:aklk_3ndna/core/widgets/custom_button.dart';
import 'package:aklk_3ndna/features/settings/presentation/widgets/image_profile.dart';
import 'package:aklk_3ndna/features/settings/presentation/widgets/text_field_profile.dart';
import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var user = AppCubit.get(context).userModel;
        var editProfileImage = AppCubit.get(context).profileImageFile;

        nameController.text = user.userName;
        phoneController.text = user.phone;
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              title: Text(
                S.of(context).EditProfile,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  if (state is UpdateUserDataLoadingState)
                    const LinearProgressIndicator(
                      color: Colors.amber,
                      backgroundColor: Colors.amber,
                    ),
                  SizedBox(height: 10),
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
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: textFieldProfile(
                      controller: nameController,
                      type: TextInputType.name,
                      prefix: Icons.person_2,
                      label: 'Name',
                      hintText: '${user.userName}',
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
                  SizedBox(height: 250),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CustomButton(
                        onPressed: () {
                          AppCubit.get(context).updateUser(
                            userName: nameController.text,
                            phone: phoneController.text,
                            email: emailController.text,
                          );
                        },
                        text: S.of(context).Update),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
