import 'package:flutter/material.dart';

void main() => runApp(const PlanetsApp());

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
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF010206),
      ),
      home: MainNavigation(isArabic: isArabic, onLangToggle: toggleLanguage),
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
    final pages = [
      ExplorerScreen(isArabic: widget.isArabic),
      const Center(child: Text("Soon")),
      SettingsScreen(isArabic: widget.isArabic, onLangToggle: widget.onLangToggle),
    ];

    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.public), 
            label: widget.isArabic ? 'المستكشف' : 'Explorer'
          ),
          NavigationDestination(
            icon: const Icon(Icons.explore), 
            label: widget.isArabic ? 'اكتشف' : 'Discover'
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings), 
            label: widget.isArabic ? 'الإعدادات' : 'Settings'
          ),
        ],
      ),
    );
  }
}
class AppData {
  static List<Map<String, dynamic>> getPlanets(bool isArabic) {
    return [
      {
        'name': isArabic ? 'الشمس' : 'The Sun',
        'image': 'assets/images/sun.png',
        'color': Colors.orange,
        'gravity': 27.9, 'year_f': 1.0, 'is_star': true,
        'info': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'نجم من نوع "القزم الأصفر"، يمثل قلب النظام الشمسي.' : 'A Yellow Dwarf star.'},
          {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 1.39 مليون كم. الحجم: يتسع لـ 1.3 مليون أرض.' : 'Diameter: 1.39M km.'},
          {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الكتلة: 1.989 × 10³⁰ كجم. الجاذبية: 274 م/ث².' : 'Mass: 1.989 x 10³⁰ kg.'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'السطح: 5,500°C. اللب: 15.7 مليون درجة مئوية.' : 'Surface: 5,500°C.'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'فوتوسفير، كروموسفير، ومنطقة الانتقال، والإكليل.' : 'Photosphere, Corona.'},
          {'t': isArabic ? '🧱 التركيب البنيوي' : '🧱 Structure', 'b': isArabic ? 'تتكون من الهيدروجين (73%) والهيليوم (25%).' : 'H (73%) and He (25%).'},
          {'t': isArabic ? '🔄 الدوران' : '🔄 Rotation', 'b': isArabic ? '25 يوماً عند خط الاستواء.' : '25 days.'},
          {'t': isArabic ? '☀️ المدار' : '☀️ Orbit', 'b': isArabic ? 'تدور حول مركز مجرة درب التبانة.' : 'Orbits Galactic Center.'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? 'لا تملك أقماراً.' : 'No moons.'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'لا تمتلك أي حلقات.' : 'No rings.'},
          {'t': isArabic ? '📍 الموقع' : '📍 Position', 'b': isArabic ? 'تقع في مركز النظام الشمسي.' : 'Center of the system.'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 View', 'b': isArabic ? 'تبدو ككرة بيضاء ساطعة.' : 'Bright white sphere.'},
          {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Exploration', 'b': isArabic ? 'مسبار باركر، SOHO.' : 'Parker Solar Probe.'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'تشكل 99.86% من كتلة النظام.' : '99.86% of system mass.'},
        ]
      },
      {
        'name': isArabic ? 'عطارد' : 'Mercury',
        'image': 'assets/images/mercury.png',
        'color': Colors.grey,
        'gravity': 0.38, 'year_f': 0.24, 'is_star': false,
        'info': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'أصغر الكواكب وأقربها للشمس.' : 'Smallest and closest planet.'},
          {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 4,880 كم.' : 'Diameter: 4,880 km.'},
          {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الجاذبية: 3.7 م/ث².' : 'Gravity: 3.7 m/s².'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'نهاراً: 430°C، ليلاً: -180°C.' : '430°C to -180°C.'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'رقيق جداً (إكسوسفير).' : 'Thin exosphere.'},
          {'t': isArabic ? '🧱 التركيب البنيوي' : '🧱 Structure', 'b': isArabic ? 'لب حديدي ضخم وقشرة صخرية.' : 'Iron core, rocky crust.'},
          {'t': isArabic ? '🔄 الدوران' : '🔄 Rotation', 'b': isArabic ? '59 يوماً أرضياً.' : '59 Earth days.'},
          {'t': isArabic ? '☀️ المدار' : '☀️ Orbit', 'b': isArabic ? '88 يوماً أرضياً.' : '88 Earth days.'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? 'لا يوجد.' : 'No moons.'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'لا يوجد.' : 'No rings.'},
          {'t': isArabic ? '📍 الموقع' : '📍 Position', 'b': isArabic ? 'الكوكب الأول.' : '1st planet.'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 View', 'b': isArabic ? 'يشبه قمر الأرض.' : 'Looks like the Moon.'},
          {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Exploration', 'b': isArabic ? 'مسبار ماسينجر.' : 'MESSENGER.'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'يتقلص حجمه ببطء.' : 'Shrinking slowly.'},
        ]
      },
      {
        'name': isArabic ? 'الزهرة' : 'Venus',
        'image': 'assets/images/venus.png',
        'color': Colors.amber,
        'gravity': 0.9, 'year_f': 0.61, 'is_star': false,
        'info': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'أحر كوكب بسبب الاحتباس الحراري.' : 'Hottest planet.'},
          {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 12,104 كم.' : 'Diameter: 12,104 km.'},
          {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الجاذبية: 8.87 م/ث².' : 'Gravity: 8.87 m/s².'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'تصل إلى 464°C.' : 'Constant 464°C.'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'كثيف من ثاني أكسيد الكربون.' : 'Thick CO2.'},
          {'t': isArabic ? '🧱 التركيب البنيوي' : '🧱 Structure', 'b': isArabic ? 'وشاح صخري ولب معدني.' : 'Rocky mantle.'},
          {'t': isArabic ? '🔄 الدوران' : '🔄 Rotation', 'b': isArabic ? '243 يوماً (دوران عكسي).' : '243 days (retrograde).'},
          {'t': isArabic ? '☀️ المدار' : '☀️ Orbit', 'b': isArabic ? '225 يوماً أرضياً.' : '225 Earth days.'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? 'لا يوجد.' : 'No moons.'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'لا يوجد.' : 'No rings.'},
          {'t': isArabic ? '📍 الموقع' : '📍 Position', 'b': isArabic ? 'الكوكب الثاني.' : '2nd planet.'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 View', 'b': isArabic ? 'ألمع جسم بعد الشمس والقمر.' : 'Brightest planet.'},
          {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Exploration', 'b': isArabic ? 'مهمات فينيرا.' : 'Venera missions.'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'يومه أطول من سنته.' : 'Day longer than year.'},
        ]
      },
      {
        'name': isArabic ? 'الأرض' : 'Earth',
        'image': 'assets/images/earth.png',
        'color': Colors.blue,
        'gravity': 1.0, 'year_f': 1.0, 'is_star': false,
        'info': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'موطن الحياة الوحيد المعروف.' : 'Only planet with life.'},
          {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 12,756 كم.' : 'Diameter: 12,756 km.'},
          {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الجاذبية: 9.8 م/ث².' : 'Gravity: 9.8 m/s².'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'المتوسط 15°C.' : 'Average 15°C.'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? '78% نيتروجين، 21% أكسجين.' : '78% N2, 21% O2.'},
          {'t': isArabic ? '🧱 التركيب البنيوي' : '🧱 Structure', 'b': isArabic ? 'قشرة، وشاح، ولب.' : 'Crust, mantle, core.'},
          {'t': isArabic ? '🔄 الدوران' : '🔄 Rotation', 'b': isArabic ? '23 ساعة و56 دقيقة.' : '23h 56m.'},
          {'t': isArabic ? '☀️ المدار' : '☀️ Orbit', 'b': isArabic ? '365.25 يوم.' : '365.25 days.'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? 'قمر واحد.' : 'One moon.'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'لا يوجد.' : 'No rings.'},
          {'t': isArabic ? '📍 الموقع' : '📍 Position', 'b': isArabic ? 'الكوكب الثالث.' : '3rd planet.'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 View', 'b': isArabic ? 'الرخام الأزرق.' : 'The Blue Marble.'},
          {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Exploration', 'b': isArabic ? 'مأهولة بالكامل.' : 'Fully explored.'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? '71% ماء.' : '71% water.'},
        ]
      },
    ];
  }
}
      {
        'name': isArabic ? 'المريخ' : 'Mars',
        'image': 'assets/images/mars.png',
        'color': Colors.red,
        'gravity': 0.38, 'year_f': 1.88, 'is_star': false,
        'info': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'يُعرف بالكوكب الأحمر لوجود أكسيد الحديد.' : 'The Red Planet.'},
          {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 6,779 كم.' : 'Diameter: 6,779 km.'},
          {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الجاذبية: 3.71 م/ث².' : 'Gravity: 3.71 m/s².'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'المتوسط -62°C.' : 'Average -62°C.'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? '95% ثاني أكسيد الكربون.' : '95% CO2.'},
          {'t': isArabic ? '🧱 التركيب البنيوي' : '🧱 Structure', 'b': isArabic ? 'صخري مع لب من الحديد والنيكل.' : 'Iron-nickel core.'},
          {'t': isArabic ? '🔄 الدوران' : '🔄 Rotation', 'b': isArabic ? '24 ساعة و37 دقيقة.' : '24h 37m.'},
          {'t': isArabic ? '☀️ المدار' : '☀️ Orbit', 'b': isArabic ? '687 يوماً أرضياً.' : '687 Earth days.'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? 'فوبوس وديموس.' : 'Phobos and Deimos.'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'لا يوجد.' : 'No rings.'},
          {'t': isArabic ? '📍 الموقع' : '📍 Position', 'b': isArabic ? 'الكوكب الرابع.' : '4th planet.'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 View', 'b': isArabic ? 'يظهر كنقطة حمراء ساطعة.' : 'Bright red point.'},
          {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Exploration', 'b': isArabic ? 'مسبار الأمل، بيرسيفيرانس.' : 'Hope Probe, Perseverance.'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'يضم أعلى بركان (أوليمبوس مونس).' : 'Tallest volcano.'},
        ]
      },
      {
        'name': isArabic ? 'المشتري' : 'Jupiter',
        'image': 'assets/images/jupiter.png',
        'color': Colors.brown,
        'gravity': 2.52, 'year_f': 11.86, 'is_star': false,
        'info': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'أكبر كواكب النظام الشمسي.' : 'The largest planet.'},
          {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 139,820 كم.' : 'Diameter: 139,820 km.'},
          {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الجاذبية: 24.79 م/ث².' : 'Gravity: 24.79 m/s².'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'المتوسط -108°C.' : 'Average -108°C.'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'هيدروجين وهيليوم.' : 'H and He.'},
          {'t': isArabic ? '🧱 التركيب البنيوي' : '🧱 Structure', 'b': isArabic ? 'عملاق غازي بلا سطح صلب.' : 'Gas giant.'},
          {'t': isArabic ? '🔄 الدوران' : '🔄 Rotation', 'b': isArabic ? 'أقل من 10 ساعات.' : 'Less than 10 hours.'},
          {'t': isArabic ? '☀️ المدار' : '☀️ Orbit', 'b': isArabic ? '11.8 سنة أرضية.' : '11.8 Earth years.'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? '95 قمراً معروفاً.' : '95 moons.'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'نظام حلقات باهت.' : 'Faint rings.'},
          {'t': isArabic ? '📍 الموقع' : '📍 Position', 'b': isArabic ? 'الكوكب الخامس.' : '5th planet.'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 View', 'b': isArabic ? 'مخطط مع بقعة حمراء كبرى.' : 'Great Red Spot.'},
          {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Exploration', 'b': isArabic ? 'مسبار جونو.' : 'Juno.'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'يحمي الأرض من الكويكبات.' : 'Protects Earth.'},
        ]
      },
      {
        'name': isArabic ? 'زحل' : 'Saturn',
        'image': 'assets/images/saturn.png',
        'color': Colors.orangeAccent,
        'gravity': 1.06, 'year_f': 29.45, 'is_star': false,
        'info': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'مشهور بحلقاته الجليدية الرائعة.' : 'Famous for its rings.'},
          {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 116,460 كم.' : 'Diameter: 116,460 km.'},
          {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الجاذبية: 10.44 م/ث².' : 'Gravity: 10.44 m/s².'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'المتوسط -138°C.' : 'Average -138°C.'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'معظمه هيدروجين وهيليوم.' : 'Hydrogen and Helium.'},
          {'t': isArabic ? '🧱 التركيب البنيوي' : '🧱 Structure', 'b': isArabic ? 'أقل كثافة من الماء.' : 'Less dense than water.'},
          {'t': isArabic ? '🔄 الدوران' : '🔄 Rotation', 'b': isArabic ? '10 ساعات و33 دقيقة.' : '10h 33m.'},
          {'t': isArabic ? '☀️ المدار' : '☀️ Orbit', 'b': isArabic ? '29.4 سنة أرضية.' : '29.4 Earth years.'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? '146 قمراً.' : '146 moons.'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? '7 حلقات عريضة ورئيسية.' : '7 main rings.'},
          {'t': isArabic ? '📍 الموقع' : '📍 Position', 'b': isArabic ? 'الكوكب السادس.' : '6th planet.'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 View', 'b': isArabic ? 'يظهر بلون ذهبي.' : 'Golden color.'},
          {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Exploration', 'b': isArabic ? 'كاسيني وهويجنز.' : 'Cassini-Huygens.'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'حلقاته مكونة من جليد وغبار.' : 'Rings of ice/dust.'},
        ]
      },
      {
        'name': isArabic ? 'أورانوس' : 'Uranus',
        'image': 'assets/images/uranus.png',
        'color': Colors.cyan,
        'gravity': 0.88, 'year_f': 84.01, 'is_star': false,
        'info': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'العملاق الجليدي الذي يدور على جانبه.' : 'Sideways ice giant.'},
          {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 50,724 كم.' : 'Diameter: 50,724 km.'},
          {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الجاذبية: 8.69 م/ث².' : 'Gravity: 8.69 m/s².'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'أبرد كوكب (-224°C).' : 'Coldest (-224°C).'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'يحتوي على الميثان (سبب لونه).' : 'Methane gas.'},
          {'t': isArabic ? '🧱 التركيب البنيوي' : '🧱 Structure', 'b': isArabic ? 'لب صخري وسوائل جليدية.' : 'Ice and rock.'},
          {'t': isArabic ? '🔄 الدوران' : '🔄 Rotation', 'b': isArabic ? 'يدور بوضعية مائلة جداً.' : 'Tilted rotation.'},
          {'t': isArabic ? '☀️ المدار' : '☀️ Orbit', 'b': isArabic ? '84 سنة أرضية.' : '84 Earth years.'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? '27 قمراً.' : '27 moons.'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? '13 حلقة رقيقة.' : '13 faint rings.'},
          {'t': isArabic ? '📍 الموقع' : '📍 Position', 'b': isArabic ? 'الكوكب السابع.' : '7th planet.'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 View', 'b': isArabic ? 'كرة زرقاء مخضرة.' : 'Cyan sphere.'},
          {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Exploration', 'b': isArabic ? 'فوييجر 2.' : 'Voyager 2.'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'الصيف فيه يستمر 21 عاماً.' : '21-year summer.'},
        ]
      },
      {
        'name': isArabic ? 'نبتون' : 'Neptune',
        'image': 'assets/images/neptune.png',
        'color': Colors.blueAccent,
        'gravity': 1.14, 'year_f': 164.8, 'is_star': false,
        'info': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'أبعد كوكب عن الشمس وعالم عاصف.' : 'Distant and windy.'},
          {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 49,244 كم.' : 'Diameter: 49,244 km.'},
          {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الجاذبية: 11.15 م/ث².' : 'Gravity: 11.15 m/s².'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'المتوسط -201°C.' : 'Average -201°C.'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'رياح هي الأسرع في النظام.' : 'Fastest winds.'},
          {'t': isArabic ? '🧱 التركيب البنيوي' : '🧱 Structure', 'b': isArabic ? 'سوائل جليدية فوق لب صلب.' : 'Ice fluids.'},
          {'t': isArabic ? '🔄 الدوران' : '🔄 Rotation', 'b': isArabic ? '16 ساعة أرضية.' : '16 Earth hours.'},
          {'t': isArabic ? '☀️ المدار' : '☀️ Orbit', 'b': isArabic ? '165 سنة أرضية.' : '165 Earth years.'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? '14 قمراً.' : '14 moons.'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': iSArabic ? '5 حلقات داكنة.' : '5 dark rings.'},
          {'t': isArabic ? '📍 الموقع' : '📍 Position', 'b': isArabic ? 'الكوكب الثامن.' : '8th planet.'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 View', 'b': isArabic ? 'كرة زرقاء داكنة.' : 'Deep blue sphere.'},
          {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Exploration', 'b': isArabic ? 'فوييجر 2.' : 'Voyager 2.'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'أول كوكب اكتشف بالحسابات.' : 'Found via math.'},
        ]
      },
    ];
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
  double wRes = 0, aRes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.p['name']), backgroundColor: Colors.transparent, elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Hero(tag: widget.p['name'], child: Image.asset(widget.p['image'], width: 220)),
            const SizedBox(height: 10),
            Text(widget.p['name'], style: const TextStyle(fontSize: 42, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            
            // حقول الحسابات
            _buildBox(
              widget.isArabic ? "وزنك هنا (kg)" : "Weight here (kg)",
              widget.isArabic ? "وزنك في هذا الكوكب" : "Weight on this planet",
              (v) => setState(() => wRes = (double.tryParse(v) ?? 0) * widget.p['gravity']),
              wRes, "kg"
            ),
            const SizedBox(height: 15),
            if (!widget.p['is_star'])
              _buildBox(
                widget.isArabic ? "عمرك هنا (سنة)" : "Age here (year)",
                widget.isArabic ? "عمرك في هذا الكوكب" : "Age on this planet",
                (v) => setState(() => aRes = (double.tryParse(v) ?? 0) / widget.p['year_f']),
                aRes, widget.isArabic ? "سنة" : "Yrs"
              ),
            
            const SizedBox(height: 40),
            
            // بطاقات المعلومات (التصميم القديم)
            ...(widget.p['info'] as List).map((info) => Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF111111),
                borderRadius: BorderRadius.circular(15),
                border: Border(
                  left: widget.isArabic ? BorderSide.none : BorderSide(color: widget.p['color'], width: 4),
                  right: widget.isArabic ? BorderSide(color: widget.p['color'], width: 4) : BorderSide.none,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(info['t'], style: TextStyle(color: widget.p['color'], fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(info['b'], style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.white70)),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildBox(String lab, String resLab, Function(String) onC, double res, String u) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFF111111), borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Text(lab, style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
          TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            onChanged: onC,
            decoration: const InputDecoration(hintText: "0.0", border: InputBorder.none),
          ),
          if (res > 0) ...[
            const Divider(color: Colors.white10),
            Text(resLab, style: const TextStyle(color: Colors.white38, fontSize: 12)),
            Text("${res.toStringAsFixed(1)} $u", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.amber)),
          ]
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
      appBar: AppBar(title: Text(isArabic ? "الإعدادات" : "Settings")),
      body: ListTile(
        leading: const Icon(Icons.language, color: Colors.amber),
        title: Text(isArabic ? "اللغة" : "Language"),
        trailing: Text(isArabic ? "العربية" : "English"),
        onTap: onLangToggle,
      ),
    );
  }
}
