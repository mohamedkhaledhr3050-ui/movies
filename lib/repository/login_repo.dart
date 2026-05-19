abstract interface class LoginRepo {
  Future<String> login({required String email, required String password});
}