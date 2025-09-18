import 'package:flutter/material.dart';
import 'package:sih/dashboard.dart';
import 'package:sih/signup.dart';

class PatientLoginPage extends StatefulWidget {
  final String? name;
  final String? email;
  final String? age;

  const PatientLoginPage({Key? key, this.name, this.email, this.age})
    : super(key: key);

  @override
  _PatientLoginPageState createState() => _PatientLoginPageState();
}

class _PatientLoginPageState extends State<PatientLoginPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

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

                  // Email Field
                  TextFormField(
                    initialValue: widget.email ?? '',
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your email";
                      }
                      if (!RegExp(
                        r'^[a-zA-Z0-9._%+-]+@gmail\.com$',
                      ).hasMatch(value)) {
                        return "Enter a valid Gmail address";
                      }
                      return null;
                    },
                    onChanged: (value) => setState(() => email = value),
                  ),

                  const SizedBox(height: 25),

                  // Password Field
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your password";
                      }
                      if (value.length < 8) {
                        return "Password must be at least 8 characters";
                      }
                      if (!RegExp(r'^(?=.*[a-z])').hasMatch(value)) {
                        return "Password must contain a lowercase letter";
                      }
                      if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
                        return "Password must contain an uppercase letter";
                      }
                      if (!RegExp(r'^(?=.*\d)').hasMatch(value)) {
                        return "Password must contain a number";
                      }
                      if (!RegExp(r'^(?=.*[!@#\$&*~])').hasMatch(value)) {
                        return "Password must contain a special character (!@#\$&*~)";
                      }
                      return null;
                    },
                    onChanged: (value) => setState(() => password = value),
                  ),

                  const SizedBox(height: 20),

                  // Login Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("Login with $email & $password");

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => PatientDashboardPage(
                                  userName:
                                      widget.name ?? "User", // fallback if null
                                  email:
                                      widget.email ??
                                      email, // fallback to entered email
                                  age: widget.age ?? "0", // fallback if null
                                ),
                          ),
                        );
                      }
                    },

                    child: const Text("Login"),
                  ),

                  const SizedBox(height: 12),

                  // Signup Redirect
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PatientSignupPage(),
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
