import 'package:best_of_nepal/providers/auth_provider.dart';
import 'package:best_of_nepal/screens/login.dart';
import 'package:best_of_nepal/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return authState.when(
      data: (user) {
        if (user != null) {
          return const Profile();
        } else {
          return const Login();
        }
      },
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (error, stackTrace) =>
          Scaffold(body: Center(child: Text("Something went wrong: $error"))),
    );
  }
}
