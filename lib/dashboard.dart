// dashboard.dart
import 'package:flutter/material.dart';
import 'package:sih/landing.dart'; // provides StitchDesignApp (your app)
import 'package:sih/notifications.dart';
import 'package:sih/profile.dart';
import 'package:sih/progress.dart'; // provides DesignApp (your app)

// NOTE: do NOT import notifications.dart here to avoid circular imports.
// If you prefer to use your external NotificationsScreen1, import it instead,
// but ensure notifications.dart DOES NOT import dashboard.dart.

/// ---------------- Patient Dashboard Page ----------------
class PatientDashboardPage extends StatefulWidget {
  final String userName;
  final String email;
  final String age;

  const PatientDashboardPage({
    Key? key,
    required this.userName,
    required this.email,
    required this.age,
  }) : super(key: key);

  @override
  State<PatientDashboardPage> createState() => _PatientDashboardPageState();
}

class _PatientDashboardPageState extends State<PatientDashboardPage> {
  int selectedBottomIndex = 0;
  bool _isTherapyExpanded = false;

  /// All screens for bottom navigation (use local NotificationsScreen to avoid circular import)
  List<Widget> get _pages => [
    dashboardContent(), // 0 Dashboard
    StitchDesignApp(), // 1 Schedule (no const to be safe)
    DesignApp(), // 2 Progress
    // 3 Updates (local placeholder)
    ProfilePageWithTabs(
      userName: widget.userName,
      email: widget.email,
      age: widget.age,
    ), // 4 Profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9EC),
      body: _pages[selectedBottomIndex],

      /// ✅ Bottom Navigation Bar
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

  /// ---------------- Dashboard Content ----------------
  Widget dashboardContent() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Hello, ${widget.userName}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3D403A),
              ),
            ),
            // NetworkImage is not const -> remove const
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                "https://lh3.googleusercontent.com/aida-public/AB6AXuC1ZsPMC7LoT631ftt9eN6uhWZUf-BAcUx43n2PCgv35wxyhxs98nOvPXDjicEfQjVc3KF7rWy8ZCzV-rqy1hDi4wOA29ZUfMg5zmjRcUo_NAfe-pf2iaiVjwCtkYQYY9aMc6cT_8pl_44YKXJgSmuJK06FtLJ6fItHoatcxAIbh3ezNziW0ua0ssy7Zj2r3zlwLfvgOVMALDd_eCi1_dllVrifQ6ozCx51E3XHWwMN4qwnw356bx7fYfnD2og1BMlPN3i7jZYvfvw", // demo avatar
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Next Session
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 239, 224, 212),
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [BoxShadow(color: Colors.white, blurRadius: 6)],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Next Scheduled Session",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 6),
              Text(
                "Abhyanga (Herbal Oil Massage)",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF739550),
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 16),
                  SizedBox(width: 4),
                  Text("June 15, 2025"),
                  SizedBox(width: 16),
                  Icon(Icons.access_time, size: 16),
                  SizedBox(width: 4),
                  Text("10:00 AM"),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Therapy Progress (Expandable)
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row with expand/collapse
              GestureDetector(
                onTap: () {
                  setState(() => _isTherapyExpanded = !_isTherapyExpanded);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Therapy Progress",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      _isTherapyExpanded
                          ? Icons.expand_less
                          : Icons.expand_more,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Overall Completion",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    // Wrap in ClipRRect to get rounded corners (LinearProgressIndicator has no borderRadius param)
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: 0.75,
                        minHeight: 10,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: const AlwaysStoppedAnimation(
                          Color.fromARGB(255, 173, 241, 160),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    "75%",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 181, 243, 190),
                    ),
                  ),
                ],
              ),

              // Expanded content
              if (_isTherapyExpanded) ...[
                const SizedBox(height: 16),
                const Text(
                  "Weekly Improvement Trend",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    BarWithLabel(height: 60, label: "W1"),
                    BarWithLabel(height: 100, label: "W2"),
                    BarWithLabel(height: 80, label: "W3"),
                    BarWithLabel(height: 130, label: "W4"),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Milestones",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                milestoneItem(Icons.spa, "Completed 3 sessions"),
                const SizedBox(height: 10),
                milestoneItem(Icons.self_improvement, "Improved digestion"),
              ],
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Notifications Card
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 235, 148, 76),
                ),
                child: const Icon(
                  Icons.notifications_active,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Unread Notifications",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "2",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// ---------------- Helper Widgets ----------------
class BarWithLabel extends StatelessWidget {
  final double height;
  final String label;
  const BarWithLabel({super.key, required this.height, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 20,
          height: height,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 188, 237, 165),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}

Widget milestoneItem(IconData icon, String text) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 239, 224, 212),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF739550),
          ),
          child: Icon(icon, color: Colors.white, size: 18),
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF3D403A),
          ),
        ),
      ],
    ),
  );
}

/// ---------------- Bottom Nav Item ----------------
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

/// ---------------- Profile Page ----------------
class ProfilePageWithTabs extends StatefulWidget {
  final String userName;
  final String email;
  final String age;

  const ProfilePageWithTabs({
    Key? key,
    required this.userName,
    required this.email,
    required this.age,
  }) : super(key: key);

  @override
  _ProfilePageWithTabsState createState() => _ProfilePageWithTabsState();
}

class _ProfilePageWithTabsState extends State<ProfilePageWithTabs> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 64,
            backgroundImage: NetworkImage("https://i.pravatar.cc/150"),
          ),
          const SizedBox(height: 12),
          Text(
            widget.userName,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              tabItem("Personal Info", 0),
              tabItem("Medical History", 1),
              tabItem("Therapy Records", 2),
            ],
          ),
          const SizedBox(height: 24),
          if (selectedTabIndex == 0)
            sectionCard("Personal Details", [
              {"label": "Age", "value": widget.age},
              {"label": "Gender", "value": "Female"},
              {"label": "Contact", "value": "+91 9876543210"},
              {"label": "Email", "value": widget.email},
            ])
          else if (selectedTabIndex == 1)
            sectionCard("Medical Information", [
              {"label": "Allergies", "value": "None"},
              {"label": "Current Conditions", "value": "Stress Management"},
              {"label": "Past Treatments", "value": "Ayurvedic Detox"},
            ])
          else if (selectedTabIndex == 2)
            sectionCard("Therapy Records", [
              {"label": "Last Session", "value": "15 Sep 2025"},
              {"label": "Therapist Notes", "value": "Recommended meditation"},
              {"label": "Next Session", "value": "22 Sep 2025"},
            ]),
        ],
      ),
    );
  }

  Widget tabItem(String title, int index) {
    bool selected = selectedTabIndex == index;
    return GestureDetector(
      onTap: () => setState(() => selectedTabIndex = index),
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

  Widget sectionCard(String title, List<Map<String, String>> fields) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
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

/// ---------------- Dummy Notifications Screen (local) ----------------
