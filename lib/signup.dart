import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sih/login.dart';
import 'package:sih/main_page.dart';

class PatientSignupPage extends StatefulWidget {
  const PatientSignupPage({Key? key}) : super(key: key);

  @override
  _PatientSignupPageState createState() => _PatientSignupPageState();
}

class _PatientSignupPageState extends State<PatientSignupPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String age = '';
  String email = '';
  String password = '';
  bool loading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signupPatient() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => loading = true);

    try {
      final trimmedEmail = email.trim();
      final trimmedName = name.trim();
      final trimmedAge = age.trim();

      // Create user in FirebaseAuth
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: trimmedEmail,
            password: password,
          );

      String uid = userCredential.user!.uid;

      // Save user details in Firestore
      await _firestore.collection("patients").doc(uid).set({
        "name": trimmedName,
        "age": trimmedAge,
        "email": trimmedEmail,
        "createdAt": Timestamp.now(),
      });

      if (!mounted) return;

      // ✅ Stop loader
      setState(() => loading = false);

      // ✅ Navigate safely
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const MainPage()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      setState(() => loading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? "Signup failed")));
    } catch (e) {
      if (!mounted) return;
      setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Something went wrong. Please try again."),
        ),
      );
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
                    "Patient Signup",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Name
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Full Name",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator:
                        (value) => value!.isEmpty ? "Enter your name" : null,
                    onChanged: (value) => name = value,
                  ),
                  const SizedBox(height: 25),
                  // Age
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Age",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.cake),
                    ),
                    validator:
                        (value) => value!.isEmpty ? "Enter your age" : null,
                    onChanged: (value) => age = value,
                  ),
                  const SizedBox(height: 25),
                  // Email
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
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
                  // Password
                  TextFormField(
                    obscureText: true,
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
                        onPressed: signupPatient,
                        child: const Text("Sign Up"),
                      ),
                  const SizedBox(height: 25),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PatientLoginPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Already have an account? Login",
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
