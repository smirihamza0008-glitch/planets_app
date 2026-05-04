import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

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
  ThemeMode _themeMode = ThemeMode.dark;

  void toggleLanguage() => setState(() => isArabic = !isArabic);
  void toggleTheme(bool isDark) => setState(() => _themeMode = isDark ? ThemeMode.dark : ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planet Explorer',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF010206),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF010206), elevation: 0),
      ),
      themeMode: _themeMode,
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
      if (mounted) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => 
          MainNavigation(isArabic: widget.isArabic, onLangToggle: widget.onLangToggle)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF010206),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.rocket_launch, size: 80, color: Colors.blueAccent),
            const SizedBox(height: 20),
            Text(widget.isArabic ? "مستكشف الكواكب" : "Planet Explorer", 
                 style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 30),
            const CircularProgressIndicator(color: Colors.blueAccent),
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
    final screens = [
      ExplorerScreen(isArabic: widget.isArabic),
      const Center(child: Icon(Icons.auto_awesome, size: 100, color: Colors.grey)),
      SettingsScreen(isArabic: widget.isArabic, onLangToggle: widget.onLangToggle),
    ];

    return Scaffold(
      body: screens[_index],
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: 55, color: Colors.black26, child: const Center(child: Text("AD BANNER SPACE"))),
          NavigationBar(
            selectedIndex: _index,
            onDestinationSelected: (i) => setState(() => _index = i),
            destinations: [
              NavigationDestination(icon: const Icon(Icons.public), label: widget.isArabic ? "المستكشف" : "Explorer"),
              NavigationDestination(icon: const Icon(Icons.explore), label: widget.isArabic ? "اكتشف" : "Discover"),
              NavigationDestination(icon: const Icon(Icons.settings), label: widget.isArabic ? "الإعدادات" : "Settings"),
            ],
          ),
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(title: Text(isArabic ? "الإعدادات" : "Settings")),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          ListTile(
            leading: const Icon(Icons.language, color: Colors.blue),
            title: Text(isArabic ? "لغة التطبيق" : "App Language"),
            trailing: Text(isArabic ? "العربية" : "English"),
            onTap: onLangToggle,
          ),
          SwitchListTile(
            secondary: const Icon(Icons.dark_mode, color: Colors.amber),
            title: Text(isArabic ? "الوضع الداكن" : "Dark Mode"),
            value: isDark,
            onChanged: (v) => context.findAncestorStateOfType<_PlanetsAppState>()?.toggleTheme(v),
          ),
          ListTile(
            leading: const Icon(Icons.star, color: Colors.orange),
            title: Text(isArabic ? "تقييم التطبيق" : "Rate App"),
            onTap: () async => await launchUrl(Uri.parse("https://play.google.com/store/apps/details?id=com.hamzastore.planetexplorer")),
          ),
        ],
      ),
    );
  }
}

