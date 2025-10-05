import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sih/bookingSession.dart';
import 'package:sih/dashboard.dart';
import 'package:sih/notifications.dart';
import 'package:sih/profile.dart';

void main() {
  runApp(const StitchDesignApp());
}

class StitchDesignApp extends StatelessWidget {
  const StitchDesignApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stitch Design',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Epilogue',
        scaffoldBackgroundColor: const Color(0xFFFAFBF8),
        primaryColor: const Color(0xFF80DF20),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xFF141B0E)),
        ),
      ),
      home: const SchedulePage(),
    );
  }
}

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  int selectedBottomIndex = 1; // Default to Schedule tab
  int selectedCardIndex = -1; // -1 means nothing selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFBF8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF141B0E)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => PatientDashboardPage(
                      uid: FirebaseAuth.instance.currentUser!.uid,
                    ),
              ),
            );
          },
        ),

        title: const Text(
          "Schedule",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF141B0E),
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance
                .collection("sessions")
                .orderBy("createdAt", descending: true)
                .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No sessions booked yet."));
          }

          final sessions = snapshot.data!.docs;

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: sessions.length,
            itemBuilder: (context, index) {
              final session = sessions[index];
              return ScheduleCard(
                index: index,
                isSelected: selectedCardIndex == index,
                icon: Icons.spa,
                title: session["title"],
                time: session["time"],
                subtitle: session["subtitle"],
                doctor: session["doctor"],
                completed: session["completed"],
                onTap: () {
                  setState(() => selectedCardIndex = index);
                },
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF80DF20),
        icon: const Icon(Icons.add),
        label: const Text("Book New Session"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const BookSessionPage()),
          );
        },
      ),
    );
  }
}

// Toggle row
class ToggleButtonsRow extends StatefulWidget {
  @override
  _ToggleButtonsRowState createState() => _ToggleButtonsRowState();
}

class _ToggleButtonsRowState extends State<ToggleButtonsRow> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: const Color(0xFFEDF3E8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: ChoiceChip(
              label: const Text("List"),
              selected: selectedIndex == 0,
              onSelected: (_) => setState(() => selectedIndex = 0),
              selectedColor: Colors.white,
              backgroundColor: Colors.transparent,
              labelStyle: TextStyle(
                color:
                    selectedIndex == 0
                        ? const Color(0xFF141B0E)
                        : const Color(0xFF739550),
              ),
            ),
          ),
          Expanded(
            child: ChoiceChip(
              label: const Text("Calendar"),
              selected: selectedIndex == 1,
              onSelected: (_) => setState(() => selectedIndex = 1),
              selectedColor: Colors.white,
              backgroundColor: Colors.transparent,
              labelStyle: TextStyle(
                color:
                    selectedIndex == 1
                        ? const Color(0xFF141B0E)
                        : const Color(0xFF739550),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Schedule Card

class ScheduleCard extends StatelessWidget {
  final int index;
  final bool isSelected;
  final IconData icon;
  final String title;
  final String time;
  final String subtitle;
  final String doctor;
  final bool completed;
  final VoidCallback onTap;

  const ScheduleCard({
    super.key,
    required this.index,
    required this.isSelected,
    required this.icon,
    required this.title,
    required this.time,
    required this.subtitle,
    required this.doctor,
    required this.completed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: completed ? 0.6 : 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Card(
          color: isSelected ? const Color(0xFFE6F5D8) : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: isSelected ? Colors.transparent : const Color(0xFFEDF3E8),
            ),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : const Color(0xFFEDF3E8),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, size: 28, color: const Color(0xFF141B0E)),
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
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFF141B0E),
                            ),
                          ),
                          Text(
                            time,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF141B0E),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF739550),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        doctor,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF739550),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Bottom Nav Item
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
