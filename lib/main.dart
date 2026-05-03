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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF010206),
        primaryColor: Colors.amber,
      ),
      home: const SplashScreen(),
    );
  }
}

// --- 1. شاشة ترحيب (Splash Screen) لمنع السواد وتحسين الجمالية ---
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
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MainNavigationScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.stars, size: 80, color: Colors.amber),
            const SizedBox(height: 20),
            const Text("PLANET EXPLORER", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, letterSpacing: 3)),
            const SizedBox(height: 10),
            const Text("جاري تحميل أسرار الكون...", style: TextStyle(color: Colors.white38)),
            const SizedBox(height: 40),
            const CircularProgressIndicator(color: Colors.amber, strokeWidth: 2),
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
    const Center(child: Text('خريطة النجوم - قريباً 🔭', style: TextStyle(fontSize: 20, color: Colors.amber))),
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
        destinations: const [
          NavigationDestination(icon: Icon(Icons.public), label: 'المستكشف'),
          NavigationDestination(icon: Icon(Icons.explore), label: 'اكتشف'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'الإعدادات'),
        ],
      ),
    );
  }
}

class PlanetsListScreen extends StatelessWidget {
  const PlanetsListScreen({super.key});

  // مصفوفة البيانات الكاملة (شاملة الشمس والـ 14 معلومة لكل كوكب)
  final List<Map<String, dynamic>> planets = const [
    {
      'name': 'الشمس (The Sun)',
      'image': 'assets/images/sun.png',
      'color': Colors.orangeAccent,
      'gravity': 27.9,
      'year_factor': 1.0,
      'is_star': true,
      'content': [
        {'t': '🔥 نوع النجم', 'b': 'قزم أصفر (G2V)'},
        {'t': '🌡️ درجة الحرارة', 'b': 'السطح: 5,500°C | القلب: 15 مليون°C'},
        {'t': '⚡ الطاقة والإشعاع', 'b': 'تنتج عبر الاندماج النووي المستمر للهيدروجين.'},
        {'t': '🌋 النشاط الشمسي', 'b': 'البقع الشمسية، الانفجارات، والانبعاثات الإكليلية.'},
        {'t': '🌍 تأثيرها على الأرض', 'b': 'مصدر الحياة، الضوء، الحرارة، والتحكم في المناخ.'},
      ]
    },
    {
      'name': 'عطارد (Mercury)',
      'image': 'assets/images/mercury.png',
      'color': Colors.grey,
      'gravity': 0.38,
      'year_factor': 0.24,
      'is_star': false,
      'content': [
        {'t': '📌 نبذة عامة', 'b': 'أصغر كواكب المجموعة وأقربها للشمس.'},
        {'t': '📏 الحجم والقطر', 'b': '4,880 كم'},
        {'t': '⚖️ الكتلة والجاذبية', 'b': '3.3 × 10^23 كجم | 3.7 م/ث²'},
        {'t': '🌡️ درجة الحرارة', 'b': 'تتراوح بين -180 إلى 430 درجة مئوية'},
        {'t': '🌍 الغلاف الجوي', 'b': 'رقيق جداً يتكون من الأكسجين والصوديوم والهيدروجين.'},
        {'t': '🧱 التركيب', 'b': 'كوكب صخري'},
        {'t': '🔄 اليوم', 'b': '59 يوماً أرضياً'},
        {'t': '☀️ السنة', 'b': '88 يوماً أرضياً'},
        {'t': '🌙 عدد الأقمار', 'b': 'لا يوجد'},
        {'t': '💍 الحلقات', 'b': 'لا يوجد'},
        {'t': '📍 الموقع', 'b': 'الأول في النظام الشمسي'},
        {'t': '🔭 الرؤية من الأرض', 'b': 'يمكن رؤيته بالعين المجردة قرب الفجر أو الغروب.'},
        {'t': '🚀 استكشاف الكوكب', 'b': 'مهمات Mariner 10 و Messenger.'},
        {'t': '⚠️ حقائق مدهشة', 'b': 'عطارد ينكمش بمرور الزمن نتيجة برودة قلبه.'},
      ]
    },
    {
      'name': 'الأرض (Earth)',
      'image': 'assets/images/earth.png',
      'color': Colors.blue,
      'gravity': 1.0,
      'year_factor': 1.0,
      'is_star': false,
      'content': [
        {'t': '📌 نبذة عامة', 'b': 'الموطن الوحيد المعروف للحياة في الكون.'},
        {'t': '📏 الحجم والقطر', 'b': '12,756 كم'},
        {'t': '⚖️ الكتلة والجاذبية', 'b': '5.97 × 10^24 كجم | 9.8 م/ث²'},
        {'t': '🌡️ درجة الحرارة', 'b': 'المتوسط 15 درجة مئوية'},
        {'t': '🌍 الغلاف الجوي', 'b': 'نيتروجين (78%) وأكسجين (21%)'},
        {'t': '🧱 التركيب', 'b': 'صخري صلب مع لب معدني'},
        {'t': '🔄 اليوم', 'b': '24 ساعة'},
        {'t': '☀️ السنة', 'b': '365.25 يوم'},
        {'t': '🌙 عدد الأقمار', 'b': 'قمر واحد'},
        {'t': '💍 الحلقات', 'b': 'لا يوجد'},
        {'t': '📍 الموقع', 'b': 'الثالث في النظام الشمسي'},
        {'t': '🔭 الرؤية من الأرض', 'b': 'نحن نعيش عليه!'},
        {'t': '🚀 استكشاف الكوكب', 'b': 'آلاف الأقمار الصناعية ومحطة الفضاء الدولية.'},
        {'t': '⚠️ حقائق مدهشة', 'b': 'الأرض هي المكان الوحيد الذي يوجد فيه الماء في حالاته الثلاث.'},
      ]
    },
    // ملاحظة: يمكنك تكرار الكواكب (الزهرة، المريخ، المشتري، زحل، أورانوس، نبتون) بنفس النمط
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Planet Explorer', style: TextStyle(fontWeight: FontWeight.bold))),
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
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(20),
                    leading: Image.asset(planet['image'], width: 70),
                    title: Text(planet['name'], style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: planet['color'])),
                    subtitle: const Text('اضغط لمعرفة الأسرار والحسابات الفلكية'),
                    trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white24, size: 18),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScreen(planet: planet))),
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text("Developed by Hamza Store", style: TextStyle(color: Colors.white10, fontSize: 10)),
          )
        ],
      ),
    );
  }
}

