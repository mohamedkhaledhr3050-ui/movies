import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/dataSource/login_dao.dart';

@Injectable(as: LoginDao)
class LoginDaoImpl implements LoginDao {
  LoginDaoImpl();

  @override
  Future<String> login({
    required String email,
    required String password,
  }) async {

    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user!.uid;
  }
}
