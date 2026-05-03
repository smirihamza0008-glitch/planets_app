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
    const Center(child: Text('Star Map coming soon ✨', style: TextStyle(fontSize: 20))),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomSheet: Container(
        height: 50,
        width: double.infinity,
        color: Colors.black,
        child: const Center(
          child: Text('AD SPACE (Google AdMob)', 
            style: TextStyle(color: Colors.white24, fontSize: 11)),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.auto_stories), label: 'Explorer'),
          NavigationDestination(icon: Icon(Icons.explore_outlined), label: 'Discover'),
          NavigationDestination(icon: Icon(Icons.settings_outlined), label: 'Settings'),
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
      'content': [
        {'title': '1. ملحمة الوجود والنشأة', 'body': 'بدأت رحلة الأرض منذ حوالي 4.54 مليار سنة، حيث نشأت من تجمع الغبار والغاز الكوني حول الشمس الوليدة. مرت بمراحل قاسية من الاصطدامات النيزكية حتى تكون القمر، ثم بدأت تبرد تدريجياً لتشكل القشرة الصخرية والمحيطات الأولى.', 'color': Colors.blue},
        {'title': '2. المكانة الفلكية والأرقام', 'body': '• البعد عن الشمس: 150 مليون كم (المسافة الذهبية).\n• قطر الكوكب: 12,756 كم.\n• المحيط: يبلغ طول محيط الأرض حول خط الاستواء حوالي 40,075 كم.', 'color': Colors.green},
        {'title': '3. البنية الداخلية: طبقات الكوكب', 'body': 'القشرة: الطبقة الخارجية الرقيقة.\nالوشاح: طبقة شبه صلبة تتحرك وتسبب حركة القارات.\nاللب (المركز): يتكون من حديد ونيكل، وهو المسؤول عن توليد المجال المغناطيسي الحامي.', 'color': Colors.orange},
        {'title': '4. الأغلفة الحيوية الأربعة', 'body': 'تعتمد الأرض على توازن الغلاف الجوي (أكسجين)، المائي (71% مياه)، الصخري (القارات)، والحيوي (الكائنات الحية).', 'color': Colors.cyan},
      ]
    },
    {
      'name': 'Mars (المريخ)',
      'image': 'assets/images/mars.png',
      'color': Colors.red,
      'content': [
        {'title': '1. من الكوكب الرطب إلى الصحراء', 'body': 'كان المريخ قديماً يضم أنهاراً وبحاراً غلافاً جوياً سميكاً. فقد لبه النشط فضعف مجاله المغناطيسي، وسرقت الرياح الشمسية هواءه ليتحول لصحراء حمراء متجمدة.', 'color': Colors.red},
        {'title': '2. الأرقام والجاذبية', 'body': '• القطر: 6,779 كم.\n• الجاذبية: 38% من جاذبية الأرض.\n• اليوم المريخي: 24 ساعة و39 دقيقة.', 'color': Colors.amber},
        {'title': '3. تضاريس الأرقام القياسية', 'body': 'يضم "أوليمبوس مونس"، وهو بركان بارتفاع 25 كم، و"وادي البحارة" الذي يمتد بطول قارة كاملة.', 'color': Colors.deepOrange},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planet Explorer', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 65),
        itemCount: planets.length,
        itemBuilder: (context, index) {
          final planet = planets[index];
          return Card(
            elevation: 10,
            margin: const EdgeInsets.only(bottom: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PlanetDetailScreen(planet: planet))),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [Colors.black, planet['color'].withOpacity(0.15)]),
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
                          const Text('Click to explore secrets...', style: TextStyle(color: Colors.grey, fontSize: 12)),
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
                      BoxShadow(color: planet['color'].withOpacity(0.4), blurRadius: 80, spreadRadius: 10),
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
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.04),
                borderRadius: BorderRadius.circular(20),
                border: Border.left(color: item['color'], width: 5),
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
      body: ListView(
        children: [
          const ListTile(leading: Icon(Icons.language), title: Text('Language'), trailing: Text('Arabic/English')),
          ListTile(leading: const Icon(Icons.notifications_outlined), title: const Text('Notifications'), trailing: Switch(value: true, onChanged: (v){})),
          const ListTile(leading: Icon(Icons.info_outline), title: Text('About App')),
        ],
      ),
    );
  }
}
