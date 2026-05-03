import 'package:flutter/material.dart';

void main() {
  runApp(const PlanetsApp());
}

class PlanetsApp extends StatelessWidget {
  const PlanetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planets Explorer',
      theme: ThemeData.dark(),
      home: const PlanetsListScreen(),
    );
  }
}

class PlanetsListScreen extends StatelessWidget {
  const PlanetsListScreen({super.key});

  final List<Map<String, String>> planets = const [
    {'name': 'الشمس', 'image': 'assets/images/sun.png', 'description': 'الشمس هي نجم يقع في مركز المجموعة الشمسية.'},
    {'name': 'عطارد', 'image': 'assets/images/mercury.png', 'description': 'عطارد هو أصغر كواكب المجموعة الشمسية وأقربها إلى الشمس.'},
    {'name': 'الزهرة', 'image': 'assets/images/venus.png', 'description': 'الزهرة هو ثاني كواكب المجموعة الشمسية من حيث القرب من الشمس.'},
    {'name': 'الأرض', 'image': 'assets/images/earth.png', 'description': 'الأرض هي الكوكب الثالث من حيث البعد عن الشمس والكوكب الوحيد المعروف الذي توجد عليه حياة.'},
    {'name': 'المريخ', 'image': 'assets/images/mars.png', 'description': 'المريخ هو الكوكب الرابع من حيث البعد عن الشمس ويُعرف بالكوكب الأحمر.'},
    {'name': 'المشتري', 'image': 'assets/images/jupiter.png', 'description': 'المشتري هو أكبر كواكب المجموعة الشمسية.'},
    {'name': 'زحل', 'image': 'assets/images/saturn.png', 'description': 'زحل هو الكوكب السادس من حيث البعد عن الشمس وهو مشهور بحلقاته.'},
    {'name': 'أورانوس', 'image': 'assets/images/uranus.png', 'description': 'أورانوس هو الكوكب السابع في المجموعة الشمسية.'},
    {'name': 'نبتون', 'image': 'assets/images/neptune.png', 'description': 'نبتون هو ثامن كواكب المجموعة الشمسية وأبعدها عن الشمس.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مستكشف الكواكب')),
      body: ListView.builder(
        itemCount: planets.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(planets[index]['image']!, width: 50),
            title: Text(planets[index]['name']!),
            onTap: () {
              // هذا الجزء هو المسؤول عن فتح صفحة تفاصيل الكوكب
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlanetDetailScreen(planet: planets[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// هذه هي الصفحة الجديدة التي ستفتح عند الضغط على الكوكب
class PlanetDetailScreen extends StatelessWidget {
  final Map<String, String> planet;

  const PlanetDetailScreen({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(planet['name']!)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(child: Image.asset(planet['image']!, width: 200)),
            const SizedBox(height: 20),
            Text(
              planet['name']!,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              planet['description']!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
