import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/model/user_model.dart';
import 'package:movies/repository/forget_password_repo.dart';
import 'package:movies/ui/Auth/forgetPassword/forgetPassStates/forget_password_states.dart';

@injectable
class ForgetPasswordViewmodel extends Cubit<ForgetPasswordStates>{
  final ForgetPasswordRepo forgetPasswordRepo;
  ForgetPasswordViewmodel(this.forgetPasswordRepo) : super(ForgetInitialState());

  Future<void> forgetPassword({required UserModel model})async{
    emit(ForgetLoadingState());

    try{
      final userModel = await forgetPasswordRepo.forgetPassword(model: model);
      emit(ForgetSuccessState(userModel.id??""));
    }
    catch(e){
      emit(ForgetErrorState(e.toString()));
    }
  }
}