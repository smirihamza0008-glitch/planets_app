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
      title: 'Planet Explorer',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF010206),
        primaryColor: Colors.amber,
        fontFamily: 'Cairo', // تأكد من إضافة الخط في pubspec.yaml إذا أردت
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

// --- 1. شاشة الترحيب (Splash Screen) لإلغاء الشاشة السوداء ---
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

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
        MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
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
            Image.asset('assets/images/earth.png', width: 150),
            const SizedBox(height: 20),
            const Text(
              "PLANET EXPLORER",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 4),
            ),
            const SizedBox(height: 10),
            const Text("جاري تحميل أسرار الكون...", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 30),
            const CircularProgressIndicator(color: Colors.amber),
          ],
        ),
      ),
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
    const Center(child: Text('خريطة النجوم قريباً 🔭', style: TextStyle(fontSize: 20, color: Colors.amber))),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
        backgroundColor: const Color(0xFF080A12),
        indicatorColor: Colors.amber.withOpacity(0.2),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.public), label: 'Explorer'),
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
      'name': 'الشمس (The Sun)',
      'image': 'assets/images/sun.png',
      'color': Colors.orangeAccent,
      'gravity_factor': 27.9,
      'year_days': 0.0,
      'is_star': true,
      'details': {
        'نوع النجم': 'قزم أصفر (G2V)',
        'الحرارة (السطح)': '5,500 درجة مئوية',
        'الحرارة (القلب)': '15 مليون درجة مئوية',
        'الطاقة': 'اندماج نووي يحول الهيدروجين لهيليوم',
        'النشاط الشمسي': 'بقع شمسية، انفجارات، ورياح شمسية',
        'التأثير على الأرض': 'الضوء، الحرارة، والتحكم في المناخ والشفق القطبي',
      }
    },
    {
      'name': 'عطارد (Mercury)',
      'image': 'assets/images/mercury.png',
      'color': Colors.grey,
      'gravity_factor': 0.38,
      'year_days': 88,
      'is_star': false,
      'details': {
        'نبذة': 'أصغر الكواكب وأقربها للشمس.',
        'الحجم والقطر': '4,880 كم (38% من الأرض)',
        'الجاذبية': '0.38 g',
        'درجة الحرارة': 'من -180 إلى 430 مئوية',
        'الغلاف الجوي': 'رقيق جداً (إكسوسفير)',
        'التركيب': 'صخري بنواة حديدية ضخمة',
        'اليوم': '59 يوماً أرضياً',
        'السنة': '88 يوماً أرضياً',
        'الأقمار': 'لا يوجد',
        'الحلقات': 'لا يوجد',
        'الموقع': 'الأول من الشمس',
        'الرؤية': 'يرى بالعين المجردة وقت الفجر أو المغرب',
        'الاستكشاف': 'Mariner 10, MESSENGER',
        'حقائق': 'ينكمش حجم الكوكب مع مرور الزمن!'
      }
    },
    {
      'name': 'الزهرة (Venus)',
      'image': 'assets/images/venus.png',
      'color': Colors.orange,
      'gravity_factor': 0.9,
      'year_days': 225,
      'is_star': false,
      'details': {
        'نبذة': 'أحر كوكب وتوأم الأرض الجحيمي.',
        'الجاذبية': '0.90 g',
        'درجة الحرارة': '464 درجة مئوية ثابته',
        'الغلاف الجوي': 'ثاني أكسيد كربون كثيف جداً',
        'السنة': '225 يوماً أرضياً',
        'اليوم': '243 يوماً (أطول من سنته!)',
        'حقائق': 'يدور عكس اتجاه عقارب الساعة.'
      }
    },
    {
      'name': 'الأرض (Earth)',
      'image': 'assets/images/earth.png',
      'color': Colors.blue,
      'gravity_factor': 1.0,
      'year_days': 365,
      'is_star': false,
      'details': {
        'نبذة': 'موطن الحياة والماء السائل.',
        'الغلاف الجوي': 'نيتروجين وأكسجين',
        'الجاذبية': '9.8 m/s²',
        'الأقمار': 'قمر واحد',
        'حقائق': 'الكوكب الوحيد ذو الصفائح التكتونية النشطة.'
      }
    },
    {
      'name': 'المريخ (Mars)',
      'image': 'assets/images/mars.png',
      'color': Colors.red,
      'gravity_factor': 0.38,
      'year_days': 687,
      'is_star': false,
      'details': {
        'نبذة': 'الكوكب الأحمر المليء بالبراكين الخامدة.',
        'الجاذبية': '0.38 g',
        'السنة': '687 يوماً أرضياً',
        'الأقمار': 'فوبوس وديموس',
        'المهمات': 'Perseverance, Curiosity, Hope Probe',
        'حقائق': 'يحتوي على أضخم بركان (أوليمبوس مونس).'
      }
    },
    // يمكن إضافة باقي الكواكب (المشتري، زحل، أورانوس، نبتون) بنفس التنسيق
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PLANET EXPLORER'), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: planets.length,
        itemBuilder: (context, index) {
          final planet = planets[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(15),
              leading: Hero(tag: planet['name'], child: Image.asset(planet['image'], width: 60)),
              title: Text(planet['name'], style: TextStyle(color: planet['color'], fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Text(planet['is_star'] ? 'نجم النظام الشمسي' : 'استكشف أسرار الكوكب'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PlanetDetailScreen(planet: planet))),
            ),
          );
        },
      ),
    );
  }
}

