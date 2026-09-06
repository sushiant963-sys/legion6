import 'package:flutter/material.dart';

void main() {
  runApp(const Legion6App());
}

class Legion6App extends StatelessWidget {
  const Legion6App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'لژیون ۶',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> items = const [
    {
      'title': 'خواب من',
      'icon': Icons.bedtime,
      'description': 'ثبت و مشاهده وضعیت خواب',
    },
    {
      'title': 'برنامه دارویی',
      'icon': Icons.medication,
      'description': 'مشاهده برنامه مصرف دارو',
    },
    {
      'title': 'سی‌دی‌های من',
      'icon': Icons.menu_book,
      'description': 'پیگیری سی‌دی‌های آموزشی',
    },
    {
      'title': 'استخر',
      'icon': Icons.pool,
      'description': 'برنامه استخر لژیون',
    },
    {
      'title': 'پارک',
      'icon': Icons.park,
      'description': 'برنامه پارک و مسئولیت‌ها',
    },
    {
      'title': 'تقویم لژیون',
      'icon': Icons.calendar_month,
      'description': 'مشاهده برنامه‌های لژیون',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            '🌹 لژیون ۶',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Icon(
                      Icons.campaign,
                      size: 45,
                      color: Colors.green,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'دستور جلسه بعدی',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'دستور جلسه این هفته به‌زودی اعلام می‌شود',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'امکانات لژیون',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.05,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                final item = items[index];

                return Card(
                  elevation: 2,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FeaturePage(
                            title: item['title'],
                            icon: item['icon'],
                            description: item['description'],
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            item['icon'],
                            size: 42,
                            color: Colors.green,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item['title'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FeaturePage extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;

  const FeaturePage({
    super.key,
    required this.title,
    required this.icon,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 80,
                  color: Colors.green,
                ),
                const SizedBox(height: 20),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 17),
                ),
                const SizedBox(height: 30),
                const Text(
                  'این بخش در حال آماده‌سازی است 🌹',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
