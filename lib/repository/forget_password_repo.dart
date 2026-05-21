import 'package:movies/data/model/user_model.dart';

abstract interface class ForgetPasswordRepo {
  Future<UserModel>forgetPassword({required UserModel model});
}