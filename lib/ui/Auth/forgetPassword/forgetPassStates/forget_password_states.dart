sealed class ForgetPasswordStates {}

class ForgetLoadingState extends ForgetPasswordStates{}

class ForgetErrorState extends ForgetPasswordStates{
  String error;
  ForgetErrorState(this.error);
}

class ForgetInitialState extends ForgetPasswordStates {}

class ForgetSuccessState extends ForgetPasswordStates{
  final String uid;
  ForgetSuccessState(this.uid);
}