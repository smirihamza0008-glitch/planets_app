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
      title: 'موسوعة الكواكب الرقمية',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey,
        scaffoldBackgroundColor: const Color(0xFF0B0D17), // لون الفضاء الداكن
      ),
      home: const PlanetsListScreen(),
    );
  }
}

class PlanetsListScreen extends StatelessWidget {
  const PlanetsListScreen({super.key});

  final List<Map<String, dynamic>> planets = const [
    {
      'name': 'الأرض',
      'image': 'assets/images/earth.png',
      'intro': 'الكوكب المائي وموطن الحياة الوحيد المعروف.',
      'details': {
        'البيانات الرقمية': '• القطر: 12,742 كم\n• البعد عن الشمس: 149.6 مليون كم\n• حجم الكتلة: 5.97 × 10^24 كجم\n• مدة الدوران: 365.25 يوم',
        'نشأة الكوكب': 'تكونت الأرض قبل حوالي 4.54 مليار سنة من سديم شمسي دوار. أدت الاصطدامات المتكررة وتراكم المواد الصخرية إلى تكوين قشرتها الصلبة، بينما ساهمت الغازات البركانية في تكوين غلافها الجوي البدائي.',
        'الغلاف الجوي': 'يتكون من 78% نيتروجين و21% أكسجين، وهو درع يحمي الحياة من الإشعاعات الكونية والشهب.',
        'حقائق علمية': 'الأرض هي الكوكب الوحيد في النظام الشمسي الذي يحتوي على مياه سائلة على سطحه بشكل دائم.',
      }
    },
    {
      'name': 'المريخ',
      'image': 'assets/images/mars.png',
      'intro': 'الكوكب الأحمر الذي يحمل أسراراً عن تاريخ المياه في الكون.',
      'details': {
        'البيانات الرقمية': '• القطر: 6,779 كم\n• البعد عن الشمس: 227.9 مليون كم\n• حجم الكتلة: 0.107 من كتلة الأرض\n• الجاذبية: 3.71 م/ث²',
        'نشأة الكوكب': 'تكون المريخ منذ 4.6 مليار سنة. في بداياته، كان الكوكب يمتلك غلافاً جوياً سميكاً ومياهاً جارية، لكن فقدان مجاله المغناطيسي أدى إلى تآكل الغلاف الجوي بفعل الرياح الشمسية، ليتحول إلى صحراء باردة.',
        'السطح والتضاريس': 'يغطي سطحه غبار أكسيد الحديد (الصدأ). يحتوي على "وادي البحارة" وهو أضخم أخدود في النظام الشمسي بطول 4000 كم.',
        'حقائق مذهلة': 'يوم المريخ (سول) يقارب يوم الأرض بزيادة 40 دقيقة فقط، ويمتلك أكبر جبل بركاني معروف "أوليمبوس".',
      }
    },
    {
      'name': 'المشتري',
      'image': 'assets/images/jupiter.png',
      'intro': 'سيد الكواكب وعملاق الغاز الذي يحمي الأرض بجاذبيته.',
      'details': {
        'البيانات الرقمية': '• القطر: 139,820 كم\n• البعد عن الشمس: 778.5 مليون كم\n• حجم الكتلة: 318 ضعف كتلة الأرض\n• الأقمار: 79 قمراً معروفاً',
        'نشأة الكوكب': 'بدأ المشتري كقلب صخري ضخم جذب كميات هائلة من الهيدروجين والهيليوم من السديم الشمسي قبل أن تتبدد الغازات. تشكل في وقت مبكر جداً من تاريخ النظام الشمسي.',
        'التركيب الكيميائي': 'لا يمتلك سطحاً صلباً؛ إذا حاولت الوقوف عليه ستغوص في أعماق الغازات حتى تسحقك الضغوط الهائلة. يتكون معظمه من الهيدروجين السائل.',
        'البقعة الحمراء': 'إعصار ضخم مستمر منذ 300 عام على الأقل، وهو كبير لدرجة أنه يمكن أن يتسع لكوكبين بحجم الأرض.',
      }
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('موسوعة الفضاء الرقمية'), centerTitle: true),
      body: ListView.builder(
        itemCount: planets.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            color: const Color(0xFF1B1E2B),
            child: ListTile(
              leading: Image.asset(planets[index]['image'], width: 50),
              title: Text(planets[index]['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(planets[index]['intro']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlanetDetailScreen(planet: planets[index])),
                );
              },
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
    final details = planet['details'] as Map<String, String>;
    return Scaffold(
      appBar: AppBar(title: Text(planet['name'])),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(planet['image'], width: 200),
            const SizedBox(height: 20),
            ...details.entries.map((e) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(e.key, style: const TextStyle(fontSize: 22, color: Colors.orange, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(e.value, style: const TextStyle(fontSize: 16, height: 1.6)),
                const Divider(height: 40, color: Colors.white24),
              ],
            )).toList(),
          ],
        ),
      ),
    );
  }
}