class PlanetDetailScreen extends StatefulWidget {
  final Map<String, dynamic> planet;
  const PlanetDetailScreen({super.key, required this.planet});

  @override
  State<PlanetDetailScreen> createState() => _PlanetDetailScreenState();
}

class _PlanetDetailScreenState extends State<PlanetDetailScreen> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  double _calculatedWeight = 0;
  double _calculatedAge = 0;

  void _calculate() {
    setState(() {
      double weight = double.tryParse(_weightController.text) ?? 0;
      double age = double.tryParse(_ageController.text) ?? 0;
      _calculatedWeight = weight * widget.planet['gravity_factor'];
      if (widget.planet['year_days'] > 0) {
        _calculatedAge = (age * 365) / widget.planet['year_days'];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> details = widget.planet['details'];
    return Scaffold(
      appBar: AppBar(title: Text(widget.planet['name'])),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Hero(tag: widget.planet['name'], child: Image.asset(widget.planet['image'], width: 200)),
            const SizedBox(height: 20),
            
            // --- ميزة الوزن والعمر الفضائي ---
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: Colors.amber.withOpacity(0.1), borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  const Text("⚖️ مختبر الفضاء التفاعلي", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "وزنك على الأرض (kg)", border: OutlineInputBorder()),
                    onChanged: (v) => _calculate(),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "عمرك على الأرض (سنة)", border: OutlineInputBorder()),
                    onChanged: (v) => _calculate(),
                  ),
                  const SizedBox(height: 15),
                  Text("وزنك هنا: ${_calculatedWeight.toStringAsFixed(1)} كجم", style: const TextStyle(fontSize: 16, color: Colors.amber)),
                  if (!widget.planet['is_star'])
                    Text("عمرك هنا: ${_calculatedAge.toStringAsFixed(1)} سنة كوكبية", style: const TextStyle(fontSize: 16, color: Colors.greenAccent)),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            // --- عرض المعلومات الـ 14 ---
            ...details.entries.map((entry) => Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                title: Text(entry.key, style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
                subtitle: Text(entry.value, style: const TextStyle(fontSize: 15)),
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = true;
  String _lang = "العربية";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الإعدادات')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text("اللغة"),
            trailing: Text(_lang),
            onTap: () {
              setState(() {
                _lang = (_lang == "العربية") ? "English" : "العربية";
              });
            },
          ),
          SwitchListTile(
            secondary: const Icon(Icons.notifications),
            title: const Text("إشعارات حقائق الفضاء"),
            value: _notifications,
            onChanged: (v) => setState(() => _notifications = v),
          ),
          const ListTile(leading: Icon(Icons.info_outline), title: Text("الإصدار"), trailing: Text("1.1.0")),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text("تطبيق Planet Explorer - جميع الحقوق محفوظة", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
          )
        ],
      ),
    );
  }
}
