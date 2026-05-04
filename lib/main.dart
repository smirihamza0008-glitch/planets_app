import 'package:flutter/material.dart';

void main() => runApp(const PlanetsApp());

class PlanetsApp extends StatefulWidget {
  const PlanetsApp({super.key});
  @override
  State<PlanetsApp> createState() => _PlanetsAppState();
}

class _PlanetsAppState extends State<PlanetsApp> {
  bool isArabic = true; 

  // دالة تغيير اللغة التي أصلحتها لتحدث التطبيق بالكامل
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
    // قائمة الصفحات
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
// تابع لفئة ExplorerScreen
List<Map<String, dynamic>> getPlanetsData(bool isArabic) {
  return [
    {
      'name': isArabic ? 'الشمس' : 'The Sun',
      'image': 'assets/images/sun.png',
      'color': Colors.orange,
      'gravity': 27.9, 'year_f': 1.0, 'is_star': true,
      'info': [
        {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'نجم من نوع "القزم الأصفر"، يمثل قلب النظام الشمسي و99.8% من كتلته.' : 'A Yellow Dwarf star, heart of the solar system.'},
        {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 1,392,700 كم. الحجم: يتسع لـ 1.3 مليون أرض.' : 'Diameter: 1.39M km. Volume: 1.3M Earths.'},
        {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الكتلة: 1.989 × 10³⁰ كجم. الجاذبية: 274 م/ث².' : 'Mass: 1.989 x 10³⁰ kg. Gravity: 274 m/s².'},
        {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'السطح: 5,500°C. اللب: 15.7 مليون درجة مئوية.' : 'Surface: 5,500°C. Core: 15.7M °C.'},
        {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'يتكون من الفوتوسفير، الكروموسفير، ومنطقة الانتقال، والإكليل.' : 'Photosphere, Chromosphere, Corona.'},
        {'t': isArabic ? '🧱 التركيب البنيوي' : '🧱 Structure', 'b': isArabic ? 'بلازما ساخنة تتكون من الهيدروجين (73%) والهيليوم (25%).' : 'H (73%) and He (25%).'},
        {'t': isArabic ? '🔄 الدوران حول النفس' : '🔄 Rotation', 'b': isArabic ? 'يدور مرة كل 25 يوماً عند خط الاستواء.' : '25 days at equator.'},
        {'t': isArabic ? '☀️ الدوران المداري' : '☀️ Orbit', 'b': isArabic ? 'تدور حول مركز مجرة درب التبانة بسرعة 220 كم/ث.' : 'Orbits Galactic Center.'},
        {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? 'لا تمتلك أقماراً.' : 'No moons.'},
        {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'لا تمتلك أي حلقات.' : 'No rings.'},
        {'t': isArabic ? '📍 الموقع في النظام' : '📍 Position', 'b': isArabic ? 'تقع في مركز النظام الشمسي تماماً.' : 'System center.'},
        {'t': isArabic ? '🔭 الرؤية من الفضاء' : '🔭 View', 'b': isArabic ? 'تبدو ككرة بيضاء ساطعة جداً.' : 'Bright white sphere.'},
        {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Exploration', 'b': isArabic ? 'مسبار باركر، SOHO، مرصد هينود.' : 'Parker, SOHO.'},
        {'t': isArabic ? '⚠️ حقائق مدهشة' : '⚠️ Facts', 'b': isArabic ? 'الضوء يستغرق 8 دقائق و20 ثانية ليصل للأرض.' : 'Light takes 8.2 mins.'},
      ]
    },
    {
      'name': isArabic ? 'عطارد' : 'Mercury',
      'image': 'assets/images/mercury.png',
      'color': Colors.grey,
      'gravity': 0.38, 'year_f': 0.24, 'is_star': false,
      'info': [
        {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'أصغر الكواكب وأقربها للشمس، عالم صخري مليء بالفوهات.' : 'Smallest and closest planet.'},
        {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 4,879 كم. الحجم: 6.083 × 10¹⁰ كم³.' : 'Diameter: 4,879 km.'},
        {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الكتلة: 3.301 × 10²³ كجم. الجاذبية: 3.7 م/ث².' : 'Mass: 3.3x10²³ kg.'},
        {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'من -180°C ليلاً إلى 430°C نهاراً.' : '-180°C to 430°C.'},
        {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'رقيق جداً (إكسوسفير) من الأكسجين والصوديوم.' : 'Thin exosphere.'},
        {'t': isArabic ? '🧱 التركيب البنيوي' : '🧱 Structure', 'b': isArabic ? 'لب حديدي ضخم (75% من قطره) وقشرة صخرية.' : 'Large iron core.'},
        {'t': isArabic ? '🔄 الدوران حول النفس' : '🔄 Rotation', 'b': isArabic ? 'يستغرق 59 يوماً أرضياً.' : '59 Earth days.'},
        {'t': isArabic ? '☀️ الدوران المداري' : '☀️ Orbit', 'b': isArabic ? 'يكمل دورته في 88 يوماً أرضياً.' : '88 Earth days.'},
        {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? 'لا يمتلك أي أقمار.' : 'No moons.'},
        {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'لا يمتلك حلقات.' : 'No rings.'},
        {'t': isArabic ? '📍 الموقع في النظام' : '📍 Position', 'b': isArabic ? 'الكوكب الأول.' : '1st planet.'},
        {'t': isArabic ? '🔭 الرؤية من الفضاء' : '🔭 View', 'b': isArabic ? 'يشبه القمر بسبب الفوهات الصدمية.' : 'Looks like the Moon.'},
        {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Exploration', 'b': isArabic ? 'مارينر 10، ماسينجر، بيبكولومبو.' : 'Mariner 10, MESSENGER.'},
        {'t': isArabic ? '⚠️ حقائق مدهشة' : '⚠️ Facts', 'b': isArabic ? 'يتقلص حجمه ببطء مع الزمن.' : 'Shrinking slowly.'},
      ]
    },
    {
      'name': isArabic ? 'الزهرة' : 'Venus',
      'image': 'assets/images/venus.png',
      'color': Colors.amber,
      'gravity': 0.9, 'year_f': 0.61, 'is_star': false,
      'info': [
        {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'توأم الأرض في الحجم، ولكنه أحر كوكب في النظام.' : 'Earth twin, hottest planet.'},
        {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 12,104 كم. الحجم: 9.284 × 10¹¹ كم³.' : 'Diameter: 12,104 km.'},
        {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الكتلة: 4.867 × 10²٤ كجم. الجاذبية: 8.87 م/ث².' : 'Mass: 4.8x10²٤ kg.'},
        {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'ثابتة عند 464°C بسبب الاحتباس الحراري.' : 'Stay at 464°C.'},
        {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'كثيف جداً من ثاني أكسيد الكربون.' : 'Thick CO2 clouds.'},
        {'t': isArabic ? '🧱 التركيب البنيوي' : '🧱 Structure', 'b': isArabic ? 'وشاح صخري ولب معدني مشابه للأرض.' : 'Rocky mantle, metal core.'},
        {'t': isArabic ? '🔄 الدوران حول النفس' : '🔄 Rotation', 'b': isArabic ? 'يدور عكس الاتجاه (243 يوماً).' : 'Retrograde (243 days).'},
        {'t': isArabic ? '☀️ الدوران المداري' : '☀️ Orbit', 'b': isArabic ? 'يستغرق 225 يوماً أرضياً.' : '225 Earth days.'},
        {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? 'لا يمتلك أي أقمار.' : 'No moons.'},
        {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'لا يمتلك حلقات.' : 'No rings.'},
        {'t': isArabic ? '📍 الموقع في النظام' : '📍 Position', 'b': isArabic ? 'الكوكب الثاني.' : '2nd planet.'},
        {'t': isArabic ? '🔭 الرؤية من الفضاء' : '🔭 View', 'b': isArabic ? 'كرة برتقالية ممسوحة بسبب السحب.' : 'Orange cloud sphere.'},
        {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Exploration', 'b': isArabic ? 'فينيرا، ماجلان، أكاتسوكي.' : 'Venera, Magellan.'},
        {'t': isArabic ? '⚠️ حقائق مدهشة' : '⚠️ Facts', 'b': isArabic ? 'يومه أطول من سنته.' : 'Day longer than year.'},
      ]
    },
    {
      'name': isArabic ? 'الأرض' : 'Earth',
      'image': 'assets/images/earth.png',
      'color': Colors.blue,
      'gravity': 1.0, 'year_f': 1.0, 'is_star': false,
      'info': [
        {'t': isArabic ? '📌 قصة النشأة' : '📌 Origin', 'b': isArabic ? 'نشأت قبل 4.54 مليار سنة.' : 'Formed 4.54B years ago.'},
        {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 12,756 كم. الحجم: 1.083 × 10¹² كم³.' : 'Diameter: 12,756 km.'},
        {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الكتلة: 5.97 × 10²٤ كجم. الجاذبية: 9.8 م/ث².' : 'Mass: 5.97x10²٤ kg.'},
        {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'المتوسط العالمي حوالي 15°C.' : 'Average 15°C.'},
        {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'يتكون من النيتروجين (78%) والأكسجين (21%).' : 'N2 (78%), O2 (21%).'},
        {'t': isArabic ? '🧱 التركيب البنيوي' : '🧱 Structure', 'b': isArabic ? 'تتكون من القشرة، الوشاح، واللب.' : 'Crust, mantle, core.'},
        {'t': isArabic ? '🔄 الدوران حول النفس' : '🔄 Rotation', 'b': isArabic ? '23 ساعة و56 دقيقة.' : '23h 56m.'},
        {'t': isArabic ? '☀️ الدوران المداري' : '☀️ Orbit', 'b': isArabic ? '365.25 يوم.' : '365.25 days.'},
        {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? 'قمر واحد طبيعي.' : 'One moon.'},
        {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'لا توجد حلقات.' : 'No rings.'},
        {'t': isArabic ? '📍 الموقع في النظام' : '📍 Position', 'b': isArabic ? 'الكوكب الثالث.' : '3rd planet.'},
        {'t': isArabic ? '🔭 الرؤية من الفضاء' : '🔭 View', 'b': isArabic ? 'تسمى الرخام الأزرق.' : 'The Blue Marble.'},
        {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Exploration', 'b': isArabic ? 'مأهولة ومستكشفة بالكامل.' : 'Fully explored.'},
        {'t': isArabic ? '⚠️ حقائق مدهشة' : '⚠️ Facts', 'b': isArabic ? 'الكوكب الوحيد المعروف بوجود حياة.' : 'Only planet with life.'},
      ]
    },
  ];
}    {
      'name': isArabic ? 'المريخ' : 'Mars',
      'image': 'assets/images/mars.png',
      'color': Colors.red,
      'gravity': 0.38, 'year_f': 1.88, 'is_star': false,
      'info': [
        {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'يُعرف بالكوكب الأحمر لوجود أكسيد الحديد بكثرة على سطحه.' : 'The Red Planet, famous for iron oxide on its surface.'},
        {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 6,779 كم. الحجم: 1.631 × 10¹¹ كم³.' : 'Diameter: 6,779 km.'},
        {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الكتلة: 6.39 × 10²³ كجم. الجاذبية: 3.71 م/ث².' : 'Mass: 6.39 x 10²³ kg.'},
        {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'المتوسط -62°C (تتراوح بين -143°C إلى 35°C).' : 'Average: -62°C.'},
        {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'رقيق جداً، يتكون بنسبة 95% من ثاني أكسيد الكربون.' : 'Thin, 95% CO2.'},
        {'t': isArabic ? '🧱 التركيب البنيوي' : '🧱 Structure', 'b': isArabic ? 'صخري مع لب من الحديد والنيكل والكبريت.' : 'Rocky with iron-nickel core.'},
        {'t': isArabic ? '🔄 الدوران حول النفس' : '🔄 Rotation', 'b': isArabic ? 'يومه مشابه للأرض: 24 ساعة و37 دقيقة.' : '24h 37m.'},
        {'t': isArabic ? '☀️ الدوران المداري' : '☀️ Orbit', 'b': isArabic ? 'يستغرق 687 يوماً أرضياً ليكمل دورته.' : '687 Earth days.'},
        {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? 'يمتلك قمرين صغيرين هما فوبوس وديموس.' : 'Phobos and Deimos.'},
        {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'لا يمتلك حلقات حالياً.' : 'No rings.'},
        {'t': isArabic ? '📍 الموقع في النظام' : '📍 Position', 'b': isArabic ? 'الكوكب الرابع بعداً عن الشمس.' : '4th planet.'},
        {'t': isArabic ? '🔭 الرؤية من الفضاء' : '🔭 View', 'b': isArabic ? 'يتميز بلونه المائل للحمرة مع أقطاب جليدية.' : 'Reddish with ice caps.'},
        {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Exploration', 'b': isArabic ? 'كيوريوسيتي، بيرسيفيرانس، مسبار الأمل.' : 'Curiosity, Perseverance.'},
        {'t': isArabic ? '⚠️ حقائق مدهشة' : '⚠️ Facts', 'b': isArabic ? 'يضم أعلى بركان "أوليمبوس مونس" وأعمق وادي.' : 'Has the tallest volcano.'},
      ]
    },
    {
      'name': isArabic ? 'المشتري' : 'Jupiter',
      'image': 'assets/images/jupiter.png',
      'color': Colors.brown,
      'gravity': 2.52, 'year_f': 11.86, 'is_star': false,
      'info': [
        {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'أكبر كواكب النظام الشمسي وهو عملاق غازي ضخم.' : 'Largest planet, a massive gas giant.'},
        {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 139,820 كم. الحجم: يتسع لـ 1,321 أرض.' : 'Diameter: 139,820 km.'},
        {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الكتلة: 1.89 × 10²⁷ كجم. الجاذبية: 24.79 م/ث².' : 'Mass: 1.89 x 10²⁷ kg.'},
        {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'المتوسط عند قمم السحب حوالي -108°C.' : 'Average: -108°C.'},
        {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'يتكون أساساً من الهيدروجين والهيليوم.' : 'Mostly Hydrogen and Helium.'},
        {'t': isArabic ? '🧱 التركيب البنيوي' : '🧱 Structure', 'b': isArabic ? 'غازي مع لب صخري محاط بهيدروجين معدني.' : 'Gas with metallic hydrogen.'},
        {'t': isArabic ? '🔄 الدوران حول النفس' : '🔄 Rotation', 'b': isArabic ? 'سريع جداً، يكمل دورته في أقل من 10 ساعات.' : 'Less than 10 hours.'},
        {'t': isArabic ? '☀️ الدوران المداري' : '☀️ Orbit', 'b': isArabic ? 'يستغرق 11.8 سنة أرضية للدوران حول الشمس.' : '11.8 Earth years.'},
        {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? 'لديه 95 قمراً، أشهرها أقمار جاليليو الأربعة.' : '95 moons.'},
        {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'يمتلك نظام حلقات باهت جداً.' : 'Faint ring system.'},
        {'t': isArabic ? '📍 الموقع في النظام' : '📍 Position', 'b': isArabic ? 'الكوكب الخامس بعداً عن الشمس.' : '5th planet.'},
        {'t': isArabic ? '🔭 الرؤية من الفضاء' : '🔭 View', 'b': isArabic ? 'يظهر بمناطق وأحزمة ملونة مع البقعة الحمراء.' : 'Striped with Great Red Spot.'},
        {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Exploration', 'b': isArabic ? 'مسبار جونو، جاليليو، بايونير.' : 'Juno, Galileo.'},
        {'t': isArabic ? '⚠️ حقائق مدهشة' : '⚠️ Facts', 'b': isArabic ? 'البقعة الحمراء الكبرى هي عاصفة مستمرة منذ قرون.' : 'Great Red Spot is a giant storm.'},
      ]
    },
    {
      'name': isArabic ? 'زحل' : 'Saturn',
      'image': 'assets/images/saturn.png',
      'color': Colors.orangeAccent,
      'gravity': 1.06, 'year_f': 29.45, 'is_star': false,
      'info': [
        {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'يُعرف بملك الحلقات، وهو ثاني أكبر الكواكب.' : 'The King of Rings, 2nd largest planet.'},
        {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 116,460 كم. الحجم: يتسع لـ 763 أرض.' : 'Diameter: 116,460 km.'},
        {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الكتلة: 5.68 × 10²⁶ كجم. الجاذبية: 10.44 م/ث².' : 'Mass: 5.68 x 10²⁶ kg.'},
        {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'متوسط درجة الحرارة حوالي -138°C.' : 'Average: -138°C.'},
        {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'معظمه هيدروجين وهيليوم مع سحب من الأمونيا.' : 'Hydrogen and Helium.'},
        {'t': isArabic ? '🧱 التركيب البنيوي' : '🧱 Structure', 'b': isArabic ? 'عملاق غازي كتلته أقل من كثافة الماء.' : 'Less dense than water.'},
        {'t': isArabic ? '🔄 الدوران حول النفس' : '🔄 Rotation', 'b': isArabic ? 'يكمل دورته في 10 ساعات و33 دقيقة.' : '10h 33m.'},
        {'t': isArabic ? '☀️ الدوران المداري' : '☀️ Orbit', 'b': isArabic ? 'يستغرق 29.4 سنة أرضية للدوران حول الشمس.' : '29.4 Earth years.'},
        {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? 'يمتلك 146 قمراً، أكبرها تيتان.' : '146 moons.'},
        {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'أشهر نظام حلقات مكون من الجليد والغبار.' : 'Famous ice rings.'},
        {'t': isArabic ? '📍 الموقع في النظام' : '📍 Position', 'b': isArabic ? 'الكوكب السادس بعداً عن الشمس.' : '6th planet.'},
        {'t': isArabic ? '🔭 الرؤية من الفضاء' : '🔭 View', 'b': isArabic ? 'يظهر بلون ذهبي مع حلقات واضحة جداً.' : 'Golden with bright rings.'},
        {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Exploration', 'b': isArabic ? 'مسبار كاسيني، فوييجر، رائد 11.' : 'Cassini, Voyager.'},
        {'t': isArabic ? '⚠️ حقائق مدهشة' : '⚠️ Facts', 'b': isArabic ? 'حلقاته ليست صلبة بل ملايين من قطع الجليد.' : 'Rings made of ice and dust.'},
      ]
    },
    {
      'name': isArabic ? 'أورانوس' : 'Uranus',
      'image': 'assets/images/uranus.png',
      'color': Colors.cyan,
      'gravity': 0.88, 'year_f': 84.01, 'is_star': false,
      'info': [
        {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'عملاق جليدي يمتاز بميله المحوري الغريب.' : 'Ice giant with a unique tilt.'},
        {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 50,724 كم. الحجم: يتسع لـ 63 أرض.' : 'Diameter: 50,724 km.'},
        {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الكتلة: 8.68 × 10²٥ كجم. الجاذبية: 8.69 م/ث².' : 'Mass: 8.68 x 10²٥ kg.'},
        {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'أبرد كوكب في النظام، المتوسط -195°C.' : 'Coldest planet: -195°C.'},
        {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'هيدروجين وهيليوم وميثان (سبب اللون الأزرق).' : 'Has methane gas.'},
        {'t': isArabic ? '🧱 التركيب البنيوي' : '🧱 Structure', 'b': isArabic ? 'يتكون من سوائل جليدية فوق لب صخري صغير.' : 'Icy fluids and rock core.'},
        {'t': isArabic ? '🔄 الدوران حول النفس' : '🔄 Rotation', 'b': isArabic ? 'يدور على جانبه (محور مائل بـ 98 درجة).' : 'Rotates on its side.'},
        {'t': isArabic ? '☀️ الدوران المداري' : '☀️ Orbit', 'b': isArabic ? 'يستغرق 84 سنة أرضية للدوران حول الشمس.' : '84 Earth years.'},
        {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? 'لديه 27 قمراً معروفاً.' : '27 moons.'},
        {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'يمتلك 13 حلقة رقيقة وداكنة.' : '13 dark rings.'},
        {'t': isArabic ? '📍 الموقع في النظام' : '📍 Position', 'b': isArabic ? 'الكوكب السابع بعداً عن الشمس.' : '7th planet.'},
        {'t': isArabic ? '🔭 الرؤية من الفضاء' : '🔭 View', 'b': isArabic ? 'يظهر ككرة زرقاء مخضرة ممسوحة الملامح.' : 'Cyan-blue sphere.'},
        {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Exploration', 'b': isArabic ? 'تمت زيارته مرة واحدة بواسطة فوييجر 2.' : 'Visited by Voyager 2.'},
        {'t': isArabic ? '⚠️ حقائق مدهشة' : '⚠️ Facts', 'b': isArabic ? 'الفصول على أورانوس تستمر لمدة 21 عاماً.' : 'Seasons last 21 years.'},
      ]
    },
    {
      'name': isArabic ? 'نبتون' : 'Neptune',
      'image': 'assets/images/neptune.png',
      'color': Colors.blueAccent,
      'gravity': 1.14, 'year_f': 164.8, 'is_star': false,
      'info': [
        {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'أبعد كوكب عن الشمس، ويمتاز برياحه العاتية.' : 'Farthest planet, very windy.'},
        {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 49,244 كم. الحجم: يتسع لـ 57 أرض.' : 'Diameter: 49,244 km.'},
        {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الكتلة: 1.02 × 10²⁶ كجم. الجاذبية: 11.15 م/ث².' : 'Mass: 1.02 x 10²⁶ kg.'},
        {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'متوسط درجة الحرارة حوالي -201°C.' : 'Average: -201°C.'},
        {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'هيدروجين وهيليوم وميثان يعطيه اللون الأزرق الداكن.' : 'Deep blue methane clouds.'},
        {'t': isArabic ? '🧱 التركيب البنيوي' : '🧱 Structure', 'b': isArabic ? 'يتكون من سوائل "جليدية" من الماء والأمونيا.' : 'Icy fluids.'},
        {'t': isArabic ? '🔄 الدوران حول النفس' : '🔄 Rotation', 'b': isArabic ? 'يكمل دورته في 16 ساعة أرضية.' : '16 hours.'},
        {'t': isArabic ? '☀️ الدوران المداري' : '☀️ Orbit', 'b': isArabic ? 'يستغرق 165 سنة أرضية للدوران حول الشمس.' : '165 Earth years.'},
        {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? 'لديه 14 قمراً، أكبرها تريتون.' : '14 moons.'},
        {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'يمتلك 5 حلقات رقيقة ومتقطعة.' : '5 thin rings.'},
        {'t': isArabic ? '📍 الموقع في النظام' : '📍 Position', 'b': isArabic ? 'الكوكب الثامن والأخير في النظام.' : '8th planet.'},
        {'t': isArabic ? '🔭 الرؤية من الفضاء' : '🔭 View', 'b': isArabic ? 'يظهر ككرة زرقاء داكنة مع سحب بيضاء عابرة.' : 'Dark blue sphere.'},
        {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Exploration', 'b': isArabic ? 'زارته فوييجر 2 في عام 1989.' : 'Voyager 2 (1989).'},
        {'t': isArabic ? '⚠️ حقائق مدهشة' : '⚠️ Facts', 'b': isArabic ? 'الرياح فيه تصل لسرعة 2,100 كم في الساعة.' : 'Winds reach 2,100 km/h.'},
      ]
    },
  ];
}

// --- شاشة عرض قائمة الكواكب (المستكشف) ---
class ExplorerScreen extends StatelessWidget {
  final bool isArabic;
  const ExplorerScreen({super.key, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    // استدعاء البيانات من الدالة التي وضعناها في الأجزاء السابقة
    final planets = getPlanetsData(isArabic);

    return Scaffold(
      appBar: AppBar(
        title: Text(isArabic ? 'المستكشف' : 'Explorer'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: planets.length,
        itemBuilder: (ctx, i) => Container(
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: const Color(0xFF111111), // خلفية البطاقة الداكنة
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            leading: Image.asset(planets[i]['image'], width: 50),
            title: Text(
              planets[i]['name'],
              style: TextStyle(
                fontSize: 22, 
                fontWeight: FontWeight.bold, 
                color: planets[i]['color']
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.white38),
            onTap: () => Navigator.push(
              ctx, 
              MaterialPageRoute(builder: (_) => DetailsScreen(p: planets[i], isArabic: isArabic))
            ),
          ),
        ),
      ),
    );
  }
}

// --- شاشة التفاصيل (التصميم القديم + الحسابات الجديدة) ---
class DetailsScreen extends StatefulWidget {
  final Map<String, dynamic> p;
  final bool isArabic;
  const DetailsScreen({super.key, required this.p, required this.isArabic});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  double weightResult = 0;
  double ageResult = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.p['name']),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Hero(tag: widget.p['name'], child: Image.asset(widget.p['image'], width: 200)),
            const SizedBox(height: 20),
            
            // قسم حساب الوزن
            _buildInputCard(
              topLabel: widget.isArabic ? "وزنك هنا" : "Your Weight Here",
              resultLabel: widget.isArabic ? "وزنك في هذا الكوكب" : "Weight on this planet",
              onChanged: (v) => setState(() => weightResult = (double.tryParse(v) ?? 0) * widget.p['gravity']),
              result: weightResult,
              unit: "kg",
            ),
            
            const SizedBox(height: 15),

            // قسم حساب العمر (يظهر فقط للكواكب وليس للشمس)
            if (!widget.p['is_star'])
              _buildInputCard(
                topLabel: widget.isArabic ? "عمرك هنا" : "Your Age Here",
                resultLabel: widget.isArabic ? "عمرك في هذا الكوكب" : "Age on this planet",
                onChanged: (v) => setState(() => ageResult = (double.tryParse(v) ?? 0) / widget.p['year_f']),
                result: ageResult,
                unit: widget.isArabic ? "سنة" : "Yrs",
              ),

            const SizedBox(height: 30),

            // قائمة المعلومات (14 معلومة كاملة) بتصميم البطاقات الجانبية
            ...(widget.p['info'] as List).map((item) => Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF111111),
                borderRadius: BorderRadius.circular(15),
                // الخط الملون الجانبي من التصميم القديم
                border: Border(
                  left: isLTR() ? BorderSide(color: widget.p['color'], width: 5) : BorderSide.none,
                  right: !isLTR() ? BorderSide(color: widget.p['color'], width: 5) : BorderSide.none,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['t'], 
                    style: TextStyle(color: widget.p['color'], fontSize: 18, fontWeight: FontWeight.bold)
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item['b'], 
                    style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.white70)
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  bool isLTR() => !widget.isArabic;

  Widget _buildInputCard({required String topLabel, required String resultLabel, required Function(String) onChanged, required double result, required String unit}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFF111111), borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Text(topLabel, style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
          TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: "0.0",
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.2)),
              border: InputBorder.none,
            ),
          ),
          if (result > 0) ...[
            const Divider(color: Colors.white10),
            Text(resultLabel, style: const TextStyle(color: Colors.white38, fontSize: 12)),
            Text(
              "${result.toStringAsFixed(1)} $unit", 
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.amber)
            ),
          ]
        ],
      ),
    );
  }
}

// --- شاشة الإعدادات ---
class SettingsScreen extends StatelessWidget {
  final bool isArabic;
  final VoidCallback onLangToggle;
  const SettingsScreen({super.key, required this.isArabic, required this.onLangToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isArabic ? "الإعدادات" : "Settings")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListTile(
            leading: const Icon(Icons.language, color: Colors.amber),
            title: Text(isArabic ? "لغة التطبيق" : "App Language"),
            subtitle: Text(isArabic ? "العربية" : "English"),
            trailing: Switch(
              value: isArabic,
              onChanged: (_) => onLangToggle(),
              activeColor: Colors.amber,
            ),
          ),
          const Divider(height: 40, color: Colors.white10),
          const Center(child: Text("Version 4.0.0", style: TextStyle(color: Colors.white10))),
        ],
      ),
    );
  }
}
