sealed class RegisterStates {}

class RegisterLoadingState extends RegisterStates{}

class RegisterErrorState extends RegisterStates{
  String error;
  RegisterErrorState(this.error);
}

class RegisterInitialState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final String uid;
  RegisterSuccessState(this.uid);
}