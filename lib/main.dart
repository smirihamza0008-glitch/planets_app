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
      title: 'Planet Explorer',
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
    const Center(child: Text('Star Map Coming Soon 🔭', style: TextStyle(fontSize: 20, color: Colors.amber))),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomSheet: Container(
        height: 55,
        width: double.infinity,
        color: Colors.black,
        child: const Center(
          child: Text('AD SPACE (Google AdMob)', 
            style: TextStyle(color: Colors.white24, fontSize: 11, letterSpacing: 1.2)),
        ),
      ),
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
      'name': 'The Sun (الشمس)',
      'image': 'assets/images/sun.png',
      'color': Colors.orangeAccent,
      'tagline': 'قلب النظام الشمسي ونجم الحياة',
      'content': [
        {'title': '1. ماهية الشمس ونشأتها', 'body': 'الشمس نجم من النوع القزم الأصفر، تشكلت قبل 4.6 مليار سنة. تمثل كتلتها 99.8% من كتلة النظام الشمسي بالكامل، وجاذبيتها هي التي تربط الكواكب في مداراتها.', 'color': Colors.orange},
        {'title': '2. مفاعل نووي كوني', 'body': 'تنتج الشمس طاقتها من خلال الاندماج النووي، حيث تدمج ذرات الهيدروجين لتكوين الهيليوم في لبها، وتصل حرارة المركز إلى 15 مليون درجة مئوية.', 'color': Colors.redAccent},
        {'title': '3. الرياح الشمسية والبقع', 'body': 'تطلق الشمس تيارات من الجسيمات المشحونة تسمى الرياح الشمسية. وتظهر على سطحها بقع داكنة أبرد قليلاً تسمى البقع الشمسية، وهي مناطق نشاط مغناطيسي كثيف.', 'color': Colors.amberAccent},
        {'title': '4. مستقبل الشمس', 'body': 'بعد حوالي 5 مليارات سنة، ستتحول الشمس إلى عملاق أحمر يبتلع الكواكب الداخلية، قبل أن تنتهي كقزم أبيض هادئ.', 'color': Colors.deepOrange},
      ]
    },
    {
      'name': 'Mercury (عطارد)',
      'image': 'assets/images/mercury.png',
      'color': Colors.grey,
      'tagline': 'أصغر الكواكب وأقربها للشمس',
      'content': [
        {'title': '1. التكوين الجيولوجي', 'body': 'كوكب صخري صغير، نواته الحديدية ضخمة جداً مقارنة بحجمه. لا يمتلك أي أقمار أو غلاف جوي يحميه.', 'color': Colors.grey},
        {'title': '2. سنة قصيرة ويوم طويل', 'body': 'يدور عطارد حول الشمس بسرعة هائلة، فسنته 88 يوماً فقط، لكنه يدور حول نفسه ببطء، فيومه يعادل 59 يوماً أرضياً.', 'color': Colors.blueGrey},
      ]
    },
    {
      'name': 'Venus (الزهرة)',
      'image': 'assets/images/venus.png',
      'color': Colors.orange,
      'tagline': 'أحر كوكب في النظام الشمسي',
      'content': [
        {'title': '1. الاحتباس الحراري', 'body': 'غلافه الجوي كثيف جداً لدرجة أنه يحبس الحرارة، مما يجعل سطحه ساخناً لدرجة صهر الرصاص (470 درجة مئوية).', 'color': Colors.orange},
        {'title': '2. شروق من الغرب', 'body': 'يدور الزهرة عكس اتجاه معظم الكواكب، لذا تشرق الشمس فيه من الغرب وتغرب في الشرق.', 'color': Colors.redAccent},
      ]
    },
    {
      'name': 'Earth (الأرض)',
      'image': 'assets/images/earth.png',
      'color': Colors.blue,
      'tagline': 'الواحة الزرقاء الوحيدة',
      'content': [
        {'title': '1. بيئة مثالية', 'body': 'تمتلك الغلاف الجوي والماء السائل والمجال المغناطيسي، وهي العناصر الثلاثة الضرورية لنشوء واستمرار الحياة.', 'color': Colors.blue},
        {'title': '2. تكتونية الصفائح', 'body': 'الأرض هي الكوكب الوحيد الذي يمتلك صفائح تكتونية نشطة تعيد تدوير الكربون وتنظم المناخ عبر ملايين السنين.', 'color': Colors.greenAccent},
      ]
    },
    {
      'name': 'Mars (المريخ)',
      'image': 'assets/images/mars.png',
      'color': Colors.red,
      'tagline': 'الكوكب الأحمر المليء بالأسرار',
      'content': [
        {'title': '1. المناخ القديم', 'body': 'تشير الوديان الجافة إلى أن المريخ كان يوماً ما دافئاً ورطباً ببحيرات وأنهار جارية.', 'color': Colors.red},
        {'title': '2. جبال وأودية عملاقة', 'body': 'يحتوي على جبل أوليمبوس، أعلى قمة في النظام الشمسي، ووادي مارينر الذي لو كان على الأرض لغطى المسافة بين نيويورك ولوس أنجلوس.', 'color': Colors.orangeAccent},
      ]
    },
    {
      'name': 'Jupiter (المشتري)',
      'image': 'assets/images/jupiter.png',
      'color': Colors.orangeAccent,
      'tagline': 'سيد العمالقة وأسرع الكواكب دوراناً',
      'content': [
        {'title': '1. بنية كوكبية ضخمة', 'body': 'لو كان المشتري أكثر ضخامة بـ 80 مرة، لربما تحول إلى نجم. هو المكنسة الكهربائية للنظام الشمسي بسبب جاذبيته التي تبتلع المذنبات.', 'color': Colors.orange},
        {'title': '2. أقمار غاليليو', 'body': 'يمتلك أكثر من 90 قمراً، أشهرها "أوروبا" الذي يعتقد العلماء بوجود محيط مائي تحت قشرته الجليدية.', 'color': Colors.amber},
      ]
    },
    {
      'name': 'Saturn (زحل)',
      'image': 'assets/images/saturn.png',
      'color': Colors.amber,
      'tagline': 'الجمال الأخاذ بنظام حلقي فريد',
      'content': [
        {'title': '1. أصل الحلقات', 'body': 'يعتقد أن الحلقات هي بقايا أقمار أو مذنبات تحطمت بفعل جاذبية زحل قبل ملايين السنين.', 'color': Colors.amberAccent},
        {'title': '2. قمر تيتان', 'body': 'قمره تيتان هو الوحيد الذي يمتلك غلافاً جوياً كثيفاً وسحباً وأمطاراً من الميثان السائل.', 'color': Colors.yellowAccent},
      ]
    },
    {
      'name': 'Uranus (أورانوس)',
      'image': 'assets/images/uranus.png',
      'color': Colors.cyan,
      'tagline': 'العملاق الجليدي البارد',
      'content': [
        {'title': '1. المحور المائل', 'body': 'يميل أورانوس بزاوية 98 درجة، مما يجعله يبدو وكأنه يتدحرج في مداره بدلاً من الدوران العادي.', 'color': Colors.cyanAccent},
        {'title': '2. الألماس المطر', 'body': 'بسبب الضغط الهائل، يعتقد العلماء أن الميثان في أعماق أورانوس ونبتون قد يتحول إلى ألماس يتساقط كالمطر.', 'color': Colors.blueAccent},
      ]
    },
    {
      'name': 'Neptune (نبتون)',
      'image': 'assets/images/neptune.png',
      'color': Colors.blueAccent,
      'tagline': 'أبعد العوالم وأشدها رياحاً',
      'content': [
        {'title': '1. الرياح الفوق صوتية', 'body': 'تصل سرعة الرياح في نبتون إلى 2100 كم في الساعة، وهي أسرع رياح مسجلة في أي كوكب.', 'color': Colors.blue},
        {'title': '2. اكتشاف رياضي', 'body': 'نبتون هو الكوكب الوحيد الذي تم اكتشافه بالحسابات الرياضية قبل أن يُرى بالتلسكوب.', 'color': Colors.indigoAccent},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planet Explorer', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 80),
        itemCount: planets.length,
        itemBuilder: (context, index) {
          final planet = planets[index];
          return Card(
            elevation: 12,
            margin: const EdgeInsets.only(bottom: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PlanetDetailScreen(planet: planet))),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(colors: [const Color(0xFF0D1117), planet['color'].withOpacity(0.1)]),
                ),
                child: Row(
                  children: [
                    Hero(tag: planet['name'], child: Image.asset(planet['image'], width: 70)),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(planet['name'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: planet['color'])),
                          Text(planet['tagline'], style: const TextStyle(color: Colors.grey, fontSize: 12)),
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
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [BoxShadow(color: planet['color'].withOpacity(0.4), blurRadius: 100, spreadRadius: 5)]),
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
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.03),
                borderRadius: BorderRadius.circular(20),
                border: Border(left: BorderSide(color: item['color'], width: 6)),
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

  void _showAction(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          ListTile(
            leading: const Icon(Icons.language, color: Colors.blue),
            title: const Text('Language (اللغة)'),
            subtitle: const Text('العربية حالياً'),
            onTap: () => _showAction(context, 'Language', 'ستتوفر اللغات الإضافية في التحديث القادم!'),
          ),
          ListTile(
            leading: const Icon(Icons.notifications_active, color: Colors.green),
            title: const Text('Daily Facts Notification'),
            trailing: Switch(value: true, onChanged: (v) {}),
          ),
          ListTile(
            leading: const Icon(Icons.star, color: Colors.amber),
            title: const Text('Rate on Play Store'),
            onTap: () => _showAction(context, 'Rating', 'شكراً لدعمك! سيتم نقلك للمتجر عند النشر.'),
          ),
          const Divider(color: Colors.white10),
          ListTile(
            leading: const Icon(Icons.info_outline, color: Colors.grey),
            title: const Text('App Version'),
            trailing: const Text('1.0.2'),
          ),
          const SizedBox(height: 50),
          const Opacity(
            opacity: 0.3,
            child: Text('Developed for Science & Discovery', textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
