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
      title: 'Planet Explorer',
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

  // قائمة الكواكب الكاملة مع المعلومات المعمقة
  final List<Map<String, dynamic>> planets = const [
    {
      'name': 'Earth (الأرض)',
      'image': 'assets/images/earth.png',
      'color': Colors.blue,
      'tagline': 'The Cradle of Life',
      'content': [
        {'title': '1. قصة الخلق والنشأة', 'body': 'بدأت رحلة الأرض منذ حوالي 4.54 مليار سنة، نشأت من تجمع الغبار والغاز الكوني حول الشمس الوليدة. مرت بمراحل قاسية حتى تكون القمر، ثم بردت لتشكل القشرة والمحيطات.', 'color': Colors.blue},
        {'title': '2. المكانة الفلكية', 'body': 'البعد عن الشمس: 150 مليون كم. القطر الاستوائي: 12,756 كم. وهي الكوكب الوحيد المعروف بوجود حياة.', 'color': Colors.greenAccent},
        {'title': '3. الغلاف الجوي والدرع', 'body': 'يحمينا غلافنا الجوي من النيازك، بينما يحمينا المجال المغناطيسي من الرياح الشمسية القاتلة.', 'color': Colors.cyanAccent},
      ]
    },
    {
      'name': 'Mars (المريخ)',
      'image': 'assets/images/mars.png',
      'color': Colors.red,
      'tagline': 'The Red Frontier',
      'content': [
        {'title': '1. لغز الكوكب الأحمر', 'body': 'كان المريخ قديماً يضم أنهاراً وبحاراً، لكنه تحول لصحراء متجمدة غنية بأكسيد الحديد (الصدأ).', 'color': Colors.redAccent},
        {'title': '2. الأرقام والقياسات', 'body': 'القطر: 6,779 كم. الجاذبية: 38% من جاذبية الأرض. اليوم المريخي: 24 ساعة و39 دقيقة.', 'color': Colors.amberAccent},
      ]
    },
    {
      'name': 'Jupiter (المشتري)',
      'image': 'assets/images/jupiter.png',
      'color': Colors.orange,
      'tagline': 'The Gas Giant',
      'content': [
        {'title': '1. ملك الكواكب', 'body': 'أضخم كواكب المجموعة الشمسية. يتكون معظمه من الهيدروجين والهيليوم، ولا يمتلك سطحاً صلباً للوقوف عليه.', 'color': Colors.orangeAccent},
        {'title': '2. البقعة الحمراء العظيمة', 'body': 'يتميز بإعصار ضخم مستمر منذ مئات السنين، حجمه أكبر من كوكب الأرض مرتين.', 'color': Colors.red},
      ]
    },
    {
      'name': 'Saturn (زحل)',
      'image': 'assets/images/saturn.png',
      'color': Colors.amber,
      'tagline': 'Jewel of the Solar System',
      'content': [
        {'title': '1. نظام الحلقات المذهل', 'body': 'يشتهر بحلقاته المكونة من كتل الجليد والصخور والغبار التي تدور حوله بجمال أخاذ.', 'color': Colors.amberAccent},
        {'title': '2. كثافة منخفضة', 'body': 'زحل كوكب خفيف جداً، لدرجة أنه لو وجد محيط مائي ضخم بما يكفي، فإن زحل سيطفو فوقه!', 'color': Colors.yellowAccent},
      ]
    },
    {
      'name': 'Mercury (عطارد)',
      'image': 'assets/images/mercury.png',
      'color': Colors.grey,
      'tagline': 'The Swift Planet',
      'content': [
        {'title': '1. الأقرب للشمس', 'body': 'أصغر كوكب وأقربها للشمس، يتميز بتقلبات حرارية هائلة بين الليل والنهار.', 'color': Colors.grey},
      ]
    },
    {
      'name': 'Venus (الزهرة)',
      'image': 'assets/images/venus.png',
      'color': Colors.brown,
      'tagline': 'The Veiled Planet',
      'content': [
        {'title': '1. توأم الأرض الجحيمي', 'body': 'يشبه الأرض في الحجم، لكنه أحر كوكب بسبب الاحتباس الحراري، حيث تصل حرارته لـ 470 درجة مئوية.', 'color': Colors.orange},
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
      appBar: AppBar(title: const Text('Settings'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          const ListTile(leading: Icon(Icons.language, color: Colors.blue), title: Text('Language'), trailing: Text('Arabic/English')),
          ListTile(leading: const Icon(Icons.notifications_active, color: Colors.green), title: const Text('Notifications'), trailing: Switch(value: true, onChanged: (v){})),
          const ListTile(leading: Icon(Icons.star, color: Colors.amber), title: Text('Rate App')),
          const ListTile(leading: Icon(Icons.info, color: Colors.grey), title: Text('About App')),
          const SizedBox(height: 40),
          const Center(child: Text('Version 1.0.0\nDeveloped for Space Lovers', style: TextStyle(color: Colors.white24), textAlign: TextAlign.center)),
        ],
      ),
    );
  }
}
