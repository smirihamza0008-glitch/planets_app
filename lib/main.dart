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
      title: 'Planet Explorer: Space Guide',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF010206),
        primaryColor: Colors.amber,
        useMaterial3: true,
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const PlanetsListScreen(),
    const Center(child: Text('Star Map Coming Soon 🔭', style: TextStyle(fontSize: 20, color: Colors.amber))),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomSheet: Container(
        height: 55,
        width: double.infinity,
        color: Colors.black,
        child: const Center(
          child: Text('AD SPACE (Google AdMob)', 
            style: TextStyle(color: Colors.white24, fontSize: 11, letterSpacing: 1.2)),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
        backgroundColor: const Color(0xFF080A12),
        indicatorColor: Colors.amber.withOpacity(0.2),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.public, color: Colors.blueAccent), label: 'Explorer'),
          NavigationDestination(icon: Icon(Icons.explore_outlined, color: Colors.greenAccent), label: 'Discover'),
          NavigationDestination(icon: Icon(Icons.settings_outlined, color: Colors.grey), label: 'Settings'),
        ],
      ),
    );
  }
}

class PlanetsListScreen extends StatelessWidget {
  const PlanetsListScreen({super.key});

  final List<Map<String, dynamic>> planets = const [
    {
      'name': 'Earth (الأرض)',
      'image': 'assets/images/earth.png',
      'color': Colors.blue,
      'tagline': 'The Cradle of Life',
      'content': [
        {'title': '1. قصة الخلق والنشأة', 'body': 'بدأت رحلة الأرض منذ حوالي 4.54 مليار سنة، نشأت من تجمع الغبار والغاز الكوني حول الشمس الوليدة.', 'color': Colors.blue},
        {'title': '2. المكانة الفلكية', 'body': 'البعد عن الشمس: 150 مليون كم (المسافة الذهبية). القطر الاستوائي: 12,756 كم.', 'color': Colors.greenAccent},
      ]
    },
    {
      'name': 'Mars (المريخ)',
      'image': 'assets/images/mars.png',
      'color': Colors.red,
      'tagline': 'The Red Frontier',
      'content': [
        {'title': '1. لغز الكوكب الأحمر', 'body': 'كان المريخ قديماً يضم أنهاراً وبحاراً، لكنه تحول لصحراء متجمدة غنية بأكسيد الحديد.', 'color': Colors.redAccent},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planet Explorer', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 80),
        itemCount: planets.length,
        itemBuilder: (context, index) {
          final planet = planets[index];
          return Card(
            elevation: 12,
            margin: const EdgeInsets.only(bottom: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PlanetDetailScreen(planet: planet))),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    colors: [const Color(0xFF0D1117), planet['color'].withOpacity(0.1)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  children: [
                    Hero(tag: planet['name'], child: Image.asset(planet['image'], width: 70)),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(planet['name'], style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: planet['color'])),
                          Text(planet['tagline'], style: const TextStyle(color: Colors.grey, fontSize: 13)),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white24),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PlanetDetailScreen extends StatelessWidget {
  final Map<String, dynamic> planet;
  const PlanetDetailScreen({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> content = planet['content'];
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Hero(
                tag: planet['name'],
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: planet['color'].withOpacity(0.4), blurRadius: 100, spreadRadius: 5),
                    ],
                  ),
                  child: Image.asset(planet['image'], width: 220, fit: BoxFit.contain),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(planet['name'], style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: planet['color'])),
            const SizedBox(height: 30),
            ...content.map((item) => Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 25),
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.03),
                borderRadius: BorderRadius.circular(20),
                // تم تصحيح الخطأ البرمجي هنا
                border: Border(left: BorderSide(color: item['color'], width: 6)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['title'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: item['color'])),
                  const SizedBox(height: 12),
                  Text(item['body'], style: const TextStyle(fontSize: 16, height: 1.6, color: Colors.white)),
                ],
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const Center(child: Text('Developed by Hamza Store')),
    );
  }
}
