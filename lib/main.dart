import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';

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
        centerTitle: true,
        title: const Text(
          '🌹 لژیون ۶',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            const Card(
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(20),

                child: Column(
                  children: [

                    Icon(
                      Icons.campaign,
                      size: 45,
                      color: Colors.green,
                    ),

                    SizedBox(height: 10),

                    Text(
                      'دستور جلسه بعدی',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      'دستور جلسه این هفته به‌زودی اعلام می‌شود',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Align(
              alignment: Alignment.centerRight,

              child: Text(
                'امکانات لژیون',

                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            GridView.count(
              crossAxisCount: 2,

              shrinkWrap: true,

              physics:
                  const NeverScrollableScrollPhysics(),

              crossAxisSpacing: 12,
              mainAxisSpacing: 12,

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
                        builder: (_) =>
                            const MedicationPage(),
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
    return Card(
      elevation: 2,

      child: InkWell(
        borderRadius: BorderRadius.circular(12),

        onTap: onTap,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Icon(
              icon,
              size: 48,
              color: Colors.green,
            ),

            const SizedBox(height: 12),

            Text(
              title,

              textAlign: TextAlign.center,

              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
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
  State<MedicationPage> createState() =>
      _MedicationPageState();
}

class _MedicationPageState
    extends State<MedicationPage> {

  DateTime selectedDate = DateTime.now();

  bool firstTaken = false;
  bool secondTaken = false;
  bool thirdTaken = false;

  final List<double> medicationHistory = [
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    9,
    8,
    7,
    6,
    5,
    4,
  ];

  String toPersianNumber(String input) {
    const english = [
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9'
    ];

    const persian = [
      '۰',
      '۱',
      '۲',
      '۳',
      '۴',
      '۵',
      '۶',
      '۷',
      '۸',
      '۹'
    ];

    String result = input;

    for (int i = 0; i < english.length; i++) {
      result =
          result.replaceAll(english[i], persian[i]);
    }

    return result;
  }

  String getPersianDate(DateTime date) {

    final jalali =
        Jalali.fromDateTime(date);

    const weekdays = [
      'شنبه',
      'یکشنبه',
      'دوشنبه',
      'سه‌شنبه',
      'چهارشنبه',
      'پنجشنبه',
      'جمعه',
    ];

    const months = [
      '',
      'فروردین',
      'اردیبهشت',
      'خرداد',
      'تیر',
      'مرداد',
      'شهریور',
      'مهر',
      'آبان',
      'آذر',
      'دی',
      'بهمن',
      'اسفند',
    ];

    final weekday =
        weekdays[date.weekday % 7];

    final result =
        '$weekday - ${jalali.day} ${months[jalali.month]} ${jalali.year}';

    return toPersianNumber(result);
  }

  int get completedCount {

    int count = 0;

    if (firstTaken) count++;

    if (secondTaken) count++;

    if (thirdTaken) count++;

    return count;
  }

  void changeDay(int days) {

    setState(() {
      selectedDate =
          selectedDate.add(Duration(days: days));

      // فعلاً با تغییر روز،
      // وضعیت تیک‌ها جدا می‌شود
      firstTaken = false;
      secondTaken = false;
      thirdTaken = false;
    });
  }

  Widget medicationCard({
    required String title,
    required String time,
    required String amount,
    required bool taken,
    required ValueChanged<bool?> onChanged,
    required IconData icon,
  }) {

    return Card(
      margin: const EdgeInsets.only(bottom: 14),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Row(
          children: [

            Icon(
              icon,
              color: Colors.green,
              size: 38,
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    title,

                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text('⏰ ساعت: $time'),

                  Text('💧 مقدار: $amount'),
                ],
              ),
            ),

            Checkbox(
              value: taken,

              activeColor: Colors.green,

              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildChart() {

    const maxValue = 10.0;

    return Card(
      elevation: 2,

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            const Text(
              '📈 روند مقدار دارو',

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'افزایش تدریجی و سپس کاهش طبق برنامه',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 180,

              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.end,

                children: List.generate(
                  medicationHistory.length,

                  (index) {

                    final height =
                        (medicationHistory[index] /
                                maxValue) *
                            130;

                    return Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 2,
                        ),

                        child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment.end,

                          children: [

                            Text(
                              toPersianNumber(
                                medicationHistory[index]
                                    .toStringAsFixed(0),
                              ),

                              style: const TextStyle(
                                fontSize: 10,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Container(
                              height: height,

                              decoration: BoxDecoration(
                                color: Colors.green,

                                borderRadius:
                                    BorderRadius.circular(5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

              children: [

                Text('شروع سفر'),

                Text('اوج مصرف'),

                Text('کاهش تدریجی'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        backgroundColor:
            const Color(0xfff5f4ed),

        appBar: AppBar(
          backgroundColor: Colors.green,

          foregroundColor: Colors.white,

          centerTitle: true,

          title: const Text(
            '💊 برنامه دارویی',

            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [

              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.all(15),

                  child: Column(
                    children: [

                      const Text(
                        '📅 انتخاب تاریخ',

                        style: TextStyle(
                          fontSize: 19,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,

                        children: [

                          IconButton(
                            icon: const Icon(
                              Icons.arrow_forward,
                            ),

                            onPressed: () =>
                                changeDay(-1),
                          ),

                          Expanded(
                            child: Text(
                              getPersianDate(
                                selectedDate,
                              ),

                              textAlign:
                                  TextAlign.center,

                              style:
                                  const TextStyle(
                                fontSize: 17,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ),

                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                            ),

                            onPressed: () =>
                                changeDay(1),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      Text(
                        'تاریخ انتخاب‌شده به تقویم شمسی نمایش داده می‌شود',

                        textAlign:
                            TextAlign.center,

                        style: TextStyle(
                          color:
                              Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),

              buildChart(),

              const SizedBox(height: 20),

              Card(
                color: Colors.green.shade50,

                child: Padding(
                  padding:
                      const EdgeInsets.all(16),

                  child: Column(
                    children: [

                      const Text(
                        'وضعیت مصرف در تاریخ انتخاب‌شده',

                        style: TextStyle(
                          fontSize: 18,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        '$completedCount از ۳ نوبت ثبت شده',

                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 18),

              medicationCard(
                title: 'نوبت اول',

                time: '۸:۰۰ صبح',

                amount: 'طبق دستور راهنما',

                taken: firstTaken,

                icon: Icons.wb_sunny_outlined,

                onChanged: (value) {
                  setState(() {
                    firstTaken =
                        value ?? false;
                  });
                },
              ),

              medicationCard(
                title: 'نوبت دوم',

                time: '۱۴:۰۰',

                amount: 'طبق دستور راهنما',

                taken: secondTaken,

                icon:
                    Icons.light_mode_outlined,

                onChanged: (value) {
                  setState(() {
                    secondTaken =
                        value ?? false;
                  });
                },
              ),

              medicationCard(
                title: 'نوبت سوم',

                time: '۲۲:۰۰',

                amount: 'طبق دستور راهنما',

                taken: thirdTaken,

                icon:
                    Icons.nightlight_round,

                onChanged: (value) {
                  setState(() {
                    thirdTaken =
                        value ?? false;
                  });
                },
              ),

              const SizedBox(height: 10),

              const Text(
                '🔔 یادآوری مصرف دارو در مرحله بعد فعال می‌شود.',

                textAlign:
                    TextAlign.center,

                style: TextStyle(
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
