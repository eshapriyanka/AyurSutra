import 'package:flutter/material.dart';
import 'package:sih/doctor_dashboard.dart';
import 'package:sih/doctor_profile.dart';
import 'package:sih/feedback_doctor.dart';
import 'package:sih/profile.dart';
import 'package:sih/therapy.dart';

void main() {
  runApp(const PanchakarmaApp1());
}

class PanchakarmaApp1 extends StatelessWidget {
  const PanchakarmaApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Panchakarma Patient Management",
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Inter'),
      home: const PatientsPage(),
    );
  }
}

// ---------------- Patients Page ---------------- //
class PatientsPage extends StatefulWidget {
  const PatientsPage({super.key});

  @override
  State<PatientsPage> createState() => _PatientsPageState();
}

class _PatientsPageState extends State<PatientsPage> {
  final List<Map<String, dynamic>> patients = const [
    {
      "id": "ethan",
      "name": "Ethan Carter",
      "therapy": "Shirodhara",
      "progress": 75,
      "image":
          "https://lh3.googleusercontent.com/aida-public/AB6AXuCv1u0s3d41o30xrbES4SECJ9RDKH3TdAu3pxZ1zCSppC__H8a_GcQSVJohuUFPxHsTPJamLjEl97ZQYVdJfZHRcBS9UEw6Mkv50wfVSr2ZcspaP_rJwQns1TbdpdAq8cQ83pzCHy36UouycYFJGPODvaWdM_SbI_6S7tKZi085lFS-ghI0WxuGU4Nt64KecUwfppGVMNi15cGyfQXs2QubyeF1A-6p_12MrC8tfjTcL436YFobY5Du0qic6VRQeJ3eys7vX-PpXta3",
    },
    {
      "id": "olivia",
      "name": "Olivia Bennett",
      "therapy": "Abhyanga",
      "progress": 50,
      "image":
          "https://lh3.googleusercontent.com/aida-public/AB6AXuCSLNjhC6kT1t0w99kFdEbjCHhgv2P4c2fwftKlZMO9YyWrHcXeqdqWZnloX0B_Mre45lFkcpfzNiS6PE2o5HZjkg7DJM2kV76aeIoqLgiyjD56PhPziOxjQqn7aXb9c0MHshIGqku1Lw3VbfgqRg-SrJ6s5V04RjMvusjRQJCz9EXSMTCC_mHA105tO9dPThpxzZavevjDGsPUazs90PuKx9BibGpnpBZoon1qNFKwRmG5Zc-CPbNbZi1j7MYEQQUsj8mfxfRNYBWW",
    },
    {
      "id": "noah",
      "name": "Noah Thompson",
      "therapy": "Vasti",
      "progress": 25,
      "image":
          "https://lh3.googleusercontent.com/aida-public/AB6AXuDScL5f1N4EIs6rZhyS3uqHODe4JHHLP3WtC3sPCgG6cKt97Bz8Uz91BaUKfD3BaS8oH9IKN5C920yNo83h1KKhgbpme3vKxiltI1r8wOwfYVDXZ6C9WqGTE9CGIE1etdnHW07wqcy2SRzAwImx8PNNNYun8-UExet1YV8WYvSCzMlciA8W4KDORAysvPmmiTESKF8PlSb664lzpDW7fevg31pvsiF_NxIpHrrrCRwyq0hxYsBkjHjr_tTyU288-Ql-faF7R4yBqMkr",
    },
    {
      "id": "sophia",
      "name": "Sophia Walker",
      "therapy": "Shirodhara",
      "progress": 90,
      "image":
          "https://lh3.googleusercontent.com/aida-public/AB6AXuDvdgFe4R8IJeQF9WrVndGg10Q2LalDEofeYtMqRKcwU9nAO8qQi1P8juMgCf0tTqBm1mjtlpqMgc_lQ9D0DulL1afsilwIlOJ7t5bo97z-OCU-45d8wyxK5Zew0aRjrilRw6kw_H7_qrm28dRFcJlrEMKO4amFVMcHQRbxIbokxvkyWeCk2Ka8B890ZX0Bv-vSmcpfst1OqMG8nBwxIb1aPMPwsDvuXNP1DCzbgiKeTL_oxJv3WBZK_cCIgElhssC3pRgaFDlChhkJ",
    },
    {
      "id": "liam",
      "name": "Liam Harris",
      "therapy": "Abhyanga",
      "progress": 60,
      "image":
          "https://lh3.googleusercontent.com/aida-public/AB6AXuByTv2n-bLjWHmz0IzGNz4EVbrSARiwYXfyaUJBE7mkJJi_h7sc-y3JXWOHpQx3Tp4exS01zf9SGXxxPbFgMtPgAMKq87_J0M_hv1a2YCxI85OmpostSsleDEo2QaOJcKBdP3G1Bvv0jg1D7x3XnOAWT0Ij5Bv1O5ki4-xJHk2-BC9CVyX_ASfYfGIHyvoTTTDibEq_ResRM5HFfrVVaaPUgyqQ9UAkB3mtmGYSeqjYoxumz_BzygdRhC15D5k74XYtOPTLYlFfKTRV",
    },
  ];

