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
    {'name': 'الشمس', 'image': 'assets/images/sun.png'},
    {'name': 'عطارد', 'image': 'assets/images/mercury.png'},
    {'name': 'الزهرة', 'image': 'assets/images/venus.png'},
    {'name': 'الأرض', 'image': 'assets/images/earth.png'},
    {'name': 'المريخ', 'image': 'assets/images/mars.png'},
    {'name': 'المشتري', 'image': 'assets/images/jupiter.png'},
    {'name': 'زحل', 'image': 'assets/images/saturn.png'},
    {'name': 'أورانوس', 'image': 'assets/images/uranus.png'},
    {'name': 'نبتون', 'image': 'assets/images/neptune.png'},
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
              // سيتم إضافة تفاصيل الكواكب هنا لاحقاً
            },
          );
        },
      ),
    );
  }
}
