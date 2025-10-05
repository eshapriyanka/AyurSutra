import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sih/landing.dart';
import 'package:sih/notifications.dart';
import 'package:sih/profile.dart';
import 'package:sih/progress.dart';

class PatientDashboardPage extends StatefulWidget {
  final String uid;
  const PatientDashboardPage({Key? key, required this.uid}) : super(key: key);

  @override
  State<PatientDashboardPage> createState() => _PatientDashboardPageState();
}

class _PatientDashboardPageState extends State<PatientDashboardPage> {
  int selectedBottomIndex = 0;
  bool _isTherapyExpanded = false;

  String? userName;
  String? email;
  String? age;

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
  }

  Future<void> _fetchUserDetails() async {
    try {
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance
              .collection('patients')
              .doc(widget.uid)
              .get();

      if (userDoc.exists) {
        setState(() {
          userName = userDoc['name'] ?? "Guest";
          email = userDoc['email'] ?? "Unknown";
          age = userDoc['age']?.toString() ?? "0";
        });
      }
    } catch (e) {
      debugPrint("Error fetching user details: $e");
    }
  }

  List<Widget> get _pages => [
    dashboardContent(),
    StitchDesignApp(),
    NotificationsScreen1(),
    const ProfilePage(), // ✅ no arguments now
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9EC),
      body: _pages[selectedBottomIndex],

      bottomNavigationBar: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(height: 1, color: Color(0xFFEDF3E8)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomNavItem(
                    icon: Icons.grid_view,
                    label: "Dashboard",
                    active: selectedBottomIndex == 0,
                    onTap: () => setState(() => selectedBottomIndex = 0),
                  ),
                  BottomNavItem(
                    icon: Icons.calendar_month,
                    label: "Schedule",
                    active: selectedBottomIndex == 1,
                    onTap: () => setState(() => selectedBottomIndex = 1),
                  ),
                  BottomNavItem(
                    icon: Icons.notifications,
                    label: "Updates",
                    active: selectedBottomIndex == 2,
                    onTap: () => setState(() => selectedBottomIndex = 2),
                  ),
                  BottomNavItem(
                    icon: Icons.person,
                    label: "Profile",
                    active: selectedBottomIndex == 3,
                    onTap: () => setState(() => selectedBottomIndex = 3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ---------------- Dashboard Content ----------------
  Widget dashboardContent() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Hello, ${userName ?? 'Loading...'}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3D403A),
              ),
            ),
            CircleAvatar(
              radius: 24,
              backgroundImage: const NetworkImage(
                "https://i.pravatar.cc/150", // placeholder avatar
              ),
            ),
          ],
        ),
        // ... rest of your dashboard widgets ...
      ],
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;

  const BottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: active ? const Color(0xFF141B0E) : const Color(0xFF739550),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: active ? FontWeight.bold : FontWeight.w500,
              color: active ? const Color(0xFF141B0E) : const Color(0xFF739550),
            ),
          ),
        ],
      ),
    );
  }
}
