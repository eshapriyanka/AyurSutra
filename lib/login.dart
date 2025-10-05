import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sih/dashboard.dart';
import 'package:sih/signup.dart';

class PatientLoginPage extends StatefulWidget {
  final String? email;

  const PatientLoginPage({Key? key, this.email}) : super(key: key);

  @override
  _PatientLoginPageState createState() => _PatientLoginPageState();
}

class _PatientLoginPageState extends State<PatientLoginPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool loading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginPatient() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => loading = true);

    try {
      // Firebase Auth login
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      String uid = userCredential.user!.uid;

      if (mounted) {
        setState(() => loading = false);

        // Navigate with uid, let dashboard fetch Firestore data
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => PatientDashboardPage(uid: uid)),
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() => loading = false);

      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = "No user found for this email.";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Invalid password. Please try again.";
      } else if (e.code == 'invalid-email') {
        errorMessage = "The email address is not valid.";
      } else if (e.code == 'network-request-failed') {
        errorMessage = "No internet connection. Please try again.";
      } else {
        errorMessage = e.message ?? "Login failed. Please try again.";
      }

      if (mounted) {
        showDialog(
          context: context,
          builder:
              (_) => AlertDialog(
                title: const Text("Login Error"),
                content: Text(errorMessage),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("OK"),
                  ),
                ],
              ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8E9),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 600,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6)],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Patient Login",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Email field
                  TextFormField(
                    initialValue: widget.email ?? '',
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator:
                        (value) => value!.isEmpty ? "Enter your email" : null,
                    onChanged: (value) => email = value,
                  ),
                  const SizedBox(height: 25),

                  // Password field
                  TextFormField(
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator:
                        (value) =>
                            value!.isEmpty ? "Enter your password" : null,
                    onChanged: (value) => password = value,
                  ),
                  const SizedBox(height: 20),

                  // Login button
                  loading
                      ? const CircularProgressIndicator(color: Colors.green)
                      : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          minimumSize: const Size(double.infinity, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: loginPatient,
                        child: const Text("Login"),
                      ),
                  const SizedBox(height: 12),

                  // Signup redirect
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PatientSignupPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Don't have an account? Sign up",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
