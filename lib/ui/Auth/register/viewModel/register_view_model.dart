import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/model/user_model.dart';
import 'package:movies/repository/register_repo.dart';
import 'package:movies/ui/Auth/register/registerStates/register_states.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates>{
  final RegisterRepo registerRepo;
  RegisterViewModel(this.registerRepo) : super(RegisterInitialState());

  void register({required UserModel model, required String password})async{
    emit(RegisterLoadingState());
    try{
      final updatedModel = await registerRepo.register(model: model, password: password);
      emit(RegisterSuccessState(updatedModel.id??""));
    }
    catch(e){
      emit(RegisterErrorState(e.toString()));
    }
  }
}