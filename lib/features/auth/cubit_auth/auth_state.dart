class AuthState {}

final class AuthInitial extends AuthState {}

//! SignUp States
final class SignupLoadingState extends AuthState {}

final class SignupSuccessState extends AuthState {}

final class SignupFailureState extends AuthState {
  final String errMessage;

  SignupFailureState({required this.errMessage});
}

//! SignIn States
final class SigninLoadingState extends AuthState {}

final class SigninSuccessState extends AuthState {}

final class SigninFailureState extends AuthState {
  final String errMessage;

  SigninFailureState({required this.errMessage});
}

//! Reset Password State
final class ResetPasswordLoadingState extends AuthState {}

final class ResetPasswordSuccessState extends AuthState {}

final class ResetPasswordFailureState extends AuthState {
  final String errMessage;

  ResetPasswordFailureState({required this.errMessage});
}

//! Terms And Condition state
final class TermsAndConditionUpdateState extends AuthState {}

//! Obscure Password state
final class ObscurePasswordTextUpdateState extends AuthState {}
