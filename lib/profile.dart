import 'package:flutter/material.dart';
import 'package:sih/dashboard.dart';
import 'package:sih/landing.dart';
import 'package:sih/notifications.dart';

void main() {
  runApp(const StitchDesignApp1());
}

class StitchDesignApp1 extends StatelessWidget {
  const StitchDesignApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Stitch Design",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Lexend",
        primaryColor: const Color(0xFF80df20),
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedTabIndex = 0; // for personal info / medical / therapy tabs
  int selectedBottomIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FBE9),
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.8),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile image
            CircleAvatar(
              radius: 64,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                "https://lh3.googleusercontent.com/aida-public/AB6AXuC1ZsPMC7LoT631ftt9eN6uhWZUf-BAcUx43n2PCgv35wxyhxs98nOvPXDjicEfQjVc3KF7rWy8ZCzV-rqy1hDi4wOA29ZUfMg5zmjRcUo_NAfe-pf2iaiVjwCtkYQYY9aMc6cT_8pl_44YKXJgSmuJK06FtLJ6fItHoatcxAIbh3ezNziW0ua0ssy7Zj2r3zlwLfvgOVMALDd_eCi1_dllVrifQ6ozCx51E3XHWwMN4qwnw356bx7fYfnD2og1BMlPN3i7jZYvfvw", // demo avatar
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Dr. Ananya Sharma",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Text(
              "Ayurvedic Practitioner",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF519815),
              ),
            ),
            const SizedBox(height: 24),

            // Tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                tabItem("Personal Info", 0),
                tabItem("Medical History", 1),
                tabItem("Therapy Records", 2),
              ],
            ),
            const SizedBox(height: 24),

            // Tab content
            if (selectedTabIndex == 0)
              sectionCard(
                title: "Personal Details",
                fields: const [
                  {"label": "Age", "value": "35"},
                  {"label": "Gender", "value": "Female"},
                  {"label": "Contact", "value": "+91 9876543210"},
                  {"label": "Email", "value": "ananya.sharma@example.com"},
                ],
              )
            else if (selectedTabIndex == 1)
              sectionCard(
                title: "Medical Information",
                fields: const [
                  {"label": "Allergies", "value": "None"},
                  {"label": "Current Conditions", "value": "Stress Management"},
                  {"label": "Past Treatments", "value": "Ayurvedic Detox"},
                ],
              )
            else if (selectedTabIndex == 2)
              sectionCard(
                title: "Therapy Records",
                fields: const [
                  {"label": "Last Session", "value": "15 Sep 2025"},
                  {
                    "label": "Therapist Notes",
                    "value": "Recommended meditation",
                  },
                  {"label": "Next Session", "value": "22 Sep 2025"},
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

  Widget tabItem(String title, int index) {
    bool selected = selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTabIndex = index;
        });
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              color: selected ? const Color(0xFF69c017) : Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          if (selected)
            Container(height: 2, width: 60, color: const Color(0xFF80df20)),
        ],
      ),
    );
  }

  Widget sectionCard({
    required String title,
    required List<Map<String, String>> fields,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Edit",
                  style: TextStyle(color: Color(0xFF69c017)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Column(
            children:
                fields
                    .map(
                      (f) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                f["label"]!,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                f["value"]!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
          ),
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
