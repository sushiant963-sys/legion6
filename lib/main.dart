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
        primarySwatch: Colors.green,
        fontFamily: 'sans',
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f4ed),
      appBar: AppBar(
        backgroundColor: const Color(0xfff5f4ed),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          '🌹 لژیون ۶',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.campaign,
                    color: Colors.green,
                    size: 55,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'دستور جلسه بعدی',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'دستور جلسه این هفته به‌زودی اعلام می‌شود',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'امکانات لژیون',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 1,
              children: [
                MenuCard(
                  title: 'خواب من',
                  icon: Icons.nightlight_round,
                  onTap: () {},
                ),

                MenuCard(
                  title: 'برنامه دارویی',
                  icon: Icons.medication,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MedicationPage(),
                      ),
                    );
                  },
                ),

                MenuCard(
                  title: 'سی‌دی‌های من',
                  icon: Icons.menu_book,
                  onTap: () {},
                ),

                MenuCard(
                  title: 'استخر',
                  icon: Icons.pool,
                  onTap: () {},
                ),

                MenuCard(
                  title: 'پارک',
                  icon: Icons.park,
                  onTap: () {},
                ),

                MenuCard(
                  title: 'تقویم لژیون',
                  icon: Icons.calendar_month,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const MenuCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.green,
              size: 60,
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MedicationPage extends StatefulWidget {
  const MedicationPage({super.key});

  @override
  State<MedicationPage> createState() => _MedicationPageState();
}

class _MedicationPageState extends State<MedicationPage> {
  bool morningTaken = false;
  bool afternoonTaken = false;
  bool nightTaken = false;

  Widget medicationCard({
    required String title,
    required String time,
    required String amount,
    required bool taken,
    required ValueChanged<bool?> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          Checkbox(
            value: taken,
            activeColor: Colors.green,
            onChanged: onChanged,
          ),
          const SizedBox(width: 10),
          const Icon(
            Icons.medication,
            color: Colors.green,
            size: 38,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 7),
                Text('ساعت مصرف: $time'),
                Text('مقدار: $amount'),
              ],
            ),
          ),
          Icon(
            taken ? Icons.check_circle : Icons.radio_button_unchecked,
            color: taken ? Colors.green : Colors.grey,
            size: 30,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int completed = 0;

    if (morningTaken) completed++;
    if (afternoonTaken) completed++;
    if (nightTaken) completed++;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xfff5f4ed),
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            '💊 برنامه دارویی',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const Text(
                      'وضعیت مصرف امروز',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '$completed از ۳ نوبت انجام شده',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              medicationCard(
                title: 'نوبت اول',
                time: '۸:۰۰ صبح',
                amount: 'طبق دستور راهنما',
                taken: morningTaken,
                onChanged: (value) {
                  setState(() {
                    morningTaken = value ?? false;
                  });
                },
              ),

              medicationCard(
                title: 'نوبت دوم',
                time: '۱۴:۰۰',
                amount: 'طبق دستور راهنما',
                taken: afternoonTaken,
                onChanged: (value) {
                  setState(() {
                    afternoonTaken = value ?? false;
                  });
                },
              ),

              medicationCard(
                title: 'نوبت سوم',
                time: '۲۲:۰۰',
                amount: 'طبق دستور راهنما',
                taken: nightTaken,
                onChanged: (value) {
                  setState(() {
                    nightTaken = value ?? false;
                  });
                },
              ),

              const SizedBox(height: 10),

              const Text(
                '⚠️ ساعت و مقدار دارو در نسخه نهایی توسط راهنما تعیین می‌شود.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
