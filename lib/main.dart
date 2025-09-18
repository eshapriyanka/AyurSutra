import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sih/section.dart';

void main() {
  runApp(const PanchakarmaApp());
}

class PanchakarmaApp extends StatelessWidget {
  const PanchakarmaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Panchakarma Therapy",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Epilogue'),
      home: const LandingPage(),
      routes: {
        '/section': (context) => const RoleSelectionPage(), // 👈 Add route
      },
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Stack(
          children: [
            // Background
            Positioned.fill(
              child: Image.network(
                "https://lh3.googleusercontent.com/aida-public/AB6AXuBz-SHFexRNHfCpogb7jH5V0zMAWwyqG1l-TOLoiGLhFtkCtjhvk7JMpil4jpp8Kkt8PKU-KdWDYXPqvte6vQbop5LLDTZPHBwrwUkviSEzJP4D_3AXus4IJN8VeTa8fTRuk-97qZn-ZReAL7pXFf05_7KE6Gdb9L7Bi4w6aL9AG6IwYgJq81caXt2UspZ5k47Hb9lHwqaWgwR1cIqu3MXICcz967iGV7UkhUMhkeAXagwLXSCOVlB6hkoplWppYHW1ZzGuuJwZPZ4", // better nature bg
                fit: BoxFit.cover,
              ),
            ),
            // Overlay
            Positioned.fill(
              child: Container(color: Colors.black.withOpacity(0.4)),
            ),

            // Main Content
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo (SVG placeholder)
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: SvgPicture.string('''
<svg xmlns="http://www.w3.org/2000/svg" fill="#DCE7D8" viewBox="0 0 24 24">
  <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 
  10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 
  8 3.59 8 8-3.59 8-8 8z"/>
  <path d="M12 6c-3.31 0-6 2.69-6 6s2.69 6 6 6c.76 0 
  1.5-.14 2.19-.4l-1.63-1.63c-.15.02-.31.03-.47.03-2.21 
  0-4-1.79-4-4s1.79-4 4-4c1.1 0 2.1.45 2.83 1.17L13 
  9h5V4l-1.88 1.88C15.19 6.81 13.66 6 12 6z"/>
</svg>
                        '''),
                    ),
                    const SizedBox(height: 30),

                    // Title
                    const Text(
                      "Healing through Tradition & Technology",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Subtitle
                    const Text(
                      "Experience Panchakarma therapies that blend ancient Ayurveda with modern care.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),

                    const SizedBox(height: 40),

                    // CTA Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                          0xFF4A7C59,
                        ), // primary green
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 14,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/section');
                      },

                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
