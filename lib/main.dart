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
      title: 'موسوعة الفضاء الاحترافية',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF020408),
        primaryColor: Colors.deepPurpleAccent,
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
    const Center(child: Text('خريطة النجوم قريباً ✨', style: TextStyle(fontSize: 20))),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      // شريط الإعلانات في الأسفل
      bottomSheet: Container(
        height: 50,
        color: Colors.grey[900],
        child: const Center(child: Text('مساحة إعلانية (AdMob Banner)', style: TextStyle(color: Colors.white54, fontSize: 12))),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.auto_stories), label: 'الموسوعة'),
          NavigationDestination(icon: Icon(Icons.explore_outlined), label: 'استكشاف'),
          NavigationDestination(icon: Icon(Icons.settings_outlined), label: 'الإعدادات'),
        ],
      ),
    );
  }
}

class PlanetsListScreen extends StatelessWidget {
  const PlanetsListScreen({super.key});

  final List<Map<String, dynamic>> planets = const [
    {
      'name': 'الأرض',
      'image': 'assets/images/earth.png',
      'color': Colors.blue,
      'content': [
        {'title': '1. ملحمة الوجود والنشأة', 'body': 'نشأت الأرض منذ 4.54 مليار سنة من غبار كوني دوار. مرت بمراحل قاسية حتى تكون القمر، ثم بردت لتشكل القشرة الصخرية والمحيطات الأولى التي احتضنت بذور الحياة.', 'color': Colors.blue},
        {'title': '2. المكانة الفلكية (المسافة الذهبية)', 'body': 'تبعد 150 مليون كم عن الشمس، وهي المسافة المثالية التي تمنع احتراق المياه أو تجمدها بالكامل.', 'color': Colors.green},
        {'title': '3. البنية والدرع المغناطيسي', 'body': 'تمتلك لباً من الحديد والنيكل يولد مجالاً مغناطيسياً يحمينا من الإشعاعات الكونية القاتلة.', 'color': Colors.orange},
      ]
    },
    {
      'name': 'المريخ',
      'image': 'assets/images/mars.png',
      'color': Colors.red,
      'content': [
        {'title': '1. لغز الكوكب الأحمر', 'body': 'كان المريخ قديماً كوكباً رطباً يضم أنهاراً وبحاراً، لكنه فقد غلافه الجوي تدريجياً ليتحول إلى صحراء متجمدة غنية بأكسيد الحديد.', 'color': Colors.red},
        {'title': '2. الأبعاد والجاذبية', 'body': 'قطره 6,779 كم وجاذبيته تعادل 38% من جاذبية الأرض، مما يجعله هدفاً سهلاً للهبوط البشري المستقبلي.', 'color': Colors.amber},
        {'title': '3. تضاريس عملاقة', 'body': 'يضم "جبل أوليمبوس" وهو بركان بارتفاع 25 كم، أي ثلاثة أضعاف جبل إيفرست.', 'color': Colors.deepOrange},
      ]
    },
    // يمكن تكرار النمط لبقية الكواكب (عطارد، الزهرة، المشتري، زحل، إلخ)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🚀 موسوعة الوجود', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 60),
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
                          Text(planet['name'], style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: planet['color'])),
                          const Text('اضغط للتفاصيل المعمقة...', style: TextStyle(color: Colors.grey, fontSize: 13)),
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Center(child: Hero(tag: planet['name'], child: Image.asset(planet['image'], width: 180))),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(planet['name'], style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: planet['color'])),
                    const SizedBox(height: 25),
                    ...content.map((item) => Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.04),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.left(color: item['color'], width: 4),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['title'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: item['color'])),
                          const SizedBox(height: 10),
                          Text(item['body'], style: const TextStyle(fontSize: 16, height: 1.5)),
                        ],
                      ),
                    )).toList(),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الإعدادات')),
      body: ListView(
        children: [
          ListTile(leading: const Icon(Icons.language), title: const Text('اللغة'), trailing: const Text('العربية')),
          ListTile(leading: const Icon(Icons.notifications), title: const Text('الإشعارات'), trailing: Switch(value: true, onChanged: (v){})),
          ListTile(leading: const Icon(Icons.star_rate), title: const Text('تقييم التطبيق'), onTap: (){}),
          ListTile(leading: const Icon(Icons.info), title: const Text('عن الموسوعة'), onTap: (){}),
        ],
      ),
    );
  }
}
