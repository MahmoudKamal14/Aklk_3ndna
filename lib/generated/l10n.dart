// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Aklk 3ndna`
  String get title {
    return Intl.message(
      'Aklk 3ndna',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `SKIP`
  String get skip {
    return Intl.message(
      'SKIP',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `NEXT`
  String get next {
    return Intl.message(
      'NEXT',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `GET STARTED`
  String get getStarted {
    return Intl.message(
      'GET STARTED',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Welcome `
  String get welcome {
    return Intl.message(
      'Welcome ',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `It’s a pleasure to meet you. We are excited that you’re here so let’s get started!`
  String get welcomeBody {
    return Intl.message(
      'It’s a pleasure to meet you. We are excited that you’re here so let’s get started!',
      name: 'welcomeBody',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account ? `
  String get AlreadyHaveAnAccount {
    return Intl.message(
      'Already have an account ? ',
      name: 'AlreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Do you have an account ? `
  String get DoYouHaveAnAccount {
    return Intl.message(
      'Do you have an account ? ',
      name: 'DoYouHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `I agree to your terms and conditions`
  String get TermsAndConditions {
    return Intl.message(
      'I agree to your terms and conditions',
      name: 'TermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `is empty!`
  String get isEmpty {
    return Intl.message(
      'is empty!',
      name: 'isEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password ?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password ?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your registered email below to receive password reset instruction`
  String get supTitleForgetPassword {
    return Intl.message(
      'Enter your registered email below to receive password reset instruction',
      name: 'supTitleForgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `OOPS!`
  String get oops {
    return Intl.message(
      'OOPS!',
      name: 'oops',
      desc: '',
      args: [],
    );
  }

  /// `NO INTERNET`
  String get noInternet {
    return Intl.message(
      'NO INTERNET',
      name: 'noInternet',
      desc: '',
      args: [],
    );
  }

  /// `Please check your network connection.`
  String get PleaseCheckYourNetWorkConnection {
    return Intl.message(
      'Please check your network connection.',
      name: 'PleaseCheckYourNetWorkConnection',
      desc: '',
      args: [],
    );
  }

  /// `TRY AGAIN`
  String get TyrAgain {
    return Intl.message(
      'TRY AGAIN',
      name: 'TyrAgain',
      desc: '',
      args: [],
    );
  }

  /// `Meal details`
  String get MealDetails {
    return Intl.message(
      'Meal details',
      name: 'MealDetails',
      desc: '',
      args: [],
    );
  }

  /// `Order Now`
  String get orderNow {
    return Intl.message(
      'Order Now',
      name: 'orderNow',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
