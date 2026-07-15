import 'package:best_of_nepal/providers/auth_provider.dart';
import 'package:best_of_nepal/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Register extends ConsumerStatefulWidget {
  const Register({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<Register> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isHidden = true;

  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await ref
          .read(authRepositoryProvider)
          .signUp(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
      await ref.read(authRepositoryProvider).signOut();

      if (mounted) {
        Navigator.pop(context, true);
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message ?? "registration failed";
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            // color: Colors.blueGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.person, size: 80, color: Colors.white),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("ACCOUNT REGISTRATION"),

                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_2),
                          hintText: "enter your email",
                          labelText: "Email",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "email is required";
                          }
                          if (!value.contains('@')) {
                            return 'enter valid email';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        obscureText: _isHidden,
                        controller: passwordController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () => setState(() {
                              _isHidden = !_isHidden;
                            }),
                            icon: _isHidden
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                          ),
                          hintText: "enter your password",
                          labelText: "Password",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'enter password';
                          }
                          if (value.length < 6) {
                            return 'password must be at least 6 character ';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 15),

                    if (_errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          _errorMessage!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(220, 55),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: _isLoading ? null : _register,
                      child: _isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 1),
                            )
                          : Text(
                              "Register",
                              style: TextStyle(color: Colors.white),
                            ),
                    ),
                    SizedBox(height: 20),

                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Text("Already have an account?"),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
