abstract interface class LoginDao {
  Future<String>login({required String email, required String password});
}