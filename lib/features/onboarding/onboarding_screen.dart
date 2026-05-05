import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _index = 0;

  final List<Map<String, dynamic>> pages = [
    {
      "title": "Selamat Datang",
      "desc": "Aplikasi Survey Produk modern dan mudah digunakan",
      "icon": Icons.waving_hand,
    },
    {
      "title": "Kelola Data",
      "desc": "Pantau dan kelola data survey dengan cepat",
      "icon": Icons.analytics,
    },
    {
      "title": "Laporan Real-time",
      "desc": "Dapatkan hasil analisis secara langsung",
      "icon": Icons.bar_chart,
    },
  ];

  void next() {
    if (_index < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/splash');
    }
  }

  void skip() {
    Navigator.pushReplacementNamed(context, '/splash');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.primaryGradient,
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (i) => setState(() => _index = i),
                itemCount: pages.length,
                itemBuilder: (context, i) {
                  final item = pages[i];

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 🔥 ICON ILUSTRASI
                      Container(
                        padding: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          item["icon"],
                          size: 90,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 30),

                      Text(
                        item["title"],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          item["desc"],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // DOT INDICATOR
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _index == i ? 18 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _index == i ? Colors.white : Colors.white54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // BUTTON
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  TextButton(
                    onPressed: skip,
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: next,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppTheme.primary,
                    ),
                    child: Text(
                      _index == pages.length - 1 ? "Get Started" : "Next",
                    ),
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