class DetailScreen extends StatefulWidget {
  final Map<String, dynamic> planet;
  const DetailScreen({super.key, required this.planet});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final TextEditingController _valController = TextEditingController();
  double _weightResult = 0;
  double _ageResult = 0;

  void _calculate(String v) {
    setState(() {
      double input = double.tryParse(v) ?? 0;
      _weightResult = input * widget.planet['gravity'];
      _ageResult = input / widget.planet['year_factor'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isStar = widget.planet['is_star'];
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset(widget.planet['image'], width: 220),
            const SizedBox(height: 20),
            Text(widget.planet['name'], style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: widget.planet['color'])),
            const SizedBox(height: 25),
            
            // --- الحاسبة التفاعلية المدمجة ---
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white12),
              ),
              child: Column(
                children: [
                  const Text("⚖️ مختبر البيانات التفاعلي", style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _valController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    decoration: const InputDecoration(hintText: "أدخل رقمك هنا (وزن أو عمر)", border: InputBorder.none),
                    onChanged: _calculate,
                  ),
                  const Divider(color: Colors.white12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(children: [const Text("وزنك هنا", style: TextStyle(color: Colors.grey)), Text("${_weightResult.toStringAsFixed(1)} kg", style: const TextStyle(fontSize: 18, color: Colors.greenAccent, fontWeight: FontWeight.bold))]),
                      if (!isStar)
                      Column(children: [const Text("عمرك هنا", style: TextStyle(color: Colors.grey)), Text("${_ageResult.toStringAsFixed(1)} سنة", style: const TextStyle(fontSize: 18, color: Colors.cyanAccent, fontWeight: FontWeight.bold))]),
                    ],
                  )
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            // --- عرض الـ 14 معلومة بتصميم البطاقة الجانبية ---
            ...List.generate(widget.planet['content'].length, (index) {
              final item = widget.planet['content'][index];
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.03),
                  borderRadius: BorderRadius.circular(20),
                  border: Border(right: BorderSide(color: widget.planet['color'], width: 5)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['t'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: widget.planet['color'])),
                    const SizedBox(height: 8),
                    Text(item['b'], style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.white70)),
                  ],
                ),
              );
            }),
            const SizedBox(height: 40),
            const Text("Developed by Hamza Store", style: TextStyle(color: Colors.white12)),
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
  bool _notif = true;
  String _lang = "العربية";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الإعدادات')),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            ListTile(
              leading: const Icon(Icons.language, color: Colors.blueAccent),
              title: const Text("اللغة"),
              subtitle: const Text("تغيير لغة واجهة التطبيق"),
              trailing: Text(_lang, style: const TextStyle(color: Colors.amber)),
              onTap: () => setState(() => _lang = (_lang == "العربية" ? "English" : "العربية")),
            ),
            const Divider(),
            SwitchListTile(
              secondary: const Icon(Icons.notifications_active, color: Colors.greenAccent),
              title: const Text("الإشعارات"),
              subtitle: const Text("تنبيهات حول أحداث الفضاء اليومية"),
              value: _notif,
              onChanged: (v) => setState(() => _notif = v),
            ),
            const SizedBox(height: 50),
            const Center(child: Text("Developed by Hamza Store", style: TextStyle(color: Colors.white24))),
            const Center(child: Text("Version 1.5.0", style: TextStyle(fontSize: 10, color: Colors.white10))),
          ],
        ),
      ),
    );
  }
}