class ExplorerScreen extends StatelessWidget {
  final bool isArabic;
  const ExplorerScreen({super.key, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    final planets = AppData.getPlanets(isArabic);
    return Scaffold(
      appBar: AppBar(title: Text(isArabic ? "النظام الشمسي" : "Solar System")),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: planets.length,
        itemBuilder: (context, i) {
          final p = planets[i];
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailsScreen(planet: p, isArabic: isArabic))),
            child: Container(
              height: 150,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(colors: [p['color'].withOpacity(0.5), Colors.black]),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: isArabic ? 20 : null,
                    right: isArabic ? null : 20,
                    top: 20,
                    child: Hero(tag: p['name'], child: Image.asset(p['image'], width: 110)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: isArabic ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(p['name'], style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                        Text(isArabic ? "عرض التفاصيل ➔" : "View Details ➔", style: const TextStyle(color: Colors.white70)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final Map<String, dynamic> planet;
  final bool isArabic;
  const DetailsScreen({super.key, required this.planet, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    final info = Map<String, String>.from(planet['info']);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(gradient: LinearGradient(colors: [planet['color'], Colors.black], begin: Alignment.topCenter)),
                child: Center(child: Hero(tag: planet['name'], child: Image.asset(planet['image'], width: 180))),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: isArabic ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(planet['name'], style: const TextStyle(fontSize: 38, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(planet['description'], textAlign: isArabic ? TextAlign.right : TextAlign.left, style: const TextStyle(fontSize: 17, color: Colors.white70)),
                  const Divider(height: 40, color: Colors.white24),
                  ...info.entries.map((e) => Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.06), borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.white10)),
                    child: Column(
                      crossAxisAlignment: isArabic ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      children: [
                        Text(e.key, style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 15)),
                        const SizedBox(height: 5),
                        Text(e.value, textAlign: isArabic ? TextAlign.right : TextAlign.left, style: const TextStyle(color: Colors.white, fontSize: 16)),
                      ],
                    ),
                  )).toList(),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AppData {
  static List<Map<String, dynamic>> getPlanets(bool isArabic) {
    if (isArabic) {
      return [
        {
          "name": "الشمس",
          "image": "assets/images/sun.png",
          "color": Colors.orange,
          "description": "النجم المركزي الذي يمد كوكبنا بالضوء والحرارة اللازمين للحياة ☀️",
          "info": {
            "📌 نبذة عامة": "نجم من نوع القزم الأصفر يقع في قلب نظامنا 🌟",
            "📏 الحجم والقطر": "قطرها 1.39 مليون كم، أي 109 أضعاف قطر الأرض 📏",
            "⚖️ الكتلة والجاذبية": "كتلتها 1.98 × 10³⁰ كجم، وجاذبيتها 274 m/s² ⚓",
            "🌡️ درجة الحرارة": "تصل في المركز إلى 15 مليون درجة مئوية 🔥",
            "🌍 الغلاف الجوي": "يتكون من الغلاف الضوئي، الملون، والإكليل الشمسي ☁️",
            "🧱 التركيب": "تتكون بشكل رئيسي من الهيدروجين والهيليوم 🧪",
            "🔄 يومها": "تدور حول نفسها كل 25 إلى 35 يوماً أرضياً 🔄",
            "☀️ سنتها": "تستغرق 230 مليون سنة للدوران حول مركز المجرة 🌌",
            "🌙 عدد الأقمار": "تتبعها جميع الكواكب والأجرام في النظام الشمسي 🚫",
            "💍 الحلقات": "لا تمتلك حلقات، بل هالة ضوئية عملاقة 💍",
            "📍 الموقع": "تقع في مركز النظام الشمسي تماماً 📍",
            "🔭 الرؤية": "الجرم الأشد سطوعاً في سماء الأرض نهاراً 🔭",
            "🚀 استكشاف": "مهمات باركر الشمسي ومرصد SOHO الفضائي 🚀",
            "⚠️ حقائق مدهشة": "تحتوي الشمس على 99.8% من إجمالي كتلة النظام الشمسي ⚠️"
          }
        },
        {
          "name": "عطارد",
          "image": "assets/images/mercury.png",
          "color": Colors.grey,
          "description": "أقرب الكواكب إلى الشمس وأصغرها حجماً في المجموعة 🌑",
          "info": {
            "📌 نبذة عامة": "كوكب صخري صغير يشبه القمر في كثرة فوهاته 🌑",
            "📏 الحجم والقطر": "قطره 4,879 كم، أي حوالي 38% من حجم الأرض 📏",
            "⚖️ الكتلة والجاذبية": "كتلته 3.28 × 10²³ كجم، وجاذبيتها 3.7 m/s² ⚓",
            "🌡️ درجة الحرارة": "تتراوح بين 430 درجة نهاراً و -180 درجة ليلاً 🌡️",
            "🌍 الغلاف الجوي": "رقيق جداً لدرجة أنه يعتبر غلافاً خارجياً (Exosphere) ☁️",
            "🧱 التركيب": "كوكب صخري بقلب حديدي ضخم يشكل معظم حجمه 🧱",
            "🔄 يومه": "يستغرق الدوران حول نفسه 59 يوماً من أيام الأرض ⏱️",
            "☀️ سنته": "يدور حول الشمس بسرعة كبيرة كل 88 يوماً فقط 🗓️",
            "🌙 عدد الأقمار": "لا يمتلك أي أقمار طبيعية تابعة له 🚫",
            "💍 الحلقات": "كوكب صخري صلب لا يمتلك أي حلقات 💍",
            "📍 الموقع": "الكوكب الأول والاقرب إلى الشمس 📍",
            "🔭 الرؤية": "يمكن رؤيته بالعين المجردة قريباً من الأفق وقت الفجر 🔭",
            "🚀 استكشاف": "تم استكشافه بواسطة مهمتي مارينر 10 ومسنجر 🚀",
            "⚠️ حقائق مدهشة": "عطارد يتقلص ببطء بسبب تبريد لبه الحديدي ⚠️"
          }
        },
        {
          "name": "الزهرة",
          "image": "assets/images/venus.png",
          "color": Colors.amber,
          "description": "توأم الأرض في الحجم، لكنه يتمتع ببيئة بركانية قاسية جداً 🌋",
          "info": {
            "📌 نبذة عامة": "أسخن كوكب في المجموعة بسبب الاحتباس الحراري 🌋",
            "📏 الحجم والقطر": "قطره 12,104 كم، وهو قريب جداً من حجم كوكبنا 📏",
            "⚖️ الكتلة والجاذبية": "كتلته 4.86 × 10²⁴ كجم، وجاذبيتها 8.87 m/s² ⚓",
            "🌡️ درجة الحرارة": "تصل إلى 462 درجة مئوية، وهي كافية لصهر الرصاص 🔥",
            "🌍 الغلاف الجوي": "كثيف جداً وثقيل يتكون من ثاني أكسيد الكربون ☁️",
            "🧱 التركيب": "كوكب صخري بقلب حديدي وسطح مليء بالبراكين 🧱",
            "🔄 يومه": "يومه طويل جداً (243 يوماً)، وهو أطول من سنته ⏱️",
            "☀️ سنته": "يستغرق 225 يوماً أرضياً للدوران حول الشمس 🗓️",
            "🌙 عدد الأقمار": "كوكب وحيد لا يمتلك أي أقمار تدور حوله 🚫",
            "💍 الحلقات": "لا يمتلك حلقات، بل غيوم كثيفة من حمض الكبريتيك 💍",
            "📍 الموقع": "الكوكب الثاني في الترتيب من حيث البعد عن الشمس 📍",
            "🔭 الرؤية": "ألمع جرم في السماء ليلاً بعد القمر (نجمة الصباح) 🔭",
            "🚀 استكشاف": "مهمات فينيرا السوفيتية وماجلان التابعة لناسا 🚀",
            "⚠️ حقائق مدهشة": "يدور الزهرة حول نفسه من الشرق إلى الغرب (عكس الأرض) ⚠️"
          }
        },
        {
          "name": "الأرض",
          "image": "assets/images/earth.png",
          "color": Colors.blue,
          "description": "موطننا والكوكب الوحيد المعروف حتى الآن الذي تتوفر فيه مقومات الحياة 🌍",
          "info": {
            "📌 نبذة عامة": "كوكب مائي صخري يتميز بوجود الأكسجين والماء السائل 🌿",
            "📏 الحجم والقطر": "القطر الاستوائي يبلغ 12,756 كم 📏",
            "⚖️ الكتلة والجاذبية": "الكتلة: 5.97 × 10²⁴ كجم | الجاذبية: 9.8 m/s² ⚓",
            "🌡️ درجة الحرارة": "المتوسط العام حوالي 15 درجة مئوية 🌡️",
            "🌍 الغلاف الجوي": "يتكون من 78% نيتروجين و21% أكسجين وهو درع حمايتنا ☁️",
            "🧱 التركيب": "كوكب صخري يتكون من قشرة، وشاح، ولب معدني 🧱",
            "🔄 يومها": "تستغرق الأرض 23 ساعة و56 دقيقة للدوران حول نفسها ⏱️",
            "☀️ سنتها": "تستغرق 365.25 يوماً للدوران دورة كاملة حول الشمس 🗓️",
            "🌙 عدد الأقمار": "تملك قمراً واحداً كبيراً يؤثر على ظاهرة المد والجزر 🌙",
            "💍 الحلقات": "لا تمتلك الأرض حلقات غبارية كالكواكب الخارجية 💍",
            "📍 الموقع": "الكوكب الثالث في النظام الشمسي (المنطقة الصالحة للحياة) 📍",
            "🔭 الرؤية": "تبدو ككرة زرقاء متلألئة من الفضاء الخارجي 🔭",
            "🚀 استكشاف": "تم استكشافها بالكامل بواسطة آلاف الأقمار الصناعية 🚀",
            "⚠️ حقائق مدهشة": "الأرض هي الكوكب الوحيد الذي لم يسمى تيمناً بآلهة قديمة ⚠️"
          }
        },
        {
          "name": "المريخ",
          "image": "assets/images/mars.png",
          "color": Colors.red,
          "description": "الكوكب الأحمر الذي يمثل الوجهة القادمة للبشرية في الفضاء 🔴",
          "info": {
            "📌 نبذة عامة": "كوكب صخري بارد يتميز بلونه الأحمر الناتج عن أكسيد الحديد 🔴",
            "📏 الحجم والقطر": "قطره 6,779 كم، وهو نصف حجم الأرض تقريباً 📏",
            "⚖️ الكتلة والجاذبية": "الكتلة: 6.39 × 10²³ كجم | الجاذبية: 3.72 m/s² ⚓",
            "🌡️ درجة الحرارة": "بارد جداً بمتوسط -62 درجة مئوية 🌡️",
            "🌍 الغلاف الجوي": "رقيق جداً ويتكون بنسبة 95% من ثاني أكسيد الكربون ☁️",
            "🧱 التركيب": "صخري مع قلب من الحديد والكبريت وقشرة سيليكات 🧱",
            "🔄 يومه": "يستغرق 24 ساعة و37 دقيقة (يسمى 'سول') ⏱️",
            "☀️ سنته": "طويلة جداً وتستغرق 687 يوماً أرضياً 🗓️",
            "🌙 عدد الأقمار": "يملك قمرين صغيرين: فوبوس وديموس 🌙",
            "💍 الحلقات": "لا يمتلك حلقات حالياً (لكن قد يحصل عليها مستقبلاً) 💍",
            "📍 الموقع": "الكوكب الرابع والحد الخارجي للكواكب الصخرية 📍",
            "🔭 الرؤية": "يظهر في السماء كنجم أحمر ساطع يمكن رؤيته بوضوح 🔭",
            "🚀 استكشاف": "مهمات عديدة مثل بيرسيفيرانس وكوريوسيتي ومسبار الأمل 🚀",
            "⚠️ حقائق مدهشة": "يحتوي على جبل أوليمبوس، وهو أكبر بركان في المجموعة الشمسية ⚠️"
          }
        },
        {
          "name": "المشتري",
          "image": "assets/images/jupiter.png",
          "color": Colors.brown,
          "description": "ملك الكواكب، العملاق الغازي الذي يفوق حجمه كل الكواكب مجتمعة 🟠",
          "info": {
            "📌 نبذة عامة": "أكبر كوكب في نظامنا وهو عبارة عن كرة غازية ضخمة 🟠",
            "📏 الحجم والقطر": "قطره الهائل يبلغ 139,820 كم 📏",
            "⚖️ الكتلة والجاذبية": "الكتلة: 1.89 × 10²⁷ كجم | الجاذبية: 24.79 m/s² ⚓",
            "🌡️ درجة الحرارة": "-110 درجة مئوية في السحب العلوية 🌡️",
            "🌍 الغلاف الجوي": "سميك جداً من الهيدروجين والهيليوم مع عواصف عنيفة ☁️",
            "🧱 التركيب": "عملاق غازي يتكثف غازه ليصبح سائلاً في الأعماق 🧱",
            "🔄 يومه": "سريع جداً، يستغرق أقل من 10 ساعات للدوران حول نفسه ⏱️",
            "☀️ سنته": "بطيئة وتستغرق 11.8 سنة أرضية لإكمال دورة حول الشمس 🗓️",
            "🌙 عدد الأقمار": "يملك 95 قمراً مؤكداً، أشهرها 'أقمار جاليليو' الأربعة 🌙",
            "💍 الحلقات": "يمتلك نظام حلقات خافت جداً وغباري 💍",
            "📍 الموقع": "الكوكب الخامس وأول الكواكب الخارجية الغازية 📍",
            "🔭 الرؤية": "رابع ألمع جسم في السماء، يسهل رصده جداً 🔭",
            "🚀 استكشاف": "مهمات فوييجر، جاليليو، ومهمة جونو الحالية 🚀",
            "⚠️ حقائق مدهشة": "بقعته الحمراء العظيمة هي عاصفة مستمرة منذ 300 عام ⚠️"
          }
        },
        {
          "name": "زحل",
          "image": "assets/images/saturn.png",
          "color": Colors.orangeAccent,
          "description": "جوهرة النظام الشمسي المزدانة بنظام حلقات مذهل وفريد 🪐",
          "info": {
            "📌 نبذة عامة": "عملاق غازي يشتهر بحلقاته الجليدية الضخمة والواضحة 🪐",
            "📏 الحجم والقطر": "القطر الاستوائي يبلغ 116,460 كم 📏",
            "⚖️ الكتلة والجاذبية": "الكتلة: 5.68 × 10²٦ كجم | الجاذبية: 10.44 m/s² ⚓",
            "🌡️ درجة الحرارة": "متوسط درجة الحرارة يبلغ -140 درجة مئوية 🌡️",
            "🌍 الغلاف الجوي": "يتكون أساساً من الهيدروجين والهيليوم مع سحب غازية ☁️",
            "🧱 التركيب": "عملاق غازي (كثافته أقل من الماء، يمكنه الطفو فوقه!) 🧱",
            "🔄 يومه": "يدور حول نفسه بسرعة كبيرة كل 10.7 ساعة فقط ⏱️",
            "☀️ سنته": "يستغرق 29.4 سنة أرضية لإكمال دورة حول الشمس 🗓️",
            "🌙 عدد الأقمار": "يملك 146 قمراً، أكبرها 'تيتان' الذي يملك غلافاً جوياً 🌙",
            "💍 الحلقات": "يمتلك 7 حلقات رئيسية تتكون من مليارات قطع الجليد والغبار 💍",
            "📍 الموقع": "الكوكب السادس من حيث البعد عن الشمس 📍",
            "🔭 الرؤية": "يمكن رؤيته بالعين، لكن حلقاته تحتاج تلسكوباً لرؤيتها 🔭",
            "🚀 استكشاف": "مهمات فوييجر، ومهمة كاسيني-هويغنز التاريخية 🚀",
            "⚠️ حقائق مدهشة": "حلقات زحل واسعة جداً لكن سمكها لا يتجاوز 10 أمتار! ⚠️"
          }
        },
        {
          "name": "أورانوس",
          "image": "assets/images/uranus.png",
          "color": Colors.cyan,
          "description": "العملاق الجليدي البارد الذي يدور حول الشمس على جانبه 💎",
          "info": {
            "📌 نبذة عامة": "كوكب يتميز بلونه الأزرق المخضر الناتج عن غاز الميثان 💎",
            "📏 الحجم والقطر": "قطره يبلغ 50,724 كم (أربعة أضعاف حجم الأرض) 📏",
            "⚖️ الكتلة والجاذبية": "الكتلة: 8.68 × 10²٥ كجم | الجاذبية: 8.69 m/s² ⚓",
            "🌡️ درجة الحرارة": "أبرد كوكب في المجموعة بمتوسط -195 درجة مئوية 🌡️",
            "🌍 الغلاف الجوي": "يحتوي على الهيدروجين والهيليوم ونسبة عالية من الميثان ☁️",
            "🧱 التركيب": "عملاق جليدي يتكون من سوائل ساخنة وكثيفة من مواد متجمدة 🧱",
            "🔄 يومه": "يستغرق الدوران حول نفسه 17.2 ساعة أرضية ⏱️",
            "☀️ سنته": "بطيء جداً، يستغرق 84 سنة أرضية لإكمال مدار واحد 🗓️",
            "🌙 عدد الأقمار": "يملك 27 قمراً معروفاً سميت تيمناً بشخصيات أدبية 🌙",
            "💍 الحلقات": "يملك 13 حلقة خافتة وداكنة تحيط به عمودياً 💍",
            "📍 الموقع": "الكوكب السابع في الترتيب بعد زحل 📍",
            "🔭 الرؤية": "صعب الرؤية بالعين المجردة ويحتاج لمنظار أو تلسكوب 🔭",
            "🚀 استكشاف": "المركبة الوحيدة التي زارته هي فوييجر 2 عام 1986 🚀",
            "⚠️ حقائق مدهشة": "أورانوس يدور على جانبه (ميلان محوره 98 درجة) كأنه يتدحرج! ⚠️"
          }
        },
        {
          "name": "نبتون",
          "image": "assets/images/neptune.png",
          "color": Colors.blueAccent,
          "description": "الكوكب الأزرق العملاق، موطن الرياح الأسرع في النظام الشمسي 🌀",
          "info": {
            "📌 نبذة عامة": "عملاق جليدي بعيد يتميز بلونه الأزرق الداكن الخلاب 🌀",
            "📏 الحجم والقطر": "قطره يبلغ 49,244 كم (أصغر قليلاً من أورانوس) 📏",
            "⚖️ الكتلة والجاذبية": "الكتلة: 1.02 × 10²٦ كجم | الجاذبية: 11.15 m/s² ⚓",
            "🌡️ درجة الحرارة": "متوسط الحرارة حوالي -201 درجة مئوية 🌡️",
            "🌍 الغلاف الجوي": "هيدروجين وهليوم وميثان، مع سحب من أمونيا متجمدة ☁️",
            "🧱 التركيب": "يتكون من ماء وميثان وأمونيا متجمدة فوق لب صخري 🧱",
            "🔄 يومه": "يدور حول نفسه كل 16.1 ساعة أرضية ⏱️",
            "☀️ سنته": "يستغرق 165 سنة أرضية لإكمال دورة واحدة حول الشمس 🗓️",
            "🌙 عدد الأقمار": "يملك 14 قمراً معروفاً، أكبرها 'تريتون' الذي يدور عكسياً 🌙",
            "💍 الحلقات": "يملك 5 حلقات رئيسية وعدد من الأقواس الحلقية الغبارية 💍",
            "📍 الموقع": "الكوكب الثامن والأخير في الترتيب الرسمي للكواكب 📍",
            "🔭 الرؤية": "لا يمكن رؤيته بالعين المجردة، يحتاج تلسكوباً قوياً 🔭",
            "🚀 استكشاف": "زارته مركبة فوييجر 2 فقط في عام 1989 🚀",
            "⚠️ حقائق مدهشة": "الرياح على نبتون تتجاوز سرعتها 2,100 كم في الساعة! ⚠️",
            "🌌 الميزة": "نبتون هو الكوكب الوحيد الذي تم اكتشافه بالحسابات الرياضية 🌌"
          }
        }
      ];
    } else {
      return [
        {
          "name": "The Sun",
          "image": "assets/images/sun.png",
          "color": Colors.orange,
          "description": "The central star that provides our planet with light and heat ☀️",
          "info": {
            "📌 Overview": "A yellow dwarf star at the heart of our solar system 🌟",
            "📏 Size/Diameter": "1.39 million km, 109 times Earth's diameter 📏",
            "⚖️ Mass/Gravity": "Mass: 1.98 × 10³⁰ kg | Gravity: 274 m/s² ⚓",
            "🌡️ Temperature": "Reaches 15 million degrees Celsius at the core 🔥",
            "🌍 Atmosphere": "Composed of photosphere, chromosphere, and corona ☁️",
            "🧱 Composition": "Mainly hydrogen and helium 🧪",
            "🔄 Day": "Rotates every 25 to 35 Earth days 🔄",
            "☀️ Year": "Takes 230 million years to orbit the galaxy 🌌",
            "🌙 Moons": "Governs all objects in the solar system 🚫",
            "💍 Rings": "No rings, but a massive luminous corona 💍",
            "📍 Location": "Center of the solar system 📍",
            "🔭 Visibility": "The brightest object in our daytime sky 🔭",
            "🚀 Exploration": "Parker Solar Probe and SOHO 🚀",
            "⚠️ Fun Fact": "Contains 99.8% of the solar system's total mass ⚠️"
          }
        },
        {
          "name": "Mercury",
          "image": "assets/images/mercury.png",
          "color": Colors.grey,
          "description": "The closest and smallest planet to the Sun 🌑",
          "info": {
            "📌 Overview": "Small rocky planet with many craters 🌑",
            "📏 Size/Diameter": "4,879 km diameter, 38% of Earth's size 📏",
            "⚖️ Mass/Gravity": "Mass: 3.28 × 10²³ kg | Gravity: 3.7 m/s² ⚓",
            "🌡️ Temperature": "430°C by day to -180°C by night 🌡️",
            "🌍 Atmosphere": "Very thin, essentially an exosphere ☁️",
            "🧱 Composition": "Rocky with a huge iron core 🧱",
            "🔄 Day": "Takes 59 Earth days to rotate ⏱️",
            "☀️ Year": "Orbits the Sun every 88 Earth days 🗓️",
            "🌙 Moons": "No natural moons 🚫",
            "💍 Rings": "No ring systems 💍",
            "📍 Location": "First planet from the Sun 📍",
            "🔭 Visibility": "Visible to the eye near the horizon at dawn 🔭",
            "🚀 Exploration": "Mariner 10 and MESSENGER 🚀",
            "⚠️ Fun Fact": "Mercury is slowly shrinking ⚠️"
          }
        },
        {
          "name": "Venus",
          "image": "assets/images/venus.png",
          "color": Colors.amber,
          "description": "Earth's twin in size with a harsh volcanic environment 🌋",
          "info": {
            "📌 Overview": "The hottest planet due to the greenhouse effect 🌋",
            "📏 Size/Diameter": "12,104 km in diameter 📏",
            "⚖️ Mass/Gravity": "Mass: 4.86 × 10²⁴ kg | Gravity: 8.87 m/s² ⚓",
            "🌡️ Temperature": "Reaches 462°C, melts lead 🔥",
            "🌍 Atmosphere": "Thick, heavy, mostly CO2 ☁️",
            "🧱 Composition": "Rocky with many volcanoes 🧱",
            "🔄 Day": "Takes 243 Earth days to rotate ⏱️",
            "☀️ Year": "Orbits every 225 Earth days 🗓️",
            "🌙 Moons": "No moons 🚫",
            "💍 Rings": "No rings, just sulfuric acid clouds 💍",
            "📍 Location": "Second planet from the Sun 📍",
            "🔭 Visibility": "Brightest object after the Moon 🔭",
            "🚀 Exploration": "Venera and Magellan missions 🚀",
            "⚠️ Fun Fact": "Rotates backwards (East to West) ⚠️"
          }
        },
        {
          "name": "Earth",
          "image": "assets/images/earth.png",
          "color": Colors.blue,
          "description": "The only known planet to support life 🌍",
          "info": {
            "📌 Overview": "Terrestrial planet with liquid water 🌿",
            "📏 Size/Diameter": "12,756 km in diameter 📏",
            "⚖️ Mass/Gravity": "Mass: 5.97 × 10²⁴ kg | Gravity: 9.8 m/s² ⚓",
            "🌡️ Temperature": "Global average 15°C 🌡️",
            "🌍 Atmosphere": "78% Nitrogen, 21% Oxygen ☁️",
            "🧱 Composition": "Crust, mantle, and metallic core 🧱",
            "🔄 Day": "23 hours and 56 minutes ⏱️",
            "☀️ Year": "365.25 days 🗓️",
            "🌙 Moons": "One large moon 🌙",
            "💍 Rings": "No ring systems 💍",
            "📍 Location": "Third planet from the Sun 📍",
            "🔭 Visibility": "Appears as a blue marble from space 🔭",
            "🚀 Exploration": "Explored by thousands of satellites 🚀",
            "⚠️ Fun Fact": "Only planet not named after a deity ⚠️"
          }
        },
        {
          "name": "Mars",
          "image": "assets/images/mars.png",
          "color": Colors.red,
          "description": "The Red Planet, humanity's next frontier 🔴",
          "info": {
            "📌 Overview": "Cold rocky planet colored by iron oxide 🔴",
            "📏 Size/Diameter": "6,779 km diameter 📏",
            "⚖️ Mass/Gravity": "Mass: 6.39 × 10²³ kg | Gravity: 3.72 m/s² ⚓",
            "🌡️ Temperature": "Average -62°C 🌡️",
            "🌍 Atmosphere": "Thin, 95% CO2 ☁️",
            "🧱 Composition": "Rocky with an iron-sulfur core 🧱",
            "🔄 Day": "24 hours and 37 minutes (Sol) ⏱️",
            "☀️ Year": "687 Earth days 🗓️",
            "🌙 Moons": "Phobos and Deimos 🌙",
            "💍 Rings": "No rings (yet) 💍",
            "📍 Location": "Fourth planet from the Sun 📍",
            "🔭 Visibility": "Appears as a bright red star 🔭",
            "🚀 Exploration": "Perseverance, Curiosity, and Hope 🚀",
            "⚠️ Fun Fact": "Home to the largest volcano, Olympus Mons ⚠️"
          }
        },
        {
          "name": "Jupiter",
          "image": "assets/images/jupiter.png",
          "color": Colors.brown,
          "description": "The largest gas giant in the solar system 🟠",
          "info": {
            "📌 Overview": "A massive ball of gas 🟠",
            "📏 Size/Diameter": "139,820 km in diameter 📏",
            "⚖️ Mass/Gravity": "Mass: 1.89 × 10²⁷ kg | Gravity: 24.79 m/s² ⚓",
            "🌡️ Temperature": "-110°C in upper clouds 🌡️",
            "🌍 Atmosphere": "Hydrogen and helium with violent storms ☁️",
            "🧱 Composition": "Gas giant with a liquid interior 🧱",
            "🔄 Day": "Rotates in less than 10 hours ⏱️",
            "☀️ Year": "11.8 Earth years 🗓️",
            "🌙 Moons": "95 moons, including the Galilean moons 🌙",
            "💍 Rings": "Very faint dust rings 💍",
            "📍 Location": "Fifth planet from the Sun 📍",
            "🔭 Visibility": "Easily spotted, very bright 🔭",
            "🚀 Exploration": "Voyager, Galileo, and Juno 🚀",
            "⚠️ Fun Fact": "The Great Red Spot is a 300-year-old storm ⚠️"
          }
        },
        {
          "name": "Saturn",
          "image": "assets/images/saturn.png",
          "color": Colors.orangeAccent,
          "description": "Gas giant with a spectacular ring system 🪐",
          "info": {
            "📌 Overview": "Famous for its massive icy rings 🪐",
            "📏 Size/Diameter": "116,460 km in diameter 📏",
            "⚖️ Mass/Gravity": "Mass: 5.68 × 10²٦ kg | Gravity: 10.44 m/s² ⚓",
            "🌡️ Temperature": "Average -140°C 🌡️",
            "🌍 Atmosphere": "Hydrogen and helium ☁️",
            "🧱 Composition": "Less dense than water 🧱",
            "🔄 Day": "10.7 hours ⏱️",
            "☀️ Year": "29.4 Earth years 🗓️",
            "🌙 Moons": "146 moons, including Titan 🌙",
            "💍 Rings": "7 main rings made of ice and dust 💍",
            "📍 Location": "Sixth planet from the Sun 📍",
            "🔭 Visibility": "Visible, but rings need a telescope 🔭",
            "🚀 Exploration": "Voyager and Cassini-Huygens 🚀",
            "⚠️ Fun Fact": "Rings are vast but only 10 meters thick ⚠️"
          }
        },
        {
          "name": "Uranus",
          "image": "assets/images/uranus.png",
          "color": Colors.cyan,
          "description": "The cold ice giant that orbits on its side 💎",
          "info": {
            "📌 Overview": "Blue-green color from methane gas 💎",
            "📏 Size/Diameter": "50,724 km diameter 📏",
            "⚖️ Mass/Gravity": "Mass: 8.68 × 10²٥ kg | Gravity: 8.69 m/s² ⚓",
            "🌡️ Temperature": "Coldest planet, average -195°C 🌡️",
            "🌍 Atmosphere": "Hydrogen, helium, and methane ☁️",
            "🧱 Composition": "Hot, dense icy materials 🧱",
            "🔄 Day": "17.2 Earth hours ⏱️",
            "☀️ Year": "84 Earth years 🗓️",
            "🌙 Moons": "27 moons named after literature 🌙",
            "💍 Rings": "13 faint vertical rings 💍",
            "📍 Location": "Seventh planet from the Sun 📍",
            "🔭 Visibility": "Needs binoculars to see 🔭",
            "🚀 Exploration": "Visited by Voyager 2 in 1986 🚀",
            "⚠️ Fun Fact": "Orbits on its side at a 98-degree tilt ⚠️"
          }
        },
        {
          "name": "Neptune",
          "image": "assets/images/neptune.png",
          "color": Colors.blueAccent,
          "description": "Giant blue planet with the fastest winds 🌀",
          "info": {
            "📌 Overview": "Distant ice giant with a deep blue color 🌀",
            "📏 Size/Diameter": "49,244 km diameter 📏",
            "⚖️ Mass/Gravity": "Mass: 1.02 × 10²٦ kg | Gravity: 11.15 m/s² ⚓",
            "🌡️ Temperature": "Average -201°C 🌡️",
            "🌍 Atmosphere": "Hydrogen, helium, and methane ☁️",
            "🧱 Composition": "Water, methane, and ammonia ice 🧱",
            "🔄 Day": "16.1 Earth hours ⏱️",
            "☀️ Year": "165 Earth years 🗓️",
            "🌙 Moons": "14 moons, including Triton 🌙",
            "💍 Rings": "5 main rings 💍",
            "📍 Location": "Eighth planet from the Sun 📍",
            "🔭 Visibility": "Requires a powerful telescope 🔭",
            "🚀 Exploration": "Visited by Voyager 2 in 1989 🚀",
            "⚠️ Fun Fact": "Winds exceed 2,100 km per hour ⚠️"
          }
        }
      ];
    }
  }
}
