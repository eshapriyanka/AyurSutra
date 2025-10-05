import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sih/abc.dart';
import 'package:sih/appointment.dart';
import 'package:sih/doctor_profile.dart';
import 'package:sih/feedback_doctor.dart';
import 'package:sih/therapy.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp2());
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Panchakarma Doctor",
      theme: ThemeData(
        fontFamily: "Lexend",
        scaffoldBackgroundColor: const Color(0xFFF6F8F6),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF56C91D)),
        useMaterial3: true,
      ),
      home: const DoctorDashboard(),
    );
  }
}

class DoctorDashboard extends StatefulWidget {
  const DoctorDashboard({super.key});

  @override
  State<DoctorDashboard> createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {
  int _selectedIndex = 0;
  String selectedDay = "Today";

  final Color primary = const Color(0xFF56C91D);
  final Color backgroundLight = const Color(0xFFF6F8F6);
  final Color mutedLight = const Color(0xFF6B7280);

  final List<Map<String, dynamic>> topPatients = [
    {
      "name": "Olivia Bennett",
      "therapy": "Shirodhara",
      "progress": 0.7,
      "img":
          "https://lh3.googleusercontent.com/aida-public/AB6AXuCRjTuqWIWm0I6JfqlADXIC4li78Z9JW2fSsAiKSMmZKXPxY4SFJ64ydOE24WJsXfrgkTG054PGR9X6O8HeLmhN6BUQ3UXpi_7rd-HLEtigdhH6JFMBxw6S1U6Hbq8Heqp-zKb-EK2jcIdtiKwzw_OjdfGyB1XrUBdY_qk4WGznf1xVo0gremKPMxHijhCB-AURHTk7RJ6ZOF6aolqYWpFCwonwRNRM3HiCLtBYoC2IB1LS5xPn7Ig5u8vo5DQmqAi2N7o6voaoSAtK",
      "phone": "+919876543210",
    },
    {
      "name": "Liam Harper",
      "therapy": "Abhyanga",
      "progress": 0.5,
      "img":
          "https://lh3.googleusercontent.com/aida-public/AB6AXuDHPvDld3y59eKU8Em_0dX_mJrn9Oy5mdsa9ySa5cEs5wAEaVL_oMCfqA9phenVRC53Dt2_pmfm2mE2LntGB0F-SHrvwRKAJqzyMUA3KgWO0XLrc0eQZWP5-t5NnppI3Cux8dSwptMZZ2sal2shyw1V6Ou-4ec_gxdT6R9NALfaIwYmVZW3FVccCLC9Bozonu4Jun5QYkFUQy8G3HgowZy1WvE47IlIEmd0kd8fyXaONRosn3GvwLqg_kVt9ZO5NdXU6veu67uhBs3j",
      "phone": "+919876543211",
    },
    {
      "name": "Sophia Davis",
      "therapy": "Panchakarma",
      "progress": 0.9,
      "img":
          "https://lh3.googleusercontent.com/aida-public/AB6AXuCR3m09oVN8m8Y6fY7AZ1j_r-6QmmukJpgyPvsLVSEAXek4kZSZ3mw1P6V88upsw1hSwj_kXvPvyqRoAVy-0MHVGs1VfyxbSfObhtyRWcUbgFq7FrbF_C3hkAagnWNJWUIqr6GijGfs6PMqeq68NTGS0RcM2TaoLovckOc-XH6mQJCGPDS1tgJE6xe-UtLpO5oyXDahdGIykIYAZFs0LNeS7hml6vvV5nRan6GJTLitgVJm7ABCeve8qL-h-wbCw5X_g-M8JfmIuS7G",
      "phone": "+919876543212",
    },
  ];

  final Map<String, List<Map<String, dynamic>>> patientsData = {
    "Yesterday": [
      {
        "name": "Mia Thompson",
        "therapy": "Vasti",
        "time": "9:30 AM",
        "status": "Completed",
        "statusColor": Colors.grey,
        "img":
            "https://lh3.googleusercontent.com/aida-public/AB6AXuBFkhFjGyK5RrNTpMN48bPQA9J_8F7NVDk5ggETdXIwG6bveaWMnAk-mrcXnLOHj1rlyHSh41PfIZxV58hMWseS_nJRYxE0KDYbT53_LuggmEVFzjvLGHdSROL3FUcpOqWgHs-fo4fvEKfrD3TGb226zf5oK81m3l31_w8OXmutY2Ryli9nYBG6ljct2wNZ01yu7RDVLV5-LxCVRyJNwvbSc0ptRkWKOTOlfmXaWOzjiqF86rPY2GUaWY3SLFUUyDOp_OjGqJt2hmnq",
        "phone": "+919876543213",
      },
      {
        "name": "James Wilson",
        "therapy": "Swedana",
        "time": "11:00 AM",
        "status": "Scheduled",
        "statusColor": Colors.orange,
        "img":
            "https://lh3.googleusercontent.com/aida-public/AB6AXuCR3m09oVN8m8Y6fY7AZ1j_r-6QmmukJpgyPvsLVSEAXek4kZSZ3mw1P6V88upsw1hSwj_kXvPvyqRoAVy-0MHVGs1VfyxbSfObhtyRWcUbgFq7FrbF_C3hkAagnWNJWUIqr6GijGfs6PMqeq68NTGS0RcM2TaoLovckOc-XH6mQJCGPDS1tgJE6xe-UtLpO5oyXDahdGIykIYAZFs0LNeS7hml6vvV5nRan6GJTLitgVJm7ABCeve8qL-h-wbCw5X_g-M8JfmIuS7G",
        "phone": "+919876543214",
      },
    ],
    "Today": [
      {
        "name": "Noah Carter",
        "therapy": "Vasti",
        "time": "11:45 AM",
        "status": "Completed",
        "statusColor": Colors.grey,
        "img":
            "https://lh3.googleusercontent.com/aida-public/AB6AXuBFkhFjGyK5RrNTpMN48bPQA9J_8F7NVDk5ggETdXIwG6bveaWMnAk-mrcXnLOHj1rlyHSh41PfIZxV58hMWseS_nJRYxE0KDYbT53_LuggmEVFzjvLGHdSROL3FUcpOqWgHs-fo4fvEKfrD3TGb226zf5oK81m3l31_w8OXmutY2Ryli9nYBG6ljct2wNZ01yu7RDVLV5-LxCVRyJNwvbSc0ptRkWKOTOlfmXaWOzjiqF86rPY2GUaWY3SLFUUyDOp_OjGqJt2hmnq",
        "phone": "+919876543215",
      },
      {
        "name": "Ethan Johnson",
        "therapy": "Swedana",
        "time": "10:00 AM",
        "status": "Scheduled",
        "statusColor": Colors.orange,
        "img":
            "https://lh3.googleusercontent.com/aida-public/AB6AXuCR3m09oVN8m8Y6fY7AZ1j_r-6QmmukJpgyPvsLVSEAXek4kZSZ3mw1P6V88upsw1hSwj_kXvPvyqRoAVy-0MHVGs1VfyxbSfObhtyRWcUbgFq7FrbF_C3hkAagnWNJWUIqr6GijGfs6PMqeq68NTGS0RcM2TaoLovckOc-XH6mQJCGPDS1tgJE6xe-UtLpO5oyXDahdGIykIYAZFs0LNeS7hml6vvV5nRan6GJTLitgVJm7ABCeve8qL-h-wbCw5X_g-M8JfmIuS7G",
        "phone": "+919876543216",
      },
    ],
    "Tomorrow": [
      {
        "name": "Ava Martinez",
        "therapy": "Panchakarma",
        "time": "1:30 PM",
        "status": "Scheduled",
        "statusColor": Colors.orange,
        "img":
            "https://lh3.googleusercontent.com/aida-public/AB6AXuDHPvDld3y59eKU8Em_0dX_mJrn9Oy5mdsa9ySa5cEs5wAEaVL_oMCfqA9phenVRC53Dt2_pmfm2mE2LntGB0F-SHrvwRKAJqzyMUA3KgWO0XLrc0eQZWP5-t5NnppI3Cux8dSwptMZZ2sal2shyw1V6Ou-4ec_gxdT6R9NALfaIwYmVZW3FVccCLC9Bozonu4Jun5QYkFUQy8G3HgowZy1WvE47IlIEmd0kd8fyXaONRosn3GvwLqg_kVt9ZO5NdXU6veu67uhBs3j",
        "phone": "+919876543217",
      },
      {
        "name": "William Brown",
        "therapy": "Shirodhara",
        "time": "3:00 PM",
        "status": "Scheduled",
        "statusColor": Colors.orange,
        "img":
            "https://lh3.googleusercontent.com/aida-public/AB6AXuBFkhFjGyK5RrNTpMN48bPQA9J_8F7NVDk5ggETdXIwG6bveaWMnAk-mrcXnLOHj1rlyHSh41PfIZxV58hMWseS_nJRYxE0KDYbT53_LuggmEVFzjvLGHdSROL3FUcpOqWgHs-fo4fvEKfrD3TGb226zf5oK81m3l31_w8OXmutY2Ryli9nYBG6ljct2wNZ01yu7RDVLV5-LxCVRyJNwvbSc0ptRkWKOTOlfmXaWOzjiqF86rPY2GUaWY3SLFUUyDOp_OjGqJt2hmnq",
        "phone": "+919876543218",
      },
    ],
  };

  DateTime? customDate;

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      buildHome(),
      const Center(child: Text("Appointments Screen")),
      const FeedbackScreen(),
      const TherapiesScreen(),
      const Center(child: Text("Settings Screen")),
    ];

