import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(const PlanetsApp());

class PlanetsApp extends StatefulWidget {
  const PlanetsApp({super.key});
  @override
  State<PlanetsApp> createState() => _PlanetsAppState();
}

class _PlanetsAppState extends State<PlanetsApp> {
  bool isArabic = true;
  void toggleLanguage() => setState(() => isArabic = !isArabic);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, scaffoldBackgroundColor: const Color(0xFF010206)),
      home: SplashScreen(isArabic: isArabic, onLangToggle: toggleLanguage),
    );
  }
}

// --- شاشة الترحيب ---
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
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MainNavigation(isArabic: widget.isArabic, onLangToggle: widget.onLangToggle)));
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
            Text(widget.isArabic ? "مستكشف الكواكب" : "PLANET EXPLORER", style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const Text("Hamza Store", style: TextStyle(color: Colors.white24, letterSpacing: 2)),
          ],
        ),
      ),
    );
  }
}

class MainNavigation extends StatefulWidget {
  final bool isArabic;
  final VoidCallback onLangToggle;
  const MainNavigation({super.key, required this.isArabic, required this.onLangToggle});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    final pages = [ExplorerScreen(isArabic: widget.isArabic), const Center(child: Text("Soon")), SettingsScreen(isArabic: widget.isArabic, onLangToggle: widget.onLangToggle)];
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: [
          NavigationDestination(icon: const Icon(Icons.public), label: widget.isArabic ? 'المستكشف' : 'Explorer'),
          NavigationDestination(icon: const Icon(Icons.explore), label: widget.isArabic ? 'اكتشف' : 'Discover'),
          NavigationDestination(icon: const Icon(Icons.settings), label: widget.isArabic ? 'الإعدادات' : 'Settings'),
        ],
      ),
    );
  }
}

class ExplorerScreen extends StatelessWidget {
  final bool isArabic;
  const ExplorerScreen({super.key, required this.isArabic});

