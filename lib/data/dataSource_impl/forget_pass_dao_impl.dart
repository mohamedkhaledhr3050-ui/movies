import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/dataSource/forget_password_dao.dart';
import 'package:movies/data/model/user_model.dart';

@Injectable(as:ForgetPasswordDao )
class ForgetPassDaoImpl implements ForgetPasswordDao{
  @override
  Future<UserModel> forgetPassword({required UserModel model})async {
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: model.email??"");
      return model;
    }
    on FirebaseAuthException catch(e){
      if (e.code == 'user-not-found' || e.code == 'invalid-credential') {
        throw Exception('This email address is not registered.');
      }
      else if (e.code == 'invalid-email') {
        throw Exception('The email address is badly formatted.');
      }
      throw Exception(e.message ?? 'An unknown Firebase error occurred.');
    }
    catch(e){
      throw Exception('Network error, please try again later.');
    }
  }
  
}