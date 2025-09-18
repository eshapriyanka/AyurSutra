import 'package:flutter/material.dart';
import 'package:sih/dashboard.dart';
import 'package:sih/landing.dart';
import 'package:sih/profile.dart';

class NotificationsScreen1 extends StatefulWidget {
  const NotificationsScreen1({super.key});

  @override
  State<NotificationsScreen1> createState() => _NotificationsScreen1State();
}

class _NotificationsScreen1State extends State<NotificationsScreen1> {
  int selectedBottomIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9EC), // soft beige
      appBar: AppBar(
        backgroundColor: const Color(0xFFE6F5D8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Notifications",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Pre-Procedure Precautions",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          _buildNotificationTile(
            icon: Icons.local_drink,
            title: "Hydration",
            subtitle: "Drink warm water before therapy",
          ),
          _buildNotificationTile(
            icon: Icons.restaurant,
            title: "Diet",
            subtitle: "Avoid heavy meals before therapy",
          ),
          _buildNotificationTile(
            icon: Icons.access_time,
            title: "Arrival",
            subtitle: "Arrive 15 minutes early",
          ),
          const SizedBox(height: 24),
          const Text(
            "Post-Procedure Care",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          _buildNotificationTile(
            icon: Icons.bed,
            title: "Rest",
            subtitle: "Rest for 2 hours after therapy",
          ),
          _buildNotificationTile(
            icon: Icons.fastfood,
            title: "Diet",
            subtitle: "Eat light, easily digestible food",
          ),
          _buildNotificationTile(
            icon: Icons.directions_run,
            title: "Activity",
            subtitle: "Avoid strenuous activities",
          ),
        ],
      ),
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
                    onTap: () {
                      setState(() => selectedBottomIndex = 0);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => PatientDashboardPage(
                                userName: 'namewwww',
                                email: 'demo@gmail.com',
                                age: '22',
                              ),
                        ),
                      );
                    },
                  ),
                  BottomNavItem(
                    icon: Icons.calendar_month,
                    label: "Schedule",
                    active: selectedBottomIndex == 1,
                    onTap: () {
                      setState(() => selectedBottomIndex = 1);
                      // Replace with your actual page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StitchDesignApp(),
                        ),
                      );
                    },
                  ),

                  BottomNavItem(
                    icon: Icons.notifications,
                    label: "Updates",
                    active: selectedBottomIndex == 2,
                    onTap: () {
                      setState(() => selectedBottomIndex = 2);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationsScreen1(),
                        ),
                      );
                    },
                  ),
                  BottomNavItem(
                    icon: Icons.person,
                    label: "Profile",
                    active: selectedBottomIndex == 3,
                    onTap: () {
                      setState(() => selectedBottomIndex = 3);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StitchDesignApp1(),
                        ),
                      );
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

  Widget _buildNotificationTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.green.shade100,
            child: Icon(icon, color: Colors.green, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          const Icon(Icons.circle, color: Colors.green, size: 12), // green dot
        ],
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
