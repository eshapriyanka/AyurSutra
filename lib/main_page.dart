import 'package:flutter/material.dart';

import 'package:sih/bookingSession.dart';
import 'package:sih/profile.dart';

// Temporary dashboard placeholder
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Welcome to Dashboard",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(),
    const BookSessionPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
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
                    active: _currentIndex == 0,
                    onTap: () {
                      setState(() => _currentIndex = 0);
                    },
                  ),
                  BottomNavItem(
                    icon: Icons.calendar_month,
                    label: "Schedule",
                    active: _currentIndex == 1,
                    onTap: () {
                      setState(() => _currentIndex = 1);
                    },
                  ),
                  BottomNavItem(
                    icon: Icons.notifications,
                    label: "Updates",
                    active: _currentIndex == 2,
                    onTap: () {
                      setState(() => _currentIndex = 2);
                    },
                  ),
                  BottomNavItem(
                    icon: Icons.person,
                    label: "Profile",
                    active: _currentIndex == 3,
                    onTap: () {
                      setState(() => _currentIndex = 3);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
