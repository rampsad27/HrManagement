import 'package:firebase_auth/firebase_auth.dart';
import 'package:hr_management/data/models/login/login_model.dart';
import 'package:hr_management/data/models/user/user_model.dart';

abstract interface class ILogInRepository {
  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password);
  Future<void> signOut();
  Future<UserCredential> getUserInfo();
  // Future<List<LogInModel>> getUser();
}
