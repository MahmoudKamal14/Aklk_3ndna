import 'package:aklk_3ndna/core/cubit/app_cubit/app_cubit.dart';
import 'package:aklk_3ndna/core/cubit/current_locale/current_locale_cubit.dart';
import 'package:aklk_3ndna/core/cubit/internet_connection/internet_connection_cubit.dart';
import 'package:aklk_3ndna/core/database/cache/cache_helper.dart';
import 'package:aklk_3ndna/core/functions/check_state_chenges.dart';
import 'package:aklk_3ndna/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:aklk_3ndna/core/cubit/current_locale/current_locale_state.dart';
import 'package:aklk_3ndna/core/routes/routes.dart';
import 'package:aklk_3ndna/features/splash/presentation/views/splash_view.dart';
import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  checkStateChanges();
  runApp(
    CustomMultiBlocProvider(),
  );
}

class CustomMultiBlocProvider extends StatelessWidget {
  const CustomMultiBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetConnectionCubit()..checkConnectivity(),
        ),
        BlocProvider(
          create: (context) => CurrentLocaleCubit(),
        ),
        BlocProvider(
          create: (context) => AppCubit()
            ..getUserData()
            ..mealModel
            ..allMeals
            ..getAllMeals(),
        ),
      ],
      child: const Aklk3ndna(),
    );
  }
}

class Aklk3ndna extends StatelessWidget {
  const Aklk3ndna({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentLocaleCubit, CurrentLocaleState>(
      builder: (context, state) {
        var materialApp = MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: Locale(
            (state is ArabicState) ? 'ar' : 'en',
          ),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          routes: routes,
          initialRoute: SplashView.id,
        );
        return materialApp;
      },
    );
  }
}
