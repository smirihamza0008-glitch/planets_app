import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const PlanetsApp());
}

class PlanetsApp extends StatefulWidget {
  const PlanetsApp({super.key});

  @override
  State<PlanetsApp> createState() => _PlanetsAppState();
}

class _PlanetsAppState extends State<PlanetsApp> {
  bool isArabic = true;

  void toggleLanguage() {
    setState(() {
      isArabic = !isArabic;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: isArabic ? 'مستكشف الكواكب' : 'Planet Explorer',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF010206),
        primaryColor: Colors.amber,
      ),
      home: SplashScreen(isArabic: isArabic, onLangToggle: toggleLanguage),
    );
  }
}

// --- شاشة ترحيب لمنع السواد ---
class SplashScreen extends StatefulWidget {
  final bool isArabic;
  final VoidCallback onLangToggle;
  const SplashScreen({super.key, required this.isArabic, required this.onLangToggle});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => MainNavigationScreen(isArabic: widget.isArabic, onLangToggle: widget.onLangToggle)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.rocket_launch, size: 80, color: Colors.amber),
            const SizedBox(height: 20),
            Text(
              widget.isArabic ? "مستكشف الكواكب" : "PLANET EXPLORER",
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            const CircularProgressIndicator(color: Colors.amber),
          ],
        ),
      ),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  final bool isArabic;
  final VoidCallback onLangToggle;
  const MainNavigationScreen({super.key, required this.isArabic, required this.onLangToggle});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      PlanetsListScreen(isArabic: widget.isArabic),
      const Center(child: Text('Coming Soon...')),
      SettingsScreen(isArabic: widget.isArabic, onLangToggle: widget.onLangToggle),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
        backgroundColor: const Color(0xFF080A12),
        destinations: [
          NavigationDestination(icon: const Icon(Icons.public), label: widget.isArabic ? 'المستكشف' : 'Explorer'),
          NavigationDestination(icon: const Icon(Icons.explore), label: widget.isArabic ? 'اكتشف' : 'Discover'),
          NavigationDestination(icon: const Icon(Icons.settings), label: widget.isArabic ? 'الإعدادات' : 'Settings'),
        ],
      ),
    );
  }
}

class PlanetsListScreen extends StatelessWidget {
  final bool isArabic;
  const PlanetsListScreen({super.key, required this.isArabic});

