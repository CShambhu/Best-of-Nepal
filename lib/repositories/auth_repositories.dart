import 'package:best_of_nepal/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositories {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  UserModel? _toUserModel(User? firebaseUser) {
    if (firebaseUser == null) return null;
    return UserModel(
      id: firebaseUser.uid,
      username: firebaseUser.displayName ?? "User",
      email: firebaseUser.email,
      profileImage: firebaseUser.photoURL,
    );
  }

  Stream<UserModel?> authStateChanges() {
    return _firebaseAuth.authStateChanges().map(_toUserModel);
  }

  Future<void> signUp({required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signIn({required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
