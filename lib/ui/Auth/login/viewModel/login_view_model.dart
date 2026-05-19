import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/repository/login_repo.dart';
import 'package:movies/ui/Auth/login/loginStates/login_states.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates>{
  final LoginRepo loginRepo;
  LoginViewModel(this.loginRepo):super(LoginInitialState());

  void login({required String email, required String password})async{
    emit(LoadingState());
    try{
      final uid = await loginRepo.login(email: email, password: password);
      emit(SuccessState(uid));
    }catch(e){
      emit(ErrorState(e.toString()));
    }
  }

}