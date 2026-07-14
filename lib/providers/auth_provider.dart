import 'package:best_of_nepal/models/user_model.dart';
import 'package:best_of_nepal/repositories/auth_repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
AuthRepositories authRepository(Ref ref) {
  return AuthRepositories();
}

@riverpod
Stream<UserModel?> authState(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return repository.authStateChanges();
}
