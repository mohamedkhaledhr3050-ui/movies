import 'package:movies/data/model/user_model.dart';

abstract interface class RegisterDao {
  Future<UserModel> register({required UserModel model, required String password});
}
