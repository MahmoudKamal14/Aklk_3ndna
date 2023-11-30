import 'package:aklk_3ndna/core/database/cache/cache_helper.dart';
import 'package:aklk_3ndna/core/services/service_locator.dart';
import 'package:aklk_3ndna/core/utils/app_assets.dart';
import 'package:aklk_3ndna/core/widgets/custom_button.dart';
import 'package:aklk_3ndna/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:flutter/material.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});
  static const String id = 'GetStartedView';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: Image.asset(
                    Assets.imagesGetStartedCircleBackground,
                    width: 437,
                    height: 437,
                  ),
                ),
                Positioned(
                  left: 85,
                  right: 85,
                  top: 258,
                  child: Image.asset(
                    Assets.imagesGetStartedIllustration,
                    width: 213.49124,
                    height: 243.09457,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Center(
                child: Text(
                  S.of(context).welcome,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Center(
                child: Text(
                  S.of(context).welcomeBody,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: CustomButton(
                text: S.of(context).getStarted,
                onPressed: () {
                  getIt<CacheHelper>()
                      .saveData(key: GetStartedView.id, value: true);
                  Navigator.pushReplacementNamed(
                    context,
                    OnBoardingView.id,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
