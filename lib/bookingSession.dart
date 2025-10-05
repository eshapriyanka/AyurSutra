// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // for date formatting

class BookSessionPage extends StatefulWidget {
  const BookSessionPage({super.key});

  @override
  State<BookSessionPage> createState() => _BookSessionPageState();
}

class _BookSessionPageState extends State<BookSessionPage> {
  final _formKey = GlobalKey<FormState>();
  String? selectedDoctor;
  String? selectedTherapy;
  DateTime? selectedDate;
  String time = "";

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final List<String> doctorList = [
    "Dr. A Kumar",
    "Dr. B Singh",
    "Dr. C Sharma",
    "Dr. D Rao",
    "Dr. E Patel",
    "Dr. F Khan",
    "Dr. G Reddy",
    "Dr. H Gupta",
    "Dr. I Das",
    "Dr. J Nair",
  ];

  final List<String> therapyList = [
    "Physiotherapy",
    "Speech Therapy",
    "Occupational Therapy",
    "Cognitive Therapy",
    "Behavioral Therapy",
    "Music Therapy",
    "Art Therapy",
    "Massage Therapy",
    "Hydrotherapy",
    "Rehabilitation",
  ];
  Future<void> saveSession() async {
    if (!_formKey.currentState!.validate()) return;

    String title =
        selectedDate != null
            ? DateFormat("d MMMM yyyy").format(selectedDate!)
            : "";
    String subtitle =
        selectedDate != null
            ? "Upcoming - ${DateFormat("d MMMM").format(selectedDate!)}"
            : "";

    try {
      await _firestore.collection("sessions").add({
        "title": title,
        "time": time,
        "subtitle": subtitle,
        "doctor": selectedDoctor,
        "therapy": selectedTherapy,
        "completed": false,
        "createdAt": Timestamp.now(),
      });
      print("✅ Session saved successfully!");
      if (!mounted) return;
      Navigator.pop(context); // Go back after saving
    } catch (e) {
      print("❌ Error saving session: $e");
    }
  }

  Future<void> pickDate() async {
    DateTime now = DateTime.now();
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 1),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book New Session"),
        backgroundColor: const Color(0xFF80DF20),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Date picker (Title)
              ListTile(
                title: Text(
                  selectedDate == null
                      ? "Select Session Date"
                      : "Date: ${DateFormat("d MMMM yyyy").format(selectedDate!)}",
                ),
                trailing: const Icon(
                  Icons.calendar_today,
                  color: Colors.black54,
                ),
                onTap: pickDate,
              ),
              const SizedBox(height: 12),

              // Time
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Time (e.g. 10:00 AM)",
                ),
                validator: (val) => val!.isEmpty ? "Enter time" : null,
                onChanged: (val) => time = val,
              ),
              const SizedBox(height: 12),

              // Doctor Dropdown
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: "Select Doctor"),
                value: selectedDoctor,
                items:
                    doctorList
                        .map(
                          (doc) =>
                              DropdownMenuItem(value: doc, child: Text(doc)),
                        )
                        .toList(),
                onChanged: (val) => setState(() => selectedDoctor = val),
                validator: (val) => val == null ? "Select a doctor" : null,
              ),
              const SizedBox(height: 12),

              // Therapy Dropdown
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: "Select Therapy"),
                value: selectedTherapy,
                items:
                    therapyList
                        .map(
                          (th) => DropdownMenuItem(value: th, child: Text(th)),
                        )
                        .toList(),
                onChanged: (val) => setState(() => selectedTherapy = val),
                validator: (val) => val == null ? "Select a therapy" : null,
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF80DF20),
                  minimumSize: const Size(double.infinity, 48),
                ),
                onPressed: saveSession,
                child: const Text("Save Session"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