    return Scaffold(
      backgroundColor: backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(child: pages[_selectedIndex]),
            _buildBottomNavigation(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: const NetworkImage(
              "https://lh3.googleusercontent.com/aida-public/AB6AXuBFkhFjGyK5RrNTpMN48bPQA9J_8F7NVDk5ggETdXIwG6bveaWMnAk-mrcXnLOHj1rlyHSh41PfIZxV58hMWseS_nJRYxE0KDYbT53_LuggmEVFzjvLGHdSROL3FUcpOqWgHs-fo4fvEKfrD3TGb226zf5oK81m3l31_w8OXmutY2Ryli9nYBG6ljct2wNZ01yu7RDVLV5-LxCVRyJNwvbSc0ptRkWKOTOlfmXaWOzjiqF86rPY2GUaWY3SLFUUyDOp_OjGqJt2hmnq",
            ),
          ),
          const Text(
            "Hello, Doctor 👨‍⚕",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF111827),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
              color: Color(0xFF111827),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget buildHome() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stats Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              statCard("Patients", "120", Icons.people, Colors.green.shade300),
              statCard("Pending", "12", Icons.pending, Colors.orange.shade400),
              statCard(
                "Completed",
                "85",
                Icons.check_circle,
                Colors.blue.shade300,
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Top Patients
          const Text(
            "⭐ Top Patients",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topPatients.length,
              itemBuilder: (context, index) {
                final p = topPatients[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PatientDetail(patient: p),
                      ),
                    );
                  },
                  child: Container(
                    width: 140,
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(p["img"]),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          p["name"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          p["therapy"],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                          ),
                        ),
                        const SizedBox(height: 6),
                        LinearProgressIndicator(
                          value: p["progress"],
                          color: primary,
                          backgroundColor: Colors.grey[200],
                          minHeight: 6,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          // Day Selector & Custom Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                spacing: 8,
                children:
                    ["Yesterday", "Today", "Tomorrow"]
                        .map(
                          (day) => ChoiceChip(
                            label: Text(day),
                            selected: selectedDay == day,
                            onSelected: (_) {
                              setState(() {
                                selectedDay = day;
                                customDate = null;
                              });
                            },
                          ),
                        )
                        .toList(),
              ),
              ElevatedButton(
                onPressed: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now().subtract(
                      const Duration(days: 365),
                    ),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (picked != null) {
                    setState(() {
                      customDate = picked;
                      selectedDay = DateFormat(
                        'yyyy-MM-dd',
                      ).format(customDate!);
                      if (!patientsData.containsKey(selectedDay)) {
                        patientsData[selectedDay] = [];
                      }
                    });
                  }
                },
                child: const Text("Custom Date"),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "$selectedDay's Patients",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          // Patients List
          Column(
            children:
                (patientsData[selectedDay] ?? [])
                    .map(
                      (p) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PatientDetail(patient: p),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 26,
                                backgroundImage: NetworkImage(p["img"]),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      p["name"],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      p["therapy"],
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    p["time"],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: p["statusColor"].withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      p["status"],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: p["statusColor"],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 8),
                              _circleIconButton(
                                Icons.call,
                                Colors.green,
                                () => _launchUrl('tel:${p["phone"]}'),
                              ),
                              const SizedBox(width: 8),
                              _circleIconButton(
                                Icons.message,
                                Colors.blue,
                                () => _launchUrl('sms:${p["phone"]}'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }

  Widget statCard(String title, String count, IconData icon, Color color) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 6),
          Text(
            count,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 2),
          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _circleIconButton(IconData icon, Color color, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      customBorder: const CircleBorder(),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.12),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 18, color: color),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: primary.withOpacity(0.2))),
        color: backgroundLight,
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.grid_view, "Dashboard", _selectedIndex == 0),
          _navItem(Icons.calendar_month, "Appointments", _selectedIndex == 1),
          _navItem(Icons.chat_bubble, "Feedback", _selectedIndex == 2),
          _navItem(Icons.spa, "Therapies", _selectedIndex == 3),
          _navItem(Icons.settings, "Settings", _selectedIndex == 4),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool isActive) {
    return GestureDetector(
      onTap: () {
        int index = 0;
        if (label == "Dashboard") index = 0;
        if (label == "Appointments") index = 1;
        if (label == "Feedback") index = 2;
        if (label == "Therapies") index = 3;
        if (label == "Settings") index = 4;

        setState(() {
          _selectedIndex = index;
        });

        // Optional: Navigate to other pages
        if (label == "Appointments") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => PanchakarmaApp1()),
          );
        } else if (label == "Feedback") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => PatientFeedbackPage()),
          );
        } else if (label == "Therapies") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => TherapySchedulePage()),
          );
        } else if (label == "Settings") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => PanchakarmaSettingsApp()),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isActive ? primary : mutedLight),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? primary : mutedLight,
            ),
          ),
        ],
      ),
    );
  }
}

class PatientDetail extends StatelessWidget {
  final Map<String, dynamic> patient;
  const PatientDetail({super.key, required this.patient});

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(patient["name"]),
        backgroundColor: const Color(0xFF56C91D),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(patient["img"]),
            ),
            const SizedBox(height: 20),
            Text(
              patient["name"],
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "Therapy: ${patient["therapy"]}",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Status: ${patient["status"]}",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Time: ${patient["time"]}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _launchUrl('tel:${patient["phone"]}');
                    },
                    icon: const Icon(Icons.call),
                    label: const Text("Call"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _launchUrl('sms:${patient["phone"]}');
                    },
                    icon: const Icon(Icons.message),
                    label: const Text("Message"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TherapiesScreen extends StatefulWidget {
  const TherapiesScreen({super.key});

  @override
  State<TherapiesScreen> createState() => _TherapiesScreenState();
}

class _TherapiesScreenState extends State<TherapiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Therapies'),
        backgroundColor: const Color(0xFF56C91D),
      ),
      body: const Center(
        child: Text(
          'This is the Therapies screen.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
        backgroundColor: const Color(0xFF56C91D),
      ),
      body: const Center(
        child: Text(
          'This is the Feedback screen.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
