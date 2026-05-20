import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/remote/firestore/firestore_manager.dart';
import 'package:movies/data/dataSource/register_dao.dart';
import 'package:movies/data/model/user_model.dart';

@Injectable(as: RegisterDao)
class RegisterDaoImpl implements RegisterDao{
  @override
  Future<UserModel> register({required UserModel model, required String password})async {
    try{
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: model.email??"", password: password);
      model.id = credential.user!.uid;
      await FirestoreManager.addUser(uid: model.id??"", user: model);
      return model;
    }on FirebaseAuthException catch(e){
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      }
      else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
      else if (e.code == 'invalid-email') {
        throw Exception('The email address is not valid.');
      }
      throw Exception(e.message ?? 'An unknown Firebase error occurred.');
    }
    catch (e) {
      throw Exception('Network error or connection failed. Please try again.');
    }
  }

}