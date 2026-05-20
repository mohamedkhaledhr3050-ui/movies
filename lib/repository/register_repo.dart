import 'package:movies/data/model/user_model.dart';

abstract interface class RegisterRepo {
  Future<UserModel> register({required UserModel model , required String password});
}