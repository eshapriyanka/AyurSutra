import 'package:flutter/material.dart';
import 'package:sih/abc.dart';
import 'package:sih/doctor_dashboard.dart';
import 'package:sih/doctor_profile.dart';
import 'package:sih/feedback_doctor.dart';
import 'package:sih/settings.dart';

void main() {
  runApp(const TherapySchedulePage());
}

class TherapySchedulePage extends StatefulWidget {
  const TherapySchedulePage({super.key});

  @override
  State<TherapySchedulePage> createState() => _TherapySchedulePageState();
}

class _TherapySchedulePageState extends State<TherapySchedulePage> {
  int selectedBottomIndex = 0; // keep state here ✅
  // Colors
  static const Color primaryColor = Color(0xFF4CAF50);
  static const Color secondaryColor = Color(0xFFA1887F);
  static const Color backgroundColor = Color(0xFFFDFBF8);
  static const Color textColor = Color(0xFF3E2723);
  static const Color lightGreenColor = Color(0xFFE8F5E9);
  static const Color lightRedColor = Color(
    0xFFFFEBEE,
  ); // Light red for first offline session
  static final Color firstOfflineIconColor = Color.fromARGB(
    255,
    239,
    224,
    212,
  ); // Matches second button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      // HEADER
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: textColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        centerTitle: true,
        title: const Text(
          "Therapy Schedule",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),

      // BODY
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Online Sessions
            const Text(
              "Online Consultation Sessions",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: textColor,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                _buildOnlineSessionCard(
                  "Initial Consultation",
                  "Scheduled",
                  "July 25, 2024",
                  "02:00 PM",
                  "Dr. Meera Vasudevan",
                ),
                const SizedBox(height: 12),
                _buildOnlineSessionCard(
                  "Follow-up Session",
                  "Completed",
                  "July 10, 2024",
                  "11:00 AM",
                  "Dr. Rajesh Khanna",
                  statusColor: Colors.green,
                  statusBg: Colors.green.shade50,
                  icon: Icons.mic_off,
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Offline Sessions
            const Text(
              "Offline Therapy Sessions",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: textColor,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                _buildOfflineSessionCard(
                  "Abhyanga",
                  "Upcoming",
                  "Today, July 20, 2024",
                  "10:00 AM",
                  "Dr. Anjali Sharma",
                  firstOfflineIconColor, // Icon color matches second button
                  Icons.spa,
                  backgroundColor: lightRedColor, // Light red background
                ),
                const SizedBox(height: 12),
                _buildOfflineSessionCard(
                  "Shirodhara",
                  "Upcoming",
                  "July 22, 2024",
                  "09:30 AM",
                  "Dr. Kavya Ramesh",
                  Colors.green,
                  Icons.self_improvement,
                  backgroundColor: Colors.white,
                ),
                const SizedBox(height: 12),
                _buildOfflineSessionCard(
                  "Swedana",
                  "Completed",
                  "July 15, 2024",
                  "08:00 AM",
                  "Dr. Manish Patel",
                  Colors.green,
                  Icons.local_florist,
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ],
        ),
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
                    onTap: () => setState(() => selectedBottomIndex = 2),
                  ),

                  BottomNavItem(
                    icon: Icons.groups,
                    label: "Patients",
                    active: selectedBottomIndex == 1,
                    onTap: () {
                      setState(() => selectedBottomIndex = 1);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PanchakarmaApp1(),
                        ),
                      );
                    },
                  ),
                  BottomNavItem(
                    icon: Icons.spa,
                    label: "Therapies",
                    active: selectedBottomIndex == 2,
                    onTap: () {
                      setState(() => selectedBottomIndex = 2);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TherapySchedulePage(),
                        ),
                      );
                    },
                  ),
                  BottomNavItem(
                    icon: Icons.chat_bubble,
                    label: "Feedback",
                    active: selectedBottomIndex == 3,
                    onTap: () {
                      setState(() => selectedBottomIndex = 3);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PatientFeedbackPage(),
                        ),
                      );
                    },
                  ),

                  BottomNavItem(
                    icon: Icons.settings,
                    label: "Setting",
                    active: selectedBottomIndex == 5,
                    onTap: () {
                      setState(() => selectedBottomIndex = 5);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PanchakarmaSettingsApp3(),
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

  // --- Widgets ---

  Widget _buildOnlineSessionCard(
    String title,
    String status,
    String date,
    String time,
    String doctor, {
    Color statusColor = Colors.grey,
    Color statusBg = const Color(0xFFF5F5F5),
    IconData icon = Icons.videocam,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: lightGreenColor),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: lightGreenColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: primaryColor, size: 28),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: statusBg,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: statusColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  "Date: $date",
                  style: const TextStyle(fontSize: 13, color: secondaryColor),
                ),
                Text(
                  "Time: $time",
                  style: const TextStyle(fontSize: 13, color: secondaryColor),
                ),
                Text(
                  doctor,
                  style: const TextStyle(fontSize: 13, color: secondaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOfflineSessionCard(
    String title,
    String status,
    String date,
    String time,
    String doctor,
    Color iconColor,
    IconData icon, {
    Color backgroundColor = Colors.white,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 28),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: iconColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: iconColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  "Date: $date",
                  style: const TextStyle(fontSize: 13, color: secondaryColor),
                ),
                Text(
                  "Time: $time",
                  style: const TextStyle(fontSize: 13, color: secondaryColor),
                ),
                Text(
                  doctor,
                  style: const TextStyle(fontSize: 13, color: secondaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    Color color, {
    bool isActive = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            color: color,
          ),
        ),
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
