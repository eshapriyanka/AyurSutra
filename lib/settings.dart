import 'package:flutter/material.dart';

void main() {
  runApp(PanchakarmaSettingsApp3());
}

class PanchakarmaSettingsApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Panchakarma Settings',
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Inter',
        primaryColor: Color(0xFF5A8B43),
        scaffoldBackgroundColor: Color(0xFFFAF8F5),
        cardColor: Colors.white,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF5A8B43),
        scaffoldBackgroundColor: Color(0xFF2A2825),
        cardColor: Color(0xFF3E3B39),
      ),
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool appointmentReminders = true;
  bool patientUpdates = false;
  bool therapyAlerts = true;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: isDark ? Colors.white : Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor:
            isDark
                ? Color(0xFF2A2825).withOpacity(0.9)
                : Color(0xFFFAF8F5).withOpacity(0.9),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Section
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundImage: NetworkImage(
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuDhqOhlvNtGkuQrtPe_7XrBxMG74u8hUYQQGpNr7YHLm9rhDgmLEQEO-VOe6_vwWt5nLDsI-4U2f1EAxlR1AuCKC_Wj9NgXUmWhiWEMnKBUD1FnwfHRp9xbQcTPXigRpDlZcZccM2GVKqYJuU8yWJQ7QJSsOJQIfGlJSaVaq3SJt4AkLaSBcsbZ6GndD0_YaK-Dx4pATqMtqMkTHVL2c9KRgxvMM3gS0V4NeqnQznc29IVoQxvYlw-PHZ3S5Vd099wXCVMMkdgUI2Ca',
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dr. Anjali Sharma',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Ayurvedic Specialist',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF5A8B43),
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                '+91 98765 43210',
                                style: TextStyle(
                                  fontSize: 12,
                                  color:
                                      isDark
                                          ? Color(0xFF78716C)
                                          : Color(0xFFA8A29E),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.edit, color: Color(0xFF5A8B43)),
                      label: Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5A8B43),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5A8B43).withOpacity(0.1),
                        minimumSize: Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            // Sections
            SettingsSection(
              title: 'Account & Security',
              children: [
                SettingsTile(
                  title: 'Change Password',
                  icon: Icons.lock,
                  onTap: () {},
                ),
                SettingsTile(
                  title: 'Enable 2FA',
                  icon: Icons.security, // Fixed the shield_lock error
                  onTap: () {},
                ),
                SettingsTile(
                  title: 'Manage Login Devices',
                  icon: Icons.devices,
                  onTap: () {},
                ),
              ],
            ),
            SettingsSection(
              title: 'Notifications',
              children: [
                NotificationTile(
                  title: 'Appointment Reminders',
                  value: appointmentReminders,
                  onChanged: (val) {
                    setState(() {
                      appointmentReminders = val;
                    });
                  },
                ),
                NotificationTile(
                  title: 'Patient Updates',
                  value: patientUpdates,
                  onChanged: (val) {
                    setState(() {
                      patientUpdates = val;
                    });
                  },
                ),
                NotificationTile(
                  title: 'Therapy Alerts',
                  value: therapyAlerts,
                  onChanged: (val) {
                    setState(() {
                      therapyAlerts = val;
                    });
                  },
                ),
              ],
            ),
            SettingsSection(
              title: 'Preferences',
              children: [
                SettingsTile(
                  title: 'Theme',
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Ayurveda', style: TextStyle(color: Colors.grey)),
                      Icon(Icons.chevron_right, color: Colors.grey),
                    ],
                  ),
                  onTap: () {},
                ),
                SettingsTile(
                  title: 'Language',
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('English', style: TextStyle(color: Colors.grey)),
                      Icon(Icons.chevron_right, color: Colors.grey),
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),
            SettingsSection(
              title: 'Support & Help',
              children: [
                SettingsTile(title: 'FAQ', icon: Icons.quiz, onTap: () {}),
                SettingsTile(
                  title: 'Contact Support',
                  icon: Icons.support_agent,
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: 16),
            // Logout button
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.logout, color: Colors.red),
              label: Text(
                'Logout',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.withOpacity(0.1),
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Settings Section Widget
class SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingsSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ExpansionTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        children: children,
        tilePadding: EdgeInsets.symmetric(horizontal: 16),
        childrenPadding: EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}

// Standard Tile
class SettingsTile extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingsTile({
    required this.title,
    this.icon,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: TextStyle(fontSize: 14)),
      leading: icon != null ? Icon(icon, color: Colors.grey) : null,
      trailing: trailing ?? Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }
}

// Notification Tile with Switch
class NotificationTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const NotificationTile({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: TextStyle(fontSize: 14)),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Color(0xFF5A8B43),
      ),
    );
  }
}
