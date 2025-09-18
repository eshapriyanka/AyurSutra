import 'package:flutter/material.dart';

void main() {
  runApp(const TherapyApp());
}

class TherapyApp extends StatelessWidget {
  const TherapyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Therapy Schedule",
      debugShowCheckedModeBanner: false,
      home: const TherapySchedulePage(),
    );
  }
}

class TherapySchedulePage extends StatelessWidget {
  const TherapySchedulePage({super.key});

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
          onPressed: () {},
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

      // FOOTER
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Buttons
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Book Online Consultation",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(
                      255,
                      213,
                      181,
                      154,
                    ), // Second button color
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Book Therapy Session",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          // Bottom Navigation
          Container(
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: lightGreenColor)),
              color: backgroundColor,
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.grid_view, "Dashboard", secondaryColor),
                _buildNavItem(
                  Icons.calendar_month,
                  "Schedule",
                  primaryColor,
                  isActive: true,
                ),
                _buildNavItem(Icons.person, "Profile", secondaryColor),
              ],
            ),
          ),
        ],
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
