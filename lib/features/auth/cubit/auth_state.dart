abstract class AuthStates {}

final class RegisterInitial extends AuthStates {}

final class ChangePasswordVisibility extends AuthStates {}
////////////////////////////////////////////////////////

// Register

class RegisterUserLoadingState extends AuthStates {}

class RegisterUserSuccessState extends AuthStates {
  late final String uid;
  RegisterUserSuccessState(this.uid);
}

class RegisterUserErrorState extends AuthStates {
  late final String error;
  RegisterUserErrorState(this.error);
}

class CreateUserLoadingState extends AuthStates {}

class CreateUserSuccessState extends AuthStates {}

class CreateUserErrorState extends AuthStates {
  late final String error;
  CreateUserErrorState(this.error);
}
////////////////////////////////////////////////////////
// Login
class LoginInUserLoadingState extends AuthStates {}

class LoginInUserSuccessState extends AuthStates {
  late final String uid;
  LoginInUserSuccessState(this.uid);
}

class LoginInUserErrorState extends AuthStates {
  late final String error;
  LoginInUserErrorState(this.error);
}


final class TermsAndConditionUpdateState extends AuthStates {}

final class ObscurePasswordTextUpdateState extends AuthStates {}
