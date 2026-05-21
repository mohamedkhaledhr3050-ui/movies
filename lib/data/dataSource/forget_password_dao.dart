import 'package:movies/data/model/user_model.dart';

abstract interface class ForgetPasswordDao {
  Future<UserModel> forgetPassword({required UserModel model});
}