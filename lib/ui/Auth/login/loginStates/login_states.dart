sealed class LoginStates {}

class LoadingState extends LoginStates{}

class ErrorState extends LoginStates{
  String error;
  ErrorState(this.error);
}

class LoginInitialState extends LoginStates {}

class SuccessState extends LoginStates{
  final String uid;
  SuccessState(this.uid);
}