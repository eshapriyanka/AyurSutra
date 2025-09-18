import 'package:flutter/material.dart';
import 'package:sih/dashboard.dart';
import 'package:sih/landing.dart';
import 'package:sih/notifications.dart';

void main() {
  runApp(const DesignApp());
}

class DesignApp extends StatelessWidget {
  const DesignApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Stitch Design",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Epilogue",
        scaffoldBackgroundColor: const Color(0xFFF4F9EC), // primary-50
      ),
      home: const ProgressPage(),
    );
  }
}

/// ✅ Convert ProgressPage to StatefulWidget
class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  int selectedBottomIndex = 2; // Default Progress selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE6F5D8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF495057)),
          onPressed: () {},
        ),
        centerTitle: true,
        title: const Text(
          "Progress",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF212529),
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Overall Therapy Completion
            const Text(
              "Overall Therapy Completion",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: 0.75,
                      backgroundColor: Color(0xFFD1E7B4), // primary-200
                      valueColor: AlwaysStoppedAnimation(
                        Color(0xFFA2CE69),
                      ), // primary-400
                      minHeight: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  "75%",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF517428),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Weekly Recovery Trend
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Weekly Recovery Trend",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        "+15%",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6D9B36),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "vs Last 4 Weeks",
                        style: TextStyle(
                          color: Color(0xFF868E96),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFD1E7B4),
                          Color(0xFFD1E7B4).withOpacity(0),
                        ],
                      ),
                    ),
                    child: CustomPaint(painter: LineChartPainter()),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        "Week 1",
                        style: TextStyle(
                          color: Color(0xFF495057),
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        "Week 2",
                        style: TextStyle(
                          color: Color(0xFF495057),
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        "Week 3",
                        style: TextStyle(
                          color: Color(0xFF495057),
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        "Week 4",
                        style: TextStyle(
                          color: Color(0xFF495057),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Milestones
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "Milestones",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
            ),
            const SizedBox(height: 16),

            MilestoneCard(
              title: "Completed 3 Sessions",
              description:
                  "You've successfully finished three Panchakarma sessions.",
              imageUrl:
                  "https://lh3.googleusercontent.com/aida-public/AB6AXuCEYscfXayu7Nm2CTEBa_HYwkP5ZHzQdFvduXJd9IEDAApe2FwZt6S7LnUk6PxOOjVxRt4TbJy67NeNo9-8TRociVcVYoNymQw8OTKLzgPkbK4lM8L0xu4ipiuCdy4IQYzTSCn9MAwngNb8ObzG9YeymZUJBXyCIFNrTYzUeFXEwbPHwUNkluxoCe6DE44p2sfUsrf_PdOku7I60w0trYBLubqqc_Q-vQZqSQjYpNQ09RmxqI2_Ed5PwM7TyBGPSoXcWVRnNxTtPbg",
            ),
            MilestoneCard(
              title: "Improved Digestion",
              description:
                  "Your digestive health has shown significant improvement.",
              imageUrl:
                  "https://lh3.googleusercontent.com/aida-public/AB6AXuAzMX6cldpNiaY4gJ1lxAL5Sduw-Fj6aJHymOMV3F9_pIWV1I5o-WZLjVTCXBp4sIrBWWKgoPXjUn6_wXqJLSCGUZ7xOpUP08YDKfJE2GQen-lsOxmiZk44Fr_k1sVQzuFD7TZo5X4sYc00LbrSDqKKj8JiSsWI7W2gZB4W8ZRUGEfGTLxK-9PkY_k369lYG2bSgjQ7L6FIMhMK1ZyUKl-6xJWfZ2ZBOBb9TuRNq6aNtVDvUQqwtpowspAGd_O_Ijh301nc4NZXpc0",
            ),
          ],
        ),
      ),

      /// ✅ Bottom Navigation
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
                      setState(() => selectedBottomIndex = 1);
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StitchDesignApp(),
                        ),
                      );
                    },
                  ),
                  BottomNavItem(
                    icon: Icons.trending_up,
                    label: "Progress",
                    active: selectedBottomIndex == 2,
                    onTap: () => setState(() => selectedBottomIndex = 2),
                  ),
                  BottomNavItem(
                    icon: Icons.notifications,
                    label: "Updates",
                    active: selectedBottomIndex == 3,
                    onTap: () {
                      setState(() => selectedBottomIndex = 1);
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
                    active: selectedBottomIndex == 4,
                    onTap: () => setState(() => selectedBottomIndex = 4),
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

/// Milestone card widget
class MilestoneCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const MilestoneCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title, // ✅ Fix missing title
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    color: Color(0xFF868E96),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom painter for simple line chart
class LineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = const Color(0xFFA2CE69) // primary-400
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3
          ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(0, size.height * 0.7);
    path.lineTo(size.width * 0.1, size.height * 0.2);
    path.lineTo(size.width * 0.2, size.height * 0.3);
    path.lineTo(size.width * 0.3, size.height * 0.6);
    path.lineTo(size.width * 0.4, size.height * 0.2);
    path.lineTo(size.width * 0.5, size.height * 0.7);
    path.lineTo(size.width * 0.6, size.height * 0.4);
    path.lineTo(size.width * 0.7, size.height * 0.3);
    path.lineTo(size.width * 0.8, size.height * 0.8);
    path.lineTo(size.width * 0.9, size.height * 0.5);
    path.lineTo(size.width, size.height * 0.2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// ✅ Bottom Nav Item widget
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
