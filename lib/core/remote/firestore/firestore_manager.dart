import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies/data/model/user_model.dart';

class FirestoreManager {
  static CollectionReference<UserModel> getUserCollection(){
    var collection = FirebaseFirestore.instance.collection("User").withConverter(
      fromFirestore: (snapshot, options) {
        Map<String, dynamic>? json = snapshot.data();
        return UserModel.fromFirestore(json);
      },
      toFirestore: (user, options) {
        return user.toFirestore();
      },
    );

    return collection;
  }

  static Future<void> addUser({required String uid, required UserModel user}){
    var collection = getUserCollection();
    var docs = collection.doc(uid);
    return docs.set(user);
  }
}