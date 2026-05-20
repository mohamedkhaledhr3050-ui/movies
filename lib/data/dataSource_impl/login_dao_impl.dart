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

    try{
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!.uid;
    }
    on FirebaseAuthException catch(e){
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      }
      else if (e.code == 'invalid-credential' || e.code == 'user-not-found') {
        throw Exception('Incorrect email or password. Please try again.');
      }
      else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
      else if (e.code == 'invalid-email') {
        throw Exception('The email address is badly formatted.');
      }
      else if (e.code == 'user-disabled') {
        throw Exception('This user account has been disabled.');
      }
      throw Exception(e.message ?? 'An unknown Firebase error occurred.');
    }
    catch(e){
      throw Exception('Network error or connection failed. Please try again.');
    }
  }
}
