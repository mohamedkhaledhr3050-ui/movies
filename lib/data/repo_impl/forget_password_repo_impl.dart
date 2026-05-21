import 'package:injectable/injectable.dart';
import 'package:movies/data/dataSource/forget_password_dao.dart';
import 'package:movies/data/model/user_model.dart';
import 'package:movies/repository/forget_password_repo.dart';

@Injectable(as: ForgetPasswordRepo)
class ForgetPasswordRepoImpl implements ForgetPasswordRepo{
  final ForgetPasswordDao forgetPasswordDao;

  ForgetPasswordRepoImpl(this.forgetPasswordDao);

  @override
  Future<UserModel> forgetPassword({required UserModel model})async {
    return await forgetPasswordDao.forgetPassword(model: model);
  }

}