  @override
  Widget build(BuildContext context) {
    int selectedBottomIndex = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Patients"),
        centerTitle: true,
        backgroundColor: Colors.green.shade700,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: patients.length,
        itemBuilder: (context, index) {
          final patient = patients[index];
          return PatientCard(patient: patient);
        },
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
                        MaterialPageRoute(builder: (context) => MyApp2()),
                      );
                    },
                  ),
                  BottomNavItem(
                    icon: Icons.groups,
                    label: "Patients",
                    active: selectedBottomIndex == 1,
                    onTap: () => setState(() => selectedBottomIndex = 1),
                  ),

                  BottomNavItem(
                    icon: Icons.spa,
                    label: "Therapies",
                    active: selectedBottomIndex == 3,
                    onTap: () {
                      setState(() => selectedBottomIndex = 3);
                      Navigator.push(
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
                  // BottomNavItem(
                  //   icon: Icons.person,
                  //   label: "Profile",
                  //   active: selectedBottomIndex == 3,
                  //   onTap: () {
                  //     setState(() => selectedBottomIndex = 3);
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => PanchakarmaSettingsApp(),
                  //       ),
                  //     );
                  //   },
                  // ),
                  BottomNavItem(
                    icon: Icons.settings,
                    label: "Setting",
                    active: selectedBottomIndex == 4,
                    onTap: () {
                      setState(() => selectedBottomIndex = 4);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => PatientFeedbackPage(),
                      //   ),
                      // );
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
}

// ---------------- Patient Card ---------------- //
class PatientCard extends StatelessWidget {
  final Map<String, dynamic> patient;
  const PatientCard({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PatientDetailPage(patient: patient),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(patient["image"]),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          patient["name"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          patient["therapy"],
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "${patient["progress"]}%",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: patient["progress"] / 100,
                color: Colors.green,
                backgroundColor: Colors.grey.shade300,
                minHeight: 6,
                borderRadius: BorderRadius.circular(8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- Patient Detail Page ---------------- //
class PatientDetailPage extends StatelessWidget {
  final Map<String, dynamic> patient;
  const PatientDetailPage({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(patient["name"]),
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(patient["image"]),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patient["name"],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      patient["therapy"],
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              "Medical History",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                title: const Text("Condition: Chronic back pain"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Allergies: Penicillin"),
                    Text("Past Surgeries: Appendectomy (2015)"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Therapy Timeline",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.check_circle, color: Colors.green),
                  title: Text("Week 1: Consultation"),
                  subtitle: Text("Initial assessment and planning."),
                ),
                ListTile(
                  leading: Icon(Icons.check_circle, color: Colors.green),
                  title: Text("Week 2-4: Shirodhara"),
                  subtitle: Text("3 sessions per week."),
                ),
                ListTile(
                  leading: Icon(
                    Icons.radio_button_unchecked,
                    color: Colors.grey,
                  ),
                  title: Text("Week 5: Follow-up"),
                  subtitle: Text("Scheduled for next week."),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              "Documents",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: const Icon(Icons.description, color: Colors.green),
                title: const Text("Initial_Report.pdf"),
                trailing: const Icon(Icons.visibility),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.description, color: Colors.green),
                title: const Text("X-Ray_Scan.jpg"),
                trailing: const Icon(Icons.visibility),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.upload_file),
              label: const Text("Upload Document"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ],
        ),
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
