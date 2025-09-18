import 'package:flutter/material.dart';
import 'package:sih/login.dart';
import 'package:sih/therapy.dart';

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9EC), // soft beige background
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Background illustration
                SizedBox(
                  height: 160,

                  child: Center(
                    child: Opacity(
                      opacity: 0.4,
                      child: Image.network(
                        "https://lh3.googleusercontent.com/aida-public/AB6AXuAzMX6cldpNiaY4gJ1lxAL5Sduw-Fj6aJHymOMV3F9_pIWV1I5o-WZLjVTCXBp4sIrBWWKgoPXjUn6_wXqJLSCGUZ7xOpUP08YDKfJE2GQen-lsOxmiZk44Fr_k1sVQzuFD7TZo5X4sYc00LbrSDqKKj8JiSsWI7W2gZB4W8ZRUGEfGTLxK-9PkY_k369lYG2bSgjQ7L6FIMhMK1ZyUKl-6xJWfZ2ZBOBb9TuRNq6aNtVDvUQqwtpowspAGd_O_Ijh301nc4NZXpc0",
                        height: 220,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Title
                const Text(
                  "Continue as",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6F3410),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                // Options
                _buildRoleCard(
                  context,
                  icon: Icons.medical_services,
                  title: "Doctor",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => TherapyApp(), // direct page reference
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                _buildRoleCard(
                  context,
                  icon: Icons.person,
                  title: "Patient",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                PatientLoginPage(), // direct page reference
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.brown.withOpacity(0.15),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: const Color(0xFFFBDCA9),
              child: Icon(icon, color: Color(0xFFCA6516), size: 30),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF421C08),
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFFF8C775),
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
