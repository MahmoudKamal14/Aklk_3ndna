import 'package:aklk_3ndna/core/cubit/app_cubit/app_cubit.dart';
import 'package:aklk_3ndna/core/cubit/app_cubit/app_states.dart';
import 'package:aklk_3ndna/core/functions/is_arabic.dart';
import 'package:aklk_3ndna/features/auth/presentation/views/forgot_password_view.dart';
import 'package:aklk_3ndna/features/auth/presentation/views/sign_in_view.dart';
import 'package:aklk_3ndna/features/auth/presentation/widget/custom_forgot_password_form.dart';
import 'package:aklk_3ndna/features/settings/presentation/views/edit_profile_view.dart';

import 'package:aklk_3ndna/features/settings/presentation/views/language_view.dart';
import 'package:aklk_3ndna/features/settings/presentation/widgets/custom%20_card_settings_switch.dart';
import 'package:aklk_3ndna/features/settings/presentation/widgets/custom_card_settings.dart';
import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class CustomProfileWidget extends StatelessWidget {
  const CustomProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 30),
              CustomSettingsAppBarSection(),
              const SizedBox(height: 15),
              CustomProfileSampleDataSection(),
              const SizedBox(height: 20),
              CustomDarkModeSection(),
              const SizedBox(height: 15),
              CustomTextSettingsWidge(text: S.of(context).Profile),
              CustomProfileSection(),
              const SizedBox(height: 15),
              CustomTextSettingsWidge(text: S.of(context).Notification),
              CustomNotificationSection(),
              const SizedBox(height: 20),
              CustomTextSettingsWidge(text: S.of(context).GeneralSetting),
              CustomSettingsGeneralSection(),
            ],
          ),
        ),
      ),
    );
  }
}

//! Custom Profile Sample Data Section
class CustomProfileSampleDataSection extends StatelessWidget {
  const CustomProfileSampleDataSection({super.key});
// BlocConsumer<AppCubit, AppStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         var user = AppCubit.get(context).userModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var user = AppCubit.get(context).userModel;
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 38,
                  backgroundImage: NetworkImage(
                    user.image,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfileView(),
                      ),
                    );
                  },
                  icon: Icon(
                    IconlyLight.edit,
                    color: Colors.amber,
                  ),
                ),
                title: Text(user.name),
                subtitle: Text(user.email),
              ),
            ],
          );
        });
  }
}

//! Custom Settings AppBar Section
class CustomSettingsAppBarSection extends StatelessWidget {
  const CustomSettingsAppBarSection({super.key, this.sizeText});
  final double? sizeText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Text(
        S.of(context).Settings,
        textAlign: isArabic() ? TextAlign.right : TextAlign.left,
        style: TextStyle(
          fontSize: sizeText ?? 26,
          color: Colors.black,
        ),
      ),
    );
  }
}

//! Custom Profile Section
class CustomProfileSection extends StatelessWidget {
  const CustomProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CardSettings(
          leading: IconlyLight.profile,
          trailing: Icons.arrow_forward_ios_rounded,
          text: S.of(context).EditProfile,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditProfileView(),
              ),
            );
          },
        ),
        CardSettings(
          leading: IconlyLight.password,
          trailing: Icons.arrow_forward_ios_rounded,
          text: S.of(context).ChangePassword,
          onPressed: () {
            CustomForgotPasswrodForm.pushSignIn = false;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ForgotPasswordView(),
              ),
            );
          },
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}

//! Custom Dark Mode Section
class CustomDarkModeSection extends StatefulWidget {
  const CustomDarkModeSection({super.key});

  @override
  State<CustomDarkModeSection> createState() => _CustomDarkModeSectionState();
}

class _CustomDarkModeSectionState extends State<CustomDarkModeSection> {
  bool _lights = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        CardSettingsSwitch(
          leading: IconlyLight.notification,
          trailing: Switch(
            inactiveThumbColor: Colors.grey,
            activeColor: Colors.amber,
            value: _lights,
            onChanged: (value) {
              setState(() {
                _lights = value;
              });
            },
          ),
          text: S.of(context).DarkMode,
        ),
      ],
    );
  }
}

//! Custom Notification Section
class CustomNotificationSection extends StatefulWidget {
  const CustomNotificationSection({super.key});

  @override
  State<CustomNotificationSection> createState() =>
      _CustomNotificationSectionState();
}

class _CustomNotificationSectionState extends State<CustomNotificationSection> {
  bool _lights = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CardSettingsSwitch(
          leading: IconlyLight.notification,
          trailing: Switch(
            inactiveThumbColor: Colors.grey,
            activeColor: Colors.amber,
            value: _lights,
            onChanged: (value) {
              setState(() {
                _lights = value;
              });
            },
          ),
          text: S.of(context).Notification,
        ),
      ],
    );
  }
}

//! Custom Settings Genera lSection
class CustomSettingsGeneralSection extends StatelessWidget {
  const CustomSettingsGeneralSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Card(
          elevation: 1.0,
          child: ListTile(
            trailing: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => languageView(),
                  ),
                );
              },
              icon: Icon(Icons.arrow_forward_ios_rounded),
              color: Colors.blueGrey,
            ),
            leading: Image.asset(
              'assets/images/arabic.png',
              height: 35,
              color: Colors.amber,
            ),
            title: Text(
              S.of(context).language,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        CardSettings(
          leading: IconlyLight.logout,
          trailing: Icons.arrow_forward_ios_rounded,
          text: S.of(context).Logout,
          onPressed: () {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.question,
              animType: AnimType.scale,
              title: 'Dialog Title',
              body: Text('Logout'),
              btnCancelOnPress: () {},
              btnOkOnPress: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInView(),
                  ),
                );
              },
            )..show();
          },
        ),
      ],
    );
  }
}

//! Custom Text Settings Widge
class CustomTextSettingsWidge extends StatelessWidget {
  const CustomTextSettingsWidge({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Text(
        text,
        textAlign: isArabic() ? TextAlign.right : TextAlign.left,
        style: TextStyle(
          fontSize: 19,
          color: Colors.grey,
        ),
      ),
    );
  }
}
