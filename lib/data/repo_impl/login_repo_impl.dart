import 'package:injectable/injectable.dart';
import 'package:movies/data/dataSource/login_dao.dart';
import 'package:movies/repository/login_repo.dart';

@Injectable(as: LoginRepo)
class LoginRepoImpl implements LoginRepo{
  final LoginDao loginDao;
  LoginRepoImpl({required this.loginDao});
  @override

  Future<String> login({required String email, required String password})async {
    return await loginDao.login(email: email, password: password);
  }
}