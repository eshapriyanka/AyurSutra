import 'package:flutter/material.dart';
import 'package:sih/abc.dart';
import 'package:sih/doctor_dashboard.dart';
import 'package:sih/doctor_profile.dart';
import 'package:sih/therapy.dart';

class PatientFeedbackPage extends StatefulWidget {
  const PatientFeedbackPage({super.key});

  @override
  State<PatientFeedbackPage> createState() => _PatientFeedbackPageState();
}

class _PatientFeedbackPageState extends State<PatientFeedbackPage> {
  int selectedBottomIndex = 0;

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF56c91d);
    const backgroundLight = Color(0xFFf6f8f6);
    const foregroundLight = Color(0xFF111827);
    const mutedLight = Color(0xFF6b7280);

    return Scaffold(
      backgroundColor: backgroundLight,
      appBar: AppBar(
        backgroundColor: backgroundLight,
        elevation: 1,
        title: const Text(
          "Patient Feedback",
          style: TextStyle(fontWeight: FontWeight.bold, color: foregroundLight),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: foregroundLight),
            onPressed: () {},
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            // Filter Buttons
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip("Therapy Type"),
                  const SizedBox(width: 8),
                  _buildFilterChip("Severity"),
                  const SizedBox(width: 8),
                  _buildFilterChip("Date"),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Feedback Cards
            _buildFeedbackCard(
              name: "Anya Sharma",
              therapy: "Abhyanga Therapy",
              status: "New",
              statusColor: primary,
              feedback:
                  "Feeling much more relaxed after the session, but noticed a slight rash on my left arm...",
              date: "Oct 26, 2023",
              imageUrl:
                  "https://lh3.googleusercontent.com/aida-public/AB6AXuCRjTuqWIWm0I6JfqlADXIC4li78Z9JW2fSsAiKSMmZKXPxY4SFJ64ydOE24WJsXfrgkTG054PGR9X6O8HeLmhN6BUQ3UXpi_7rd-HLEtigdhH6JFMBxw6S1U6Hbq8Heqp-zKb-EK2jcIdtiKwzw_OjdfGyB1XrUBdY_qk4WGznf1xVo0gremKPMxHijhCB-AURHTk7RJ6ZOF6aolqYWpFCwonwRNRM3HiCLtBYoC2IB1LS5xPn7Ig5u8vo5DQmqAi2N7o6voaoSAtK",
            ),
            _buildFeedbackCard(
              name: "Rohan Verma",
              therapy: "Shirodhara",
              status: "Reviewed",
              statusColor: mutedLight,
              feedback:
                  "The headaches have significantly reduced. I feel calmer and more focused throughout the day.",
              date: "Oct 25, 2023",
              imageUrl:
                  "https://lh3.googleusercontent.com/aida-public/AB6AXuDHPvDld3y59eKU8Em_0dX_mJrn9Oy5mdsa9ySa5cEs5wAEaVL_oMCfqA9phenVRC53Dt2_pmfm2mE2LntGB0F-SHrvwRKAJqzyMUA3KgWO0XLrc0eQZWP5-t5NnppI3Cux8dSwptMZZ2sal2shyw1V6Ou-4ec_gxdT6R9NALfaIwYmVZW3FVccCLC9Bozonu4Jun5QYkFUQy8G3HgowZy1WvE47IlIEmd0kd8fyXaONRosn3GvwLqg_kVt9ZO5NdXU6veu67uhBs3j",
            ),
            _buildFeedbackCard(
              name: "Priya Kapoor",
              therapy: "Vasti Therapy",
              status: "New",
              statusColor: primary,
              feedback:
                  "Initial discomfort, but overall feeling lighter and less bloated. Good experience.",
              date: "Oct 25, 2023",
              imageUrl:
                  "https://lh3.googleusercontent.com/aida-public/AB6AXuCR3m09oVN8m8Y6fY7AZ1j_r-6QmmukJpgyPvsLVSEAXek4kZSZ3mw1P6V88upsw1hSwj_kXvPvyqRoAVy-0MHVGs1VfyxbSfObhtyRWcUbgFq7FrbF_C3hkAagnWNJWUIqr6GijGfs6PMqeq68NTGS0RcM2TaoLovckOc-XH6mQJCGPDS1tgJE6xe-UtLpO5oyXDahdGIykIYAZFs0LNeS7hml6vvV5nRan6GJTLitgVJm7ABCeve8qL-h-wbCw5X_g-M8JfmIuS7G",
            ),
            _buildFeedbackCard(
              name: "Arjun Singh",
              therapy: "Pizhichil",
              status: "Reviewed",
              statusColor: mutedLight,
              feedback:
                  "Skin feels rejuvenated and joint pain has eased. The warmth of the oil was very soothing.",
              date: "Oct 24, 2023",
              imageUrl:
                  "https://lh3.googleusercontent.com/aida-public/AB6AXuBFkhFjGyK5RrNTpMN48bPQA9J_8F7NVDk5ggETdXIwG6bveaWMnAk-mrcXnLOHj1rlyHSh41PfIZxV58hMWseS_nJRYxE0KDYbT53_LuggmEVFzjvLGHdSROL3FUcpOqWgHs-fo4fvEKfrD3TGb226zf5oK81m3l31_w8OXmutY2Ryli9nYBG6ljct2wNZ01yu7RDVLV5-LxCVRyJNwvbSc0ptRkWKOTOlfmXaWOzjiqF86rPY2GUaWY3SLFUUyDOp_OjGqJt2hmnq",
            ),
          ],
        ),
      ),

      // Bottom Nav
      // bottomNavigationBar: SafeArea(
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       const Divider(height: 1, color: Color(0xFFEDF3E8)),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceAround,
      //           children: [
      //             BottomNavItem(
      //               icon: Icons.grid_view,
      //               label: "Dashboard",
      //               active: selectedBottomIndex == 0,
      //               onTap: () => setState(() => selectedBottomIndex = 2),
      //             ),

      //             BottomNavItem(
      //               icon: Icons.groups,
      //               label: "Patients",
      //               active: selectedBottomIndex == 1,
      //               onTap: () {
      //                 setState(() => selectedBottomIndex = 1);
      //                 Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                     builder: (context) => PanchakarmaApp1(),
      //                   ),
      //                 );
      //               },
      //             ),
      //             BottomNavItem(
      //               icon: Icons.spa,
      //               label: "Therapies",
      //               active: selectedBottomIndex == 2,
      //               onTap: () {
      //                 setState(() => selectedBottomIndex = 2);
      //                 Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                     builder: (context) => TherapySchedulePage(),
      //                   ),
      //                 );
      //               },
      //             ),
      //             BottomNavItem(
      //               icon: Icons.chat,
      //               label: "feedback",
      //               active: selectedBottomIndex == 3,
      //               onTap: () => setState(() => selectedBottomIndex = 3),
      //             ),
      //             BottomNavItem(
      //               icon: Icons.person,
      //               label: "Profile",
      //               active: selectedBottomIndex == 4,
      //               onTap: () {
      //                 setState(() => selectedBottomIndex = 4);
      //                 Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                     builder: (context) => PanchakarmaSettingsApp(),
      //                   ),
      //                 );
      //               },
      //             ),
      //             BottomNavItem(
      //               icon: Icons.settings,
      //               label: "Setting",
      //               active: selectedBottomIndex == 5,
      //               onTap: () {
      //                 setState(() => selectedBottomIndex = 5);
      //                 // Navigator.push(
      //                 //   context,
      //                 //   MaterialPageRoute(
      //                 //     builder: (context) => PatientFeedbackPage(),
      //                 //   ),
      //                 // );
      //               },
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  Widget _buildFilterChip(String label) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF56c91d).withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        children: [
          Text(label, style: const TextStyle(color: Color(0xFF56c91d))),
          const Icon(Icons.expand_more, size: 16, color: Color(0xFF56c91d)),
        ],
      ),
    );
  }

  Widget _buildFeedbackCard({
    required String name,
    required String therapy,
    required String status,
    required Color statusColor,
    required String feedback,
    required String date,
    required String imageUrl,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 24, backgroundImage: NetworkImage(imageUrl)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF111827),
                          ),
                        ),
                        Text(
                          therapy,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6b7280),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color:
                              statusColor == const Color(0xFF56c91d)
                                  ? Colors.white
                                  : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  feedback,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF6b7280),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF9ca3af),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class BottomNavItem extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final bool active;
//   final VoidCallback onTap;

//   const BottomNavItem({
//     super.key,
//     required this.icon,
//     required this.label,
//     required this.active,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(
//             icon,
//             color: active ? const Color(0xFF141B0E) : const Color(0xFF739550),
//           ),
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: active ? FontWeight.bold : FontWeight.w500,
//               color: active ? const Color(0xFF141B0E) : const Color(0xFF739550),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