  List<Map<String, dynamic>> getData() {
    return [
      {
        'name': isArabic ? 'الشمس' : 'The Sun',
        'color': Colors.orange,
        'gravity': 27.9, 'year_f': 1.0, 'is_star': true,
        'info': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'نجم من نوع "القزم الأصفر"، قلب النظام الشمسي. تمثل 99.8% من كتلة النظام.' : 'Yellow Dwarf star, heart of the solar system.'},
          {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر 1.39 مليون كم (109 مرات الأرض). تتسع لـ 1.3 مليون أرض.' : '1.39M km diameter.'},
          {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الكتلة 333,000 ضعف الأرض. الجاذبية 274 م/ث² (28 ضعف الأرض).' : '274 m/s² gravity.'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'السطح: 5,500°C. اللب: 15 مليون درجة مئوية.' : 'Core: 15M °C.'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'يتكون من الفوتوسفير، والكروموسفير، والإكليل.' : 'Photosphere, Chromosphere, Corona.'},
          {'t': isArabic ? '🧱 التركيب' : '🧱 Composition', 'b': isArabic ? 'بلازما: 73% هيدروجين، 25% هيليوم.' : '73% H, 25% He.'},
          {'t': isArabic ? '🔄 الدوران الذاتي' : '🔄 Rotation', 'b': isArabic ? '25 يوماً (استواء) إلى 35 يوماً (قطبين).' : '25-35 days.'},
          {'t': isArabic ? '☀️ الدوران المجري' : '☀️ Galactic Orbit', 'b': isArabic ? 'تستغرق الدورة حوالي 230 مليون سنة.' : '230 million years.'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? 'لا تمتلك أقماراً.' : 'None.'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'لا يوجد.' : 'None.'},
          {'t': isArabic ? '📍 الموقع' : '📍 Location', 'b': isArabic ? 'في مركز النظام الشمسي تماماً.' : 'Center of System.'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 Visibility', 'b': isArabic ? 'قرص ساطع جداً (تحتاج فلاتر خاصة للرؤية).' : 'Extremely bright.'},
          {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Missions', 'b': isArabic ? 'SOHO وباركر (Parker Solar Probe).' : 'SOHO, Parker Probe.'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'تولد طاقتها بالاندماج النووي؛ ستصبح عملاقاً أحمر.' : 'Nuclear fusion engine.'},
        ]
      },
      {
        'name': isArabic ? 'عطارد' : 'Mercury',
        'color': Colors.grey,
        'gravity': 0.38, 'year_f': 0.24, 'is_star': false,
        'info': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'أصغر الكواكب وأقربها للشمس، عالم صخري مليء بالفوهات.' : 'Smallest and closest planet.'},
          {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 4,880 كم. الحجم: 5% من الأرض.' : '4,880 km diameter.'},
          {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الكتلة: 5.5% من الأرض. الجاذبية: 3.7 م/ث².' : '3.7 m/s².'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'نهاراً: 430°C. ليلاً: -180°C.' : '430°C to -180°C.'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'رقيق جداً (Exosphere).' : 'Very thin exosphere.'},
          {'t': isArabic ? '🧱 التركيب' : '🧱 Structure', 'b': isArabic ? 'كوكب صخري، لب حديدي ضخم (85% من القطر).' : 'Huge iron core.'},
          {'t': isArabic ? '🔄 اليوم' : '🔄 Day', 'b': isArabic ? '59 يوماً أرضياً.' : '59 Earth days.'},
          {'t': isArabic ? '☀️ السنة' : '☀️ Year', 'b': isArabic ? '88 يوماً أرضياً.' : '88 Earth days.'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? 'لا يوجد.' : 'None.'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'لا يوجد.' : 'None.'},
          {'t': isArabic ? '📍 الموقع' : '📍 Location', 'b': isArabic ? 'الكوكب الأول من حيث القرب.' : '1st planet.'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 Visibility', 'b': isArabic ? 'يظهر كـ "نجم" لامع قرب الأفق.' : 'Visible near horizon.'},
          {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Missions', 'b': isArabic ? 'مارينر 10، ماسينجر، ببي كولومبو.' : 'Mariner 10, Messenger.'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'ينكمش تدريجياً؛ يوجد جليد في أقطابه.' : 'Cooling and shrinking.'},
        ]
      },
      {
        'name': isArabic ? 'الزهرة' : 'Venus',
        'color': Colors.orangeAccent,
        'gravity': 0.9, 'year_f': 0.61, 'is_star': false,
        'info': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'توأم الأرض، أحر كوكب في النظام الشمسي.' : 'Earth\'s twin, hottest planet.'},
          {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 12,104 كم. الحجم: 86% من الأرض.' : '12,104 km diameter.'},
          {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الكتلة: 81% من الأرض. الجاذبية: 8.87 م/ث².' : '8.87 m/s².'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'المتوسط: 464°C (أحر كوكب).' : '464°C average.'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'كثيف جداً (96% CO2) مع سحب حمضية.' : 'Thick CO2 clouds.'},
          {'t': isArabic ? '🧱 التركيب' : '🧱 Type', 'b': isArabic ? 'كوكب صخري، سطحه مليء بالبراكين.' : 'Terrestrial, volcanic.'},
          {'t': isArabic ? '🔄 اليوم' : '🔄 Day', 'b': isArabic ? '243 يوماً (يدور عكس الاتجاه).' : '243 days (Retrograde).'},
          {'t': isArabic ? '☀️ السنة' : '☀️ Year', 'b': isArabic ? '225 يوماً أرضياً.' : '225 Earth days.'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? 'لا يوجد.' : 'None.'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'لا يوجد.' : 'None.'},
          {'t': isArabic ? '📍 الموقع' : '📍 Location', 'b': isArabic ? 'الكوكب الثاني.' : '2nd planet.'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 Visibility', 'b': isArabic ? 'ألمع جرم بعد الشمس والقمر.' : 'Morning/Evening star.'},
          {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Missions', 'b': isArabic ? 'فينيرا السوفيتية، وماجلان.' : 'Venera, Magellan.'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'يومه أطول من سنته؛ احتباس حراري جامح.' : 'Day longer than year.'},
        ]
      },
      {
        'name': isArabic ? 'الأرض' : 'Earth',
        'color': Colors.blue,
        'gravity': 1.0, 'year_f': 1.0, 'is_star': false,
        'info': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'الركن الوحيد المعروف للحياة، وفرة المياه.' : 'Our home, supports life.'},
          {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': '12,742 كم'},
          {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': '9.8 م/ث²'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': '15°C متوسط'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': '78% نيتروجين، 21% أكسجين'},
          {'t': isArabic ? '🧱 التركيب' : '🧱 Structure', 'b': isArabic ? 'قشرة، وشاح، لب خارجي وداخلي.' : 'Crust, Mantle, Core.'},
          {'t': isArabic ? '🔄 اليوم' : '🔄 Day', 'b': '24 ساعة'},
          {'t': isArabic ? '☀️ السنة' : '☀️ Year', 'b': '365.25 يوم'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': 'قمر واحد'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': 'لا يوجد'},
          {'t': isArabic ? '📍 الموقع' : '📍 Location', 'b': isArabic ? 'الثالث (النطاق الصالح للحياة).' : '3rd planet.'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 Visibility', 'b': isArabic ? 'نعيش عليها.' : 'We are here.'},
          {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Missions', 'b': isArabic ? 'آلاف الأقمار الصناعية.' : 'Satellites.'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'يغطي الماء 71%؛ تمتلك درعاً مغناطيسياً.' : '71% water coverage.'},
        ]
      },
      {
        'name': isArabic ? 'المريخ' : 'Mars',
        'color': Colors.red,
        'gravity': 0.38, 'year_f': 1.88, 'is_star': false,
        'info': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'الكوكب الأحمر بسبب صدأ الحديد.' : 'The Red Planet.'},
          {'t': isArabic ? '📏 القطر' : '📏 Size', 'b': '6,779 كم (نصف الأرض)'},
          {'t': isArabic ? '⚖️ الجاذبية' : '⚖️ Gravity', 'b': '3.7 م/ث²'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': '-60°C متوسط'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': '95% CO2 (رقيق جداً)'},
          {'t': isArabic ? '🧱 التركيب' : '🧱 Type', 'b': isArabic ? 'صخري، يضم أعلى جبال في النظام.' : 'Terrestrial.'},
          {'t': isArabic ? '🔄 اليوم' : '🔄 Day', 'b': '24 ساعة و37 دقيقة'},
          {'t': isArabic ? '☀️ السنة' : '☀️ Year', 'b': '687 يوم أرضي'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': 'فوبوس و ديموس'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': 'لا يوجد'},
          {'t': isArabic ? '📍 الموقع' : '📍 Location', 'b': 'الرابع'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 Visibility', 'b': isArabic ? 'نقطة برتقالية محمرة.' : 'Orange-red dot.'},
          {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Missions', 'b': 'Perseverance, Curiosity.'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'بركان أوليمبوس 3 أضعاف إيفرست؛ غروب أزرق.' : 'Olympus Mons, Blue sunset.'},
        ]
      },
      {
        'name': isArabic ? 'المشتري' : 'Jupiter',
        'color': Colors.brown,
        'gravity': 2.53, 'year_f': 11.86, 'is_star': false,
        'info': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'عملاق غازي ضخم، سيد الكواكب.' : 'Giant gas giant.'},
          {'t': isArabic ? '📏 الحجم' : '📏 Size', 'b': isArabic ? 'يتسع لـ 1,300 أرض.' : '1,300 Earths volume.'},
          {'t': isArabic ? '⚖️ الكتلة' : '⚖️ Mass', 'b': isArabic ? '318 ضعف الأرض.' : '318x Earth mass.'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': '-110°C (سحب)'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': '90% هيدروجين، 10% هيليوم'},
          {'t': isArabic ? '🧱 التركيب' : '🧱 Type', 'b': isArabic ? 'عملاق غازي بلا سطح صلب.' : 'Gas Giant.'},
          {'t': isArabic ? '🔄 اليوم' : '🔄 Day', 'b': isArabic ? 'أقل من 10 ساعات.' : 'Under 10 hours.'},
          {'t': isArabic ? '☀️ السنة' : '☀️ Year', 'b': '12 سنة أرضية'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': '95 قمراً (أقمار غاليليو)'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': 'باهتة جداً'},
          {'t': isArabic ? '📍 الموقع' : '📍 Location', 'b': 'الخامس'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 Visibility', 'b': isArabic ? 'نجمة بيضاء ساطعة.' : 'Bright white star.'},
          {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Missions', 'b': 'Voyager, Juno.'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'البقعة الحمراء: إعصار منذ 300 عام؛ "النجم الفاشل".' : 'Great Red Spot.'},
        ]
      },
      {
        'name': isArabic ? 'زحل' : 'Saturn',
        'color': Colors.yellow,
        'gravity': 1.06, 'year_f': 29.45, 'is_star': false,
        'info': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'جوهرة النظام، عملاق غازي بحلقات.' : 'Jewel of solar system.'},
          {'t': isArabic ? '📏 الحجم' : '📏 Size', 'b': '764 أرض'},
          {'t': isArabic ? '⚖️ الكتلة' : '⚖️ Mass', 'b': '95 ضعف الأرض'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': '-138°C متوسط'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': 'هيدروجين وهيليوم'},
          {'t': isArabic ? '🧱 التركيب' : '🧱 Type', 'b': isArabic ? 'عملاق غازي.' : 'Gas Giant.'},
          {'t': isArabic ? '🔄 اليوم' : '🔄 Day', 'b': '10.7 ساعة'},
          {'t': isArabic ? '☀️ السنة' : '☀️ Year', 'b': '29.5 سنة أرضية'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': '146 قمراً (تيتان)'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'أضخم وأجمل نظام حلقات.' : 'Stunning rings.'},
          {'t': isArabic ? '📍 الموقع' : '📍 Location', 'b': 'السادس'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 Visibility', 'b': 'نقطة ذهبية'},
          {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Missions', 'b': 'Cassini-Huygens.'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'أقل كثافة من الماء (يطفو)؛ إعصار سداسي.' : 'Less dense than water.'},
        ]
      },
      {
        'name': isArabic ? 'أورانوس' : 'Uranus',
        'color': Colors.cyan,
        'gravity': 0.9, 'year_f': 84.0, 'is_star': false,
        'info': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'العملاق الجليدي الأزرق.' : 'Ice giant.'},
          {'t': isArabic ? '📏 الحجم' : '📏 Size', 'b': '63 أرض'},
          {'t': isArabic ? '⚖️ الكتلة' : '⚖️ Mass', 'b': '14.5 ضعف الأرض'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? '-201°C (أبرد كوكب).' : 'Coldest planet.'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'هيدروجين، هيليوم، ميثان.' : 'H, He, Methane.'},
          {'t': isArabic ? '🧱 التركيب' : '🧱 Type', 'b': isArabic ? 'عملاق جليدي (سوائل ساخنة).' : 'Ice Giant.'},
          {'t': isArabic ? '🔄 اليوم' : '🔄 Day', 'b': '17.2 ساعة'},
          {'t': isArabic ? '☀️ السنة' : '☀️ Year', 'b': '84 سنة أرضية'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': '27 قمراً'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': '13 حلقة داكنة'},
          {'t': isArabic ? '📍 الموقع' : '📍 Location', 'b': 'السابع'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 Visibility', 'b': 'أضعف نقطة ضوء'},
          {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Missions', 'b': 'Voyager 2.'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'يدور على جنبه؛ أمطار ألماس.' : 'Side rotation, Diamond rain.'},
        ]
      },
      {
        'name': isArabic ? 'نبتون' : 'Neptune',
        'color': Colors.indigo,
        'gravity': 1.14, 'year_f': 164.8, 'is_star': false,
        'info': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'أبعد الكواكب، رياح عاتية.' : 'Distant blue giant.'},
          {'t': isArabic ? '📏 الحجم' : '📏 Size', 'b': '57 أرض'},
          {'t': isArabic ? '⚖️ الكتلة' : '⚖️ Mass', 'b': '17 ضعف الأرض'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': '-214°C'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': 'رياح هي الأسرع (2,100 كم/س)'},
          {'t': isArabic ? '🧱 التركيب' : '🧱 Type', 'b': 'عملاق جليدي'},
          {'t': isArabic ? '🔄 اليوم' : '🔄 Day', 'b': '16 ساعة'},
          {'t': isArabic ? '☀️ السنة' : '☀️ Year', 'b': '165 سنة أرضية'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': '14 قمراً (تريتون)'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': '5 حلقات باهتة'},
          {'t': isArabic ? '📍 الموقع' : '📍 Location', 'b': 'الثامن والأخير'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 Visibility', 'b': 'تلسكوبات قوية فقط'},
          {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Missions', 'b': 'Voyager 2.'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'اكتشف بالحسابات الرياضية.' : 'Math discovery.'},
        ]
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final planets = getData();
    return Scaffold(
      appBar: AppBar(title: Text(isArabic ? 'المستكشف' : 'Explorer'), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: planets.length,
        itemBuilder: (ctx, i) => Container(
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white.withOpacity(0.05)),
          child: ListTile(
            contentPadding: const EdgeInsets.all(15),
            title: Text(planets[i]['name'], style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: planets[i]['color'])),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => DetailsScreen(p: planets[i], isArabic: isArabic))),
          ),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatefulWidget {
  final Map<String, dynamic> p;
  final bool isArabic;
  const DetailsScreen({super.key, required this.p, required this.isArabic});
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  double w = 0, a = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.p['name'])),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(widget.p['name'], style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: widget.p['color'])),
            const SizedBox(height: 20),
            _calcBox(widget.isArabic ? "الوزن (kg)" : "Weight (kg)", (v) => setState(() => w = (double.tryParse(v) ?? 0) * widget.p['gravity']), w, "kg"),
            const SizedBox(height: 10),
            if (!widget.p['is_star']) _calcBox(widget.isArabic ? "العمر (سنة)" : "Age (Years)", (v) => setState(() => a = (double.tryParse(v) ?? 0) / widget.p['year_f']), a, widget.isArabic ? "سنة" : "Yrs"),
            const SizedBox(height: 30),
            ...(widget.p['info'] as List).map((item) => Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.03), borderRadius: BorderRadius.circular(15), border: Border(right: BorderSide(color: widget.p['color'], width: 3))),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(item['t'], style: TextStyle(color: widget.p['color'], fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(item['b'], style: const TextStyle(fontSize: 15)),
              ]),
            )),
          ],
        ),
      ),
    );
  }
  Widget _calcBox(String t, Function(String) onC, double r, String u) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(color: Colors.white12), borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Text(t),
        TextField(keyboardType: TextInputType.number, textAlign: TextAlign.center, onChanged: onC),
        if (r > 0) Text("${r.toStringAsFixed(1)} $u", style: const TextStyle(fontSize: 18, color: Colors.amber)),
      ]),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  final bool isArabic;
  final VoidCallback onLangToggle;
  const SettingsScreen({super.key, required this.isArabic, required this.onLangToggle});
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notif = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.isArabic ? "الإعدادات" : "Settings")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListTile(leading: const Icon(Icons.language), title: Text(widget.isArabic ? "اللغة" : "Language"), trailing: Text(widget.isArabic ? "العربية" : "English"), onTap: widget.onLangToggle),
          SwitchListTile(secondary: const Icon(Icons.notifications), title: Text(widget.isArabic ? "الإشعارات" : "Notifications"), value: notif, onChanged: (v) => setState(() => notif = v)),
          const Divider(),
          const Center(child: Text("Hamza Store - Version 1.8.0", style: TextStyle(color: Colors.white10))),
        ],
      ),
    );
  }
}
