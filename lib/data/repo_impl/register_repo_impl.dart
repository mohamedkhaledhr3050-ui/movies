import 'package:injectable/injectable.dart';
import 'package:movies/data/dataSource/register_dao.dart';
import 'package:movies/data/model/user_model.dart';
import 'package:movies/repository/register_repo.dart';

@Injectable(as: RegisterRepo)
class RegisterRepoImpl implements RegisterRepo{
  final RegisterDao registerDao;
  RegisterRepoImpl(this.registerDao);
  @override
  Future<UserModel> register({required UserModel model, required String password}) async{
    return await registerDao.register(model: model, password: password);
  }

}