  List<Map<String, dynamic>> getPlanetsData() {
    return [
      {
        'name': isArabic ? 'الشمس' : 'The Sun',
        'image': 'assets/images/sun.png',
        'color': Colors.orangeAccent,
        'gravity': 27.9,
        'year_factor': 1.0,
        'is_star': true,
        'content': [
          {'t': isArabic ? '🔥 نوع النجم' : '🔥 Star Type', 'b': isArabic ? 'قزم أصفر (G2V)' : 'Yellow Dwarf (G2V)'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temperature', 'b': isArabic ? 'السطح: 5500°C | القلب: 15 مليون°C' : 'Surface: 5500°C | Core: 15M°C'},
          {'t': isArabic ? '⚡ الطاقة والإشعاع' : '⚡ Energy', 'b': isArabic ? 'الاندماج النووي المستمر' : 'Continuous nuclear fusion'},
          {'t': isArabic ? '🌋 النشاط الشمسي' : '🌋 Solar Activity', 'b': isArabic ? 'البقع والانفجارات الشمسية' : 'Sunspots and solar flares'},
          {'t': isArabic ? '🌍 تأثيرها على الأرض' : '🌍 Earth Impact', 'b': isArabic ? 'مصدر الضوء والحرارة' : 'Source of light and heat'},
        ]
      },
      {
        'name': isArabic ? 'عطارد' : 'Mercury',
        'image': 'assets/images/mercury.png',
        'color': Colors.grey,
        'gravity': 0.38,
        'year_factor': 0.24,
        'is_star': false,
        'content': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'أصغر الكواكب وأقربها للشمس' : 'Smallest and closest planet'},
          {'t': isArabic ? '📏 الحجم والقطر' : '📏 Diameter', 'b': '4,880 كم'},
          {'t': isArabic ? '⚖️ الجاذبية' : '⚖️ Gravity', 'b': '3.7 m/s²'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': '-180 to 430°C'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'رقيق جداً' : 'Extremely thin'},
          {'t': isArabic ? '🧱 التركيب' : '🧱 Composition', 'b': isArabic ? 'صخري' : 'Terrestrial'},
          {'t': isArabic ? '🔄 اليوم' : '🔄 Day', 'b': isArabic ? '59 يوم أرضي' : '59 Earth days'},
          {'t': isArabic ? '☀️ السنة' : '☀️ Year', 'b': isArabic ? '88 يوم أرضي' : '88 Earth days'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': '0'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'لا يوجد' : 'None'},
          {'t': isArabic ? '📍 الموقع' : '📍 Location', 'b': '1st'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 Visibility', 'b': isArabic ? 'يرى عند الغسق' : 'Visible at twilight'},
          {'t': isArabic ? '🚀 المهمات' : '🚀 Missions', 'b': 'MESSENGER'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'ينكمش حجمه' : 'Shrinking planet'},
        ]
      },
      {
        'name': isArabic ? 'الزهرة' : 'Venus',
        'image': 'assets/images/venus.png',
        'color': Colors.orange,
        'gravity': 0.9,
        'year_factor': 0.61,
        'is_star': false,
        'content': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'توأم الأرض والأكثر حرارة' : 'Earth\'s twin and hottest planet'},
          {'t': isArabic ? '📏 الحجم' : '📏 Size', 'b': '12,104 كم'},
          {'t': isArabic ? '⚖️ الجاذبية' : '⚖️ Gravity', 'b': '8.87 m/s²'},
          {'t': isArabic ? '🌡️ الحرارة' : '🌡️ Temp', 'b': '464°C'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': 'CO2'},
          {'t': isArabic ? '🧱 التركيب' : '🧱 Composition', 'b': isArabic ? 'صخري' : 'Terrestrial'},
          {'t': isArabic ? '🔄 اليوم' : '🔄 Day', 'b': '243 days'},
          {'t': isArabic ? '☀️ السنة' : '☀️ Year', 'b': '225 days'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': '0'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': 'None'},
          {'t': isArabic ? '📍 الموقع' : '📍 Location', 'b': '2nd'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 Visibility', 'b': isArabic ? 'نجمة الصباح' : 'Morning star'},
          {'t': isArabic ? '🚀 المهمات' : '🚀 Missions', 'b': 'Magellan'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'يدور بالعكس' : 'Rotates backward'},
        ]
      },
      {
        'name': isArabic ? 'الأرض' : 'Earth',
        'image': 'assets/images/earth.png',
        'color': Colors.blue,
        'gravity': 1.0,
        'year_factor': 1.0,
        'is_star': false,
        'content': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'موطننا الوحيد' : 'Our only home'},
          {'t': isArabic ? '📏 الحجم' : '📏 Size', 'b': '12,756 كم'},
          {'t': isArabic ? '⚖️ الجاذبية' : '⚖️ Gravity', 'b': '9.8 m/s²'},
          {'t': isArabic ? '🌡️ الحرارة' : '🌡️ Temp', 'b': '15°C'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': 'N2, O2'},
          {'t': isArabic ? '🧱 التركيب' : '🧱 Composition', 'b': isArabic ? 'صخري' : 'Terrestrial'},
          {'t': isArabic ? '🔄 اليوم' : '🔄 Day', 'b': '24 hours'},
          {'t': isArabic ? '☀️ السنة' : '☀️ Year', 'b': '365 days'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': '1'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': 'None'},
          {'t': isArabic ? '📍 الموقع' : '📍 Location', 'b': '3rd'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 Visibility', 'b': isArabic ? 'من الفضاء' : 'From space'},
          {'t': isArabic ? '🚀 المهمات' : '🚀 Missions', 'b': 'ISS'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'ماء سائل' : 'Liquid water'},
        ]
      },
      {
        'name': isArabic ? 'المريخ' : 'Mars',
        'image': 'assets/images/mars.png',
        'color': Colors.red,
        'gravity': 0.38,
        'year_factor': 1.88,
        'is_star': false,
        'content': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'الكوكب الأحمر' : 'The Red Planet'},
          {'t': isArabic ? '📏 الحجم' : '📏 Size', 'b': '6,792 كم'},
          {'t': isArabic ? '⚖️ الجاذبية' : '⚖️ Gravity', 'b': '3.7 m/s²'},
          {'t': isArabic ? '🌡️ الحرارة' : '🌡️ Temp', 'b': '-65°C'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': 'Thin CO2'},
          {'t': isArabic ? '🧱 التركيب' : '🧱 Composition', 'b': isArabic ? 'صخري' : 'Terrestrial'},
          {'t': isArabic ? '🔄 اليوم' : '🔄 Day', 'b': '24.6 hours'},
          {'t': isArabic ? '☀️ السنة' : '☀️ Year', 'b': '687 days'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': '2'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': 'None'},
          {'t': isArabic ? '📍 الموقع' : '📍 Location', 'b': '4th'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 Visibility', 'b': isArabic ? 'نقطة حمراء' : 'Red dot'},
          {'t': isArabic ? '🚀 المهمات' : '🚀 Missions', 'b': 'Perseverance'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'براكين ضخمة' : 'Giant volcanoes'},
        ]
      },
      {
        'name': isArabic ? 'المشتري' : 'Jupiter',
        'image': 'assets/images/jupiter.png',
        'color': Colors.brown,
        'gravity': 2.53,
        'year_factor': 11.86,
        'is_star': false,
        'content': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'أكبر الكواكب' : 'The largest planet'},
          {'t': isArabic ? '📏 الحجم' : '📏 Size', 'b': '142,984 كم'},
          {'t': isArabic ? '⚖️ الجاذبية' : '⚖️ Gravity', 'b': '24.79 m/s²'},
          {'t': isArabic ? '🌡️ الحرارة' : '🌡️ Temp', 'b': '-110°C'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': 'H, He'},
          {'t': isArabic ? '🧱 التركيب' : '🧱 Composition', 'b': isArabic ? 'غازي' : 'Gas Giant'},
          {'t': isArabic ? '🔄 اليوم' : '🔄 Day', 'b': '9.9 hours'},
          {'t': isArabic ? '☀️ السنة' : '☀️ Year', 'b': '12 years'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': '95'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'باهتة' : 'Faint'},
          {'t': isArabic ? '📍 الموقع' : '📍 Location', 'b': '5th'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 Visibility', 'b': isArabic ? 'ساطع جداً' : 'Very bright'},
          {'t': isArabic ? '🚀 المهمات' : '🚀 Missions', 'b': 'Juno'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'البقعة الحمراء' : 'Great Red Spot'},
        ]
      },
      {
        'name': isArabic ? 'زحل' : 'Saturn',
        'image': 'assets/images/saturn.png',
        'color': Colors.amberAccent,
        'gravity': 1.06,
        'year_factor': 29.45,
        'is_star': false,
        'content': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'ملك الحلقات' : 'King of Rings'},
          {'t': isArabic ? '📏 الحجم' : '📏 Size', 'b': '120,536 كم'},
          {'t': isArabic ? '⚖️ الجاذبية' : '⚖️ Gravity', 'b': '10.44 m/s²'},
          {'t': isArabic ? '🌡️ الحرارة' : '🌡️ Temp', 'b': '-140°C'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': 'H, He'},
          {'t': isArabic ? '🧱 التركيب' : '🧱 Composition', 'b': isArabic ? 'غازي' : 'Gas Giant'},
          {'t': isArabic ? '🔄 اليوم' : '🔄 Day', 'b': '10.7 hours'},
          {'t': isArabic ? '☀️ السنة' : '☀️ Year', 'b': '29 years'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': '146'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'واضحة جداً' : 'Prominent'},
          {'t': isArabic ? '📍 الموقع' : '📍 Location', 'b': '6th'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 Visibility', 'b': isArabic ? 'بالتلسكوب' : 'With telescope'},
          {'t': isArabic ? '🚀 المهمات' : '🚀 Missions', 'b': 'Cassini'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'يطفو على الماء' : 'Could float on water'},
        ]
      },
      {
        'name': isArabic ? 'أورانوس' : 'Uranus',
        'image': 'assets/images/uranus.png',
        'color': Colors.cyan,
        'gravity': 0.9,
        'year_factor': 84.0,
        'is_star': false,
        'content': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'العملاق الجليدي' : 'Ice Giant'},
          {'t': isArabic ? '📏 الحجم' : '📏 Size', 'b': '51,118 كم'},
          {'t': isArabic ? '⚖️ الجاذبية' : '⚖️ Gravity', 'b': '8.69 m/s²'},
          {'t': isArabic ? '🌡️ الحرارة' : '🌡️ Temp', 'b': '-195°C'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': 'H, He, Methane'},
          {'t': isArabic ? '🧱 التركيب' : '🧱 Composition', 'b': isArabic ? 'جليدي' : 'Ice Giant'},
          {'t': isArabic ? '🔄 اليوم' : '🔄 Day', 'b': '17 hours'},
          {'t': isArabic ? '☀️ السنة' : '☀️ Year', 'b': '84 years'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': '27'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'موجودة' : 'Yes'},
          {'t': isArabic ? '📍 الموقع' : '📍 Location', 'b': '7th'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 Visibility', 'b': isArabic ? 'صعبة جداً' : 'Very difficult'},
          {'t': isArabic ? '🚀 المهمات' : '🚀 Missions', 'b': 'Voyager 2'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'يدور على جنبه' : 'Rotates on its side'},
        ]
      },
      {
        'name': isArabic ? 'نبتون' : 'Neptune',
        'image': 'assets/images/neptune.png',
        'color': Colors.indigo,
        'gravity': 1.14,
        'year_factor': 164.8,
        'is_star': false,
        'content': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'الكوكب الأزرق البعيد' : 'Distant blue planet'},
          {'t': isArabic ? '📏 الحجم' : '📏 Size', 'b': '49,528 كم'},
          {'t': isArabic ? '⚖️ الجاذبية' : '⚖️ Gravity', 'b': '11.15 m/s²'},
          {'t': isArabic ? '🌡️ الحرارة' : '🌡️ Temp', 'b': '-201°C'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': 'H, He, Methane'},
          {'t': isArabic ? '🧱 التركيب' : '🧱 Composition', 'b': isArabic ? 'جليدي' : 'Ice Giant'},
          {'t': isArabic ? '🔄 اليوم' : '🔄 Day', 'b': '16 hours'},
          {'t': isArabic ? '☀️ السنة' : '☀️ Year', 'b': '165 years'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': '14'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? '6 حلقات' : '6 rings'},
          {'t': isArabic ? '📍 الموقع' : '📍 Location', 'b': '8th'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 Visibility', 'b': isArabic ? 'بالتلسكوبات فقط' : 'Telescope only'},
          {'t': isArabic ? '🚀 المهمات' : '🚀 Missions', 'b': 'Voyager 2'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'أسرع رياح' : 'Fastest winds'},
        ]
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final planets = getPlanetsData();
    return Scaffold(
      appBar: AppBar(
        title: Text(isArabic ? 'مستكشف الكواكب' : 'Planet Explorer'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: planets.length,
              itemBuilder: (context, index) {
                final planet = planets[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                      colors: [const Color(0xFF161B22), planet['color'].withOpacity(0.2)],
                    ),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(20),
                    leading: Image.asset(planet['image'], width: 60),
                    title: Text(
                      planet['name'],
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: planet['color']),
                    ),
                    subtitle: Text(isArabic ? 'اضغط للمزيد' : 'Tap for details'),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScreen(planet: planet, isArabic: isArabic))),
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Developed by Hamza Store", style: TextStyle(color: Colors.white12, fontSize: 10)),
          )
        ],
      ),
    );
  }
}

class DetailScreen extends StatefulWidget {
  final Map<String, dynamic> planet;
  final bool isArabic;
  const DetailScreen({super.key, required this.planet, required this.isArabic});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  double _weightResult = 0;
  double _ageResult = 0;

  @override
  Widget build(BuildContext context) {
    final content = widget.planet['content'] as List;
    return Scaffold(
      appBar: AppBar(title: Text(widget.planet['name'])),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset(widget.planet['image'], width: 180),
            const SizedBox(height: 20),
            Text(widget.planet['name'], style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: widget.planet['color'])),
            const SizedBox(height: 25),
            
            // حاسبة الوزن المستقلة
            _buildCalcBox(
              title: widget.isArabic ? "حاسبة الوزن (kg)" : "Weight Calculator",
              hint: widget.isArabic ? "وزنك على الأرض" : "Weight on Earth",
              resultPrefix: widget.isArabic ? "وزنك هنا:" : "Weight here:",
              result: _weightResult,
              unit: "kg",
              onChanged: (v) {
                setState(() {
                  double val = double.tryParse(v) ?? 0;
                  _weightResult = val * widget.planet['gravity'];
                });
              },
            ),

            const SizedBox(height: 15),

            // حاسبة العمر المستقلة (تختفي في الشمس)
            if (!widget.planet['is_star'])
            _buildCalcBox(
              title: widget.isArabic ? "حاسبة العمر (سنة)" : "Age Calculator",
              hint: widget.isArabic ? "عمرك على الأرض" : "Age on Earth",
              resultPrefix: widget.isArabic ? "عمرك هنا:" : "Age here:",
              result: _ageResult,
              unit: widget.isArabic ? "سنة" : "Years",
              onChanged: (v) {
                setState(() {
                  double val = double.tryParse(v) ?? 0;
                  _ageResult = val / widget.planet['year_factor'];
                });
              },
            ),
            
            const SizedBox(height: 30),
            ...content.map((item) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.03),
                borderRadius: BorderRadius.circular(15),
                border: Border(right: BorderSide(color: widget.planet['color'], width: 4)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['t'], style: TextStyle(fontWeight: FontWeight.bold, color: widget.planet['color'], fontSize: 17)),
                  const SizedBox(height: 8),
                  Text(item['b'], style: const TextStyle(fontSize: 15, height: 1.4)),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildCalcBox({
    required String title,
    required String hint,
    required String resultPrefix,
    required double result,
    required String unit,
    required Function(String) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
          TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(hintText: hint, border: InputBorder.none),
            onChanged: onChanged,
          ),
          if (result > 0)
            Text("$resultPrefix ${result.toStringAsFixed(1)} $unit",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  final bool isArabic;
  final VoidCallback onLangToggle;
  const SettingsScreen({super.key, required this.isArabic, required this.onLangToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isArabic ? 'الإعدادات' : 'Settings')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListTile(
            leading: const Icon(Icons.language, color: Colors.blueAccent),
            title: Text(isArabic ? 'تغيير اللغة' : 'Change Language'),
            trailing: Text(isArabic ? 'العربية' : 'English', style: const TextStyle(color: Colors.amber)),
            onTap: onLangToggle,
          ),
          ListTile(
            leading: const Icon(Icons.star_rate, color: Colors.orangeAccent),
            title: Text(isArabic ? 'تقييم التطبيق' : 'Rate App'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info_outline, color: Colors.grey),
            title: Text(isArabic ? 'الإصدار' : 'Version'),
            trailing: const Text('1.0.0'),
          ),
          const Divider(height: 40),
          const Center(child: Text("Developed by Hamza Store", style: TextStyle(color: Colors.white24))),
        ],
      ),
    );
  }
}
