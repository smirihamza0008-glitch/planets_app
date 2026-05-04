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
            const Text("Hamza Store", style: TextStyle(color: Colors.white24, letterSpacing: 4, fontSize: 18)),
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
        'image': 'assets/images/sun.png',
        'color': Colors.orange,
        'gravity': 27.9, 'year_f': 1.0, 'is_star': true,
        'info': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'نجم من نوع "القزم الأصفر"، يمثل قلب النظام الشمسي.' : 'A Yellow Dwarf star, heart of the solar system.'},
          {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 1,392,700 كم\nالحجم: يتسع لـ 1.3 مليون أرض' : 'Diameter: 1.39M km\nVolume: 1.3M Earths'},
          {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الكتلة: 1.989 × 10³⁰ كجم\nالجاذبية: 274 م/ث²' : 'Mass: 1.989 x 10³⁰ kg\nGravity: 274 m/s²'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'السطح: 5,500°C\nاللب: 15.7 مليون درجة مئوية' : 'Surface: 5,500°C\nCore: 15.7M °C'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'الفوتوسفير، الكروموسفير، ومنطقة الانتقال، والإكليل.' : 'Photosphere, Chromosphere, Corona.'},
          {'t': isArabic ? '🧱 التركيب البنيوي' : '🧱 Structure', 'b': isArabic ? '73% هيدروجين، 25% هيليوم.' : '73% H, 25% He.'},
          {'t': isArabic ? '🔄 الدوران' : '🔄 Rotation', 'b': isArabic ? '25 يوماً عند خط الاستواء.' : '25 days.'},
          {'t': isArabic ? '☀️ المدار' : '☀️ Orbit', 'b': isArabic ? 'تدور حول مركز مجرة درب التبانة.' : 'Orbits galactic center.'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? 'لا تملك أقماراً.' : 'No moons.'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'لا تمتلك حلقات.' : 'No rings.'},
          {'t': isArabic ? '📍 الموقع' : '📍 Position', 'b': isArabic ? 'مركز النظام الشمسي.' : 'Center of system.'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 View', 'b': isArabic ? 'كرة بيضاء ساطعة.' : 'Bright white sphere.'},
          {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Exploration', 'b': isArabic ? 'باركر، SOHO.' : 'Parker, SOHO.'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'الضوء يستغرق 8 دقائق ليصل للأرض.' : 'Light takes 8 mins to Earth.'},
        ]
      },
      {
        'name': isArabic ? 'عطارد' : 'Mercury',
        'image': 'assets/images/mercury.png',
        'color': Colors.grey,
        'gravity': 0.38, 'year_f': 0.24, 'is_star': false,
        'info': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'أصغر الكواكب والأقرب للشمس.' : 'Smallest and closest planet.'},
          {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 4,879 كم\nالحجم: 6.083 × 10¹⁰ كم³' : 'Diameter: 4,879 km\nVolume: 6.08 x 10¹⁰ km³'},
          {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الكتلة: 3.3 × 10²³ كجم\nالجاذبية: 3.7 م/ث²' : 'Mass: 3.3 x 10²³ kg\nGravity: 3.7 m/s²'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'من -180°C إلى 430°C.' : '-180°C to 430°C.'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'رقيق جداً (إكسوسفير).' : 'Thin exosphere.'},
          {'t': isArabic ? '🧱 التركيب البنيوي' : '🧱 Structure', 'b': isArabic ? 'قلب حديدي صخم وقشرة صخرية.' : 'Iron core, rocky crust.'},
          {'t': isArabic ? '🔄 الدوران' : '🔄 Rotation', 'b': isArabic ? '59 يوماً أرضياً.' : '59 Earth days.'},
          {'t': isArabic ? '☀️ السنة' : '☀️ Year', 'b': isArabic ? '88 يوماً أرضياً.' : '88 Earth days.'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? 'لا يملك أقماراً.' : 'No moons.'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'لا توجد حلقات.' : 'No rings.'},
          {'t': isArabic ? '📍 الموقع' : '📍 Position', 'b': isArabic ? 'الكوكب الأول.' : '1st planet.'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 View', 'b': isArabic ? 'يشبه القمر بالفوهات.' : 'Looks like the Moon.'},
          {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Exploration', 'b': isArabic ? 'مارينر 10، ماسينجر.' : 'Mariner 10, MESSENGER.'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'يتقلص ببطء مع الزمن.' : 'Shrinking slowly.'},
        ]
      },
      {
        'name': isArabic ? 'الزهرة' : 'Venus',
        'image': 'assets/images/venus.png',
        'color': Colors.amber,
        'gravity': 0.9, 'year_f': 0.61, 'is_star': false,
        'info': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'توأم الأرض ولكنه جحيم مستعر.' : 'Earth twin but volcanic.'},
          {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 12,104 كم\nالحجم: 9.28 × 10¹¹ كم³' : 'Diameter: 12,104 km\nVolume: 9.28 x 10¹¹ km³'},
          {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الكتلة: 4.86 × 10²٤ كجم\nالجاذبية: 8.87 م/ث²' : 'Mass: 4.86 x 10²٤ kg\nGravity: 8.87 m/s²'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'ثابتة عند 464°C.' : 'Stays at 464°C.'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'كثيف جداً من CO2.' : 'Thick CO2 clouds.'},
          {'t': isArabic ? '🧱 التركيب البنيوي' : '🧱 Structure', 'b': isArabic ? 'وشاح صخري ولب معدني.' : 'Rocky mantle, metal core.'},
          {'t': isArabic ? '🔄 الدوران' : '🔄 Rotation', 'b': isArabic ? '243 يوماً (عكس الاتجاه).' : '243 days (Retrograde).'},
          {'t': isArabic ? '☀️ السنة' : '☀️ Year', 'b': isArabic ? '225 يوماً أرضياً.' : '225 Earth days.'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? 'لا يمتلك أقماراً.' : 'No moons.'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'لا توجد حلقات.' : 'No rings.'},
          {'t': isArabic ? '📍 الموقع' : '📍 Position', 'b': isArabic ? 'الكوكب الثاني.' : '2nd planet.'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 View', 'b': isArabic ? 'كرة برتقالية ممسوحة.' : 'Orange sphere.'},
          {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Exploration', 'b': isArabic ? 'فينيرا، ماجلان.' : 'Venera, Magellan.'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'يومه أطول من سنته.' : 'Day longer than year.'},
        ]
      },
      {
        'name': isArabic ? 'الأرض' : 'Earth',
        'image': 'assets/images/earth.png',
        'color': Colors.blue,
        'gravity': 1.0, 'year_f': 1.0, 'is_star': false,
        'info': [
          {'t': isArabic ? '📌 قصة النشأة' : '📌 Creation', 'b': isArabic ? 'بدأت قبل 4.54 مليار سنة.' : 'Formed 4.54B years ago.'},
          {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 12,756 كم\nالحجم: 1.083 × 10¹² كم³' : 'Diameter: 12,756 km\nVolume: 1.083 x 10¹² km³'},
          {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الكتلة: 5.97 × 10²٤ كجم\nالجاذبية: 9.8 م/ث²' : 'Mass: 5.97 x 10²٤ kg\nGravity: 9.8 m/s²'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'المتوسط: 15°C.' : 'Average: 15°C.'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'نيتروجين، أكسجين.' : 'Nitrogen, Oxygen.'},
          {'t': isArabic ? '🧱 التركيب البنيوي' : '🧱 Structure', 'b': isArabic ? 'قشرة، وشاح، لب.' : 'Crust, Mantle, Core.'},
          {'t': isArabic ? '🔄 الدوران' : '🔄 Rotation', 'b': isArabic ? '23 ساعة و56 دقيقة.' : '23h 56m.'},
          {'t': isArabic ? '☀️ السنة' : '☀️ Year', 'b': isArabic ? '365.25 يوم.' : '365.25 days.'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? 'قمر واحد.' : 'One moon.'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'لا توجد حلقات.' : 'No rings.'},
          {'t': isArabic ? '📍 الموقع' : '📍 Position', 'b': isArabic ? 'الكوكب الثالث.' : '3rd planet.'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 View', 'b': isArabic ? 'الرخام الأزرق.' : 'Blue Marble.'},
          {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Exploration', 'b': isArabic ? 'مأهول ومستكشف بالكامل.' : 'Fully explored.'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'الوحيد الذي فيه حياة.' : 'Only planet with life.'},
        ]
      },
      {
        'name': isArabic ? 'المريخ' : 'Mars',
        'image': 'assets/images/mars.png',
        'color': Colors.red,
        'gravity': 0.38, 'year_f': 1.88, 'is_star': false,
        'info': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'الكوكب الأحمر، موطن أكبر البراكين في نظامنا.' : 'The Red Planet, home to the largest volcanoes.'},
          {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 6,779 كم\nالحجم: 1.63 × 10¹¹ كم³' : 'Diameter: 6,779 km\nVolume: 1.63 x 10¹¹ km³'},
          {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الكتلة: 6.39 × 10²³ كجم\nالجاذبية: 3.71 م/ث²' : 'Mass: 6.39 x 10²³ kg\nGravity: 3.71 m/s²'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'المتوسط: -62°C.' : 'Average: -62°C.'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'رقيق، معظمه CO2.' : 'Thin, mostly CO2.'},
          {'t': isArabic ? '🧱 التركيب البنيوي' : '🧱 Structure', 'b': isArabic ? 'صخري، قلب حديد وكبريت.' : 'Rocky, iron-sulfur core.'},
          {'t': isArabic ? '🔄 الدوران' : '🔄 Rotation', 'b': isArabic ? '24 ساعة و37 دقيقة.' : '24h 37m.'},
          {'t': isArabic ? '☀️ السنة' : '☀️ Year', 'b': isArabic ? '687 يوماً أرضياً.' : '687 Earth days.'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? 'قمران: فوبوس وديموس.' : 'Two moons.'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'لا توجد حلقات.' : 'No rings.'},
          {'t': isArabic ? '📍 الموقع' : '📍 Position', 'b': isArabic ? 'الكوكب الرابع.' : '4th planet.'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 View', 'b': isArabic ? 'يظهر كقرص أحمر صدئ.' : 'Reddish disk.'},
          {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Exploration', 'b': isArabic ? 'كيوريوسيتي، مسبار الأمل.' : 'Curiosity, Hope Probe.'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'يحتوي على أعلى جبل (أوليمبوس).' : 'Has the tallest mountain.'},
        ]
      },
      {
        'name': isArabic ? 'المشتري' : 'Jupiter',
        'image': 'assets/images/jupiter.png',
        'color': Colors.brown,
        'gravity': 2.52, 'year_f': 11.86, 'is_star': false,
        'info': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'عملاق غازي وأكبر كواكب النظام.' : 'Gas giant, largest planet.'},
          {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 139,820 كم\nالحجم: يتسع لـ 1,321 أرض' : 'Diameter: 139,820 km\nVolume: 1,321 Earths'},
          {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الكتلة: 1.89 × 10²⁷ كجم\nالجاذبية: 24.79 م/ث²' : 'Mass: 1.89 x 10²⁷ kg\nGravity: 24.79 m/s²'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'المتوسط: -108°C.' : 'Average: -108°C.'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'هيدروجين وهيليوم.' : 'H & He.'},
          {'t': isArabic ? '🧱 التركيب البنيوي' : '🧱 Structure', 'b': isArabic ? 'غازي، لب صخري محتمل.' : 'Gas, possible rocky core.'},
          {'t': isArabic ? '🔄 الدوران' : '🔄 Rotation', 'b': isArabic ? '9 ساعات و55 دقيقة.' : '9h 55m.'},
          {'t': isArabic ? '☀️ السنة' : '☀️ Year', 'b': isArabic ? '11.8 سنة أرضية.' : '11.8 Earth years.'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? '95 قمراً معروفاً.' : '95 known moons.'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'حلقات باهتة جداً.' : 'Faint rings.'},
          {'t': isArabic ? '📍 الموقع' : '📍 Position', 'b': isArabic ? 'الكوكب الخامس.' : '5th planet.'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 View', 'b': isArabic ? 'مخطط مع بقعة حمراء كبيرة.' : 'Striped with Great Red Spot.'},
          {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Exploration', 'b': isArabic ? 'جونو، جاليليو.' : 'Juno, Galileo.'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'يومه هو الأقصر بين الكواكب.' : 'Shortest day.'},
        ]
      },
      {
        'name': isArabic ? 'زحل' : 'Saturn',
        'image': 'assets/images/saturn.png',
        'color': Colors.orangeAccent,
        'gravity': 1.06, 'year_f': 29.45, 'is_star': false,
        'info': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'جوهرة النظام الشمسي بحلقاته الرائعة.' : 'Jewel of the system with rings.'},
          {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 116,460 كم\nالحجم: 763 ضعف الأرض' : 'Diameter: 116,460 km\nVolume: 763 Earths'},
          {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الكتلة: 5.68 × 10²⁶ كجم\nالجاذبية: 10.44 م/ث²' : 'Mass: 5.68 x 10²⁶ kg\nGravity: 10.44 m/s²'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'المتوسط: -138°C.' : 'Average: -138°C.'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'هيدروجين وهيليوم.' : 'H & He.'},
          {'t': isArabic ? '🧱 التركيب البنيوي' : '🧱 Structure', 'b': isArabic ? 'غازي مع لب معدني.' : 'Gas with metal core.'},
          {'t': isArabic ? '🔄 الدوران' : '🔄 Rotation', 'b': isArabic ? '10 ساعات و33 دقيقة.' : '10h 33m.'},
          {'t': isArabic ? '☀️ السنة' : '☀️ Year', 'b': isArabic ? '29.5 سنة أرضية.' : '29.5 Earth years.'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? '146 قمراً.' : '146 moons.'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? 'أضخم نظام حلقات جليدية.' : 'Massive ice rings.'},
          {'t': isArabic ? '📍 الموقع' : '📍 Position', 'b': isArabic ? 'الكوكب السادس.' : '6th planet.'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 View', 'b': isArabic ? 'ذهبي مع حلقات واضحة.' : 'Golden with visible rings.'},
          {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Exploration', 'b': isArabic ? 'كاسيني، فوييجر.' : 'Cassini, Voyager.'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'كثافته أقل من الماء.' : 'Less dense than water.'},
        ]
      },
      {
        'name': isArabic ? 'أورانوس' : 'Uranus',
        'image': 'assets/images/uranus.png',
        'color': Colors.cyan,
        'gravity': 0.88, 'year_f': 84.01, 'is_star': false,
        'info': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'العملاق الجليدي البارد.' : 'The cold ice giant.'},
          {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'الالقطر: 50,724 كم\nالحجم: 63 ضعف الأرض' : 'Diameter: 50,724 km\nVolume: 63 Earths'},
          {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الكتلة: 8.68 × 10²٥ كجم\nالجاذبية: 8.69 م/ث²' : 'Mass: 8.68 x 10²٥ kg\nGravity: 8.69 m/s²'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'المتوسط: -195°C.' : 'Average: -195°C.'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'هيدروجين، هيليوم، ميثان.' : 'H, He, Methane.'},
          {'t': isArabic ? '🧱 التركيب البنيوي' : '🧱 Structure', 'b': isArabic ? 'سوائل جليدية فوق لب صخري.' : 'Icy fluids over rocky core.'},
          {'t': isArabic ? '🔄 الدوران' : '🔄 Rotation', 'b': isArabic ? '17 ساعة و14 دقيقة.' : '17h 14m.'},
          {'t': isArabic ? '☀️ السنة' : '☀️ Year', 'b': isArabic ? '84 سنة أرضية.' : '84 Earth years.'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? '27 قمراً.' : '27 moons.'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? '13 حلقة رقيقة.' : '13 thin rings.'},
          {'t': isArabic ? '📍 الموقع' : '📍 Position', 'b': isArabic ? 'الكوكب السابع.' : '7th planet.'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 View', 'b': isArabic ? 'كرة زرقاء مخضرة باهتة.' : 'Pale blue-green sphere.'},
          {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Exploration', 'b': isArabic ? 'فوييجر 2.' : 'Voyager 2.'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'يدور على جنبه (محور مائل).' : 'Rotates on its side.'},
        ]
      },
      {
        'name': isArabic ? 'نبتون' : 'Neptune',
        'image': 'assets/images/neptune.png',
        'color': Colors.blueAccent,
        'gravity': 1.14, 'year_f': 164.8, 'is_star': false,
        'info': [
          {'t': isArabic ? '📌 نبذة عامة' : '📌 Overview', 'b': isArabic ? 'الكوكب الأزرق البعيد والرياح العاتية.' : 'Distant blue planet, high winds.'},
          {'t': isArabic ? '📏 القطر والحجم' : '📏 Size', 'b': isArabic ? 'القطر: 49,244 كم\nالحجم: 57 ضعف الأرض' : 'Diameter: 49,244 km\nVolume: 57 Earths'},
          {'t': isArabic ? '⚖️ الكتلة والجاذبية' : '⚖️ Gravity', 'b': isArabic ? 'الكتلة: 1.02 × 10²⁶ كجم\nالجاذبية: 11.15 م/ث²' : 'Mass: 1.02 x 10²⁶ kg\nGravity: 11.15 m/s²'},
          {'t': isArabic ? '🌡️ درجة الحرارة' : '🌡️ Temp', 'b': isArabic ? 'المتوسط: -201°C.' : 'Average: -201°C.'},
          {'t': isArabic ? '🌍 الغلاف الجوي' : '🌍 Atmosphere', 'b': isArabic ? 'ميثان، هيدروجين، هيليوم.' : 'Methane, H, He.'},
          {'t': isArabic ? '🧱 التركيب البنيوي' : '🧱 Structure', 'b': isArabic ? 'ماء وجليد ميثان.' : 'Water and methane ice.'},
          {'t': isArabic ? '🔄 الدوران' : '🔄 Rotation', 'b': isArabic ? '16 ساعة.' : '16 hours.'},
          {'t': isArabic ? '☀️ السنة' : '☀️ Year', 'b': isArabic ? '165 سنة أرضية.' : '165 Earth years.'},
          {'t': isArabic ? '🌙 الأقمار' : '🌙 Moons', 'b': isArabic ? '14 قمراً (تريتون أهمها).' : '14 moons (Triton).'},
          {'t': isArabic ? '💍 الحلقات' : '💍 Rings', 'b': isArabic ? '5 حلقات داكنة.' : '5 dark rings.'},
          {'t': isArabic ? '📍 الموقع' : '📍 Position', 'b': isArabic ? 'الكوكب الثامن.' : '8th planet.'},
          {'t': isArabic ? '🔭 الرؤية' : '🔭 View', 'b': isArabic ? 'أزرق داكن وسريع الرياح.' : 'Dark blue, very windy.'},
          {'t': isArabic ? '🚀 الاستكشاف' : '🚀 Exploration', 'b': isArabic ? 'فوييجر 2.' : 'Voyager 2.'},
          {'t': isArabic ? '⚠️ حقائق' : '⚠️ Facts', 'b': isArabic ? 'أبعد كوكب عن الشمس.' : 'Farthest planet.'},
        ]
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final planets = getData();
    return Scaffold(
      appBar: AppBar(title: Text(isArabic ? 'مستكشف الكواكب' : 'Planet Explorer'), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: planets.length,
        itemBuilder: (ctx, i) => Container(
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(colors: [const Color(0xFF161B22), planets[i]['color'].withOpacity(0.5)]),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(20),
            leading: Image.asset(planets[i]['image'], width: 60),
            title: Text(planets[i]['name'], style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: planets[i]['color'])),
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
  double wR = 0, aR = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.p['name'])),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset(widget.p['image'], width: 180),
            const SizedBox(height: 10),
            Text(widget.p['name'], style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: widget.p['color'])),
            const SizedBox(height: 30),
            _box(widget.isArabic ? "وزنك هنا (kg)" : "Weight (kg)", (v) => setState(() => wR = (double.tryParse(v) ?? 0) * widget.p['gravity']), wR, "kg"),
            const SizedBox(height: 12),
            if (!widget.p['is_star']) _box(widget.isArabic ? "عمرك هنا (سنة)" : "Age (Yrs)", (v) => setState(() => aR = (double.tryParse(v) ?? 0) / widget.p['year_f']), aR, widget.isArabic ? "سنة" : "Yrs"),
            const SizedBox(height: 40),
            ...(widget.p['info'] as List).map((item) => Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(15), border: Border(right: BorderSide(color: widget.p['color'], width: 6))),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(item['t'], style: TextStyle(color: widget.p['color'], fontWeight: FontWeight.bold, fontSize: 20)),
                const Divider(color: Colors.white10, height: 20),
                Text(item['b'], style: const TextStyle(fontSize: 17, height: 1.6)),
              ]),
            )),
          ],
        ),
      ),
    );
  }
  Widget _box(String t, Function(String) onC, double r, String u) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.03), borderRadius: BorderRadius.circular(20)),
      child: Column(children: [
        Text(t, style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
        TextField(keyboardType: TextInputType.number, textAlign: TextAlign.center, onChanged: onC, decoration: const InputDecoration(hintText: "0.0")),
        if (r > 0) Text("${r.toStringAsFixed(1)} $u", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.amber)),
      ]),
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
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          ListTile(leading: const Icon(Icons.language), title: Text(isArabic ? "اللغة" : "Language"), trailing: Text(isArabic ? "العربية" : "English"), onTap: onLangToggle),
          const Divider(height: 50),
          const Center(child: Text("Hamza Store - Version 3.5.0", style: TextStyle(color: Colors.white10))),
        ],
      ),
    );
  }
}
