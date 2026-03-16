// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// void main() {
//   runApp(const AstrologyApp());
// }

// class AstrologyApp extends StatelessWidget {
//   const AstrologyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         brightness: Brightness.dark,
//         scaffoldBackgroundColor: const Color(0xFF0F0F14),
//         textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
//       ),
//       home: const ZodiacScreen(),
//     );
//   }
// }

// /// ---------------------------
// /// 1️⃣ ZODIAC SCREEN
// /// ---------------------------
// class ZodiacScreen extends StatelessWidget {
//   const ZodiacScreen({super.key});

//   final List<Map<String, String>> zodiacList = const [
//     {"name": "Aries", "symbol": "assets/images/Aries.png"},
//     {"name": "Taurus", "symbol": "assets/images/Taurus.png"},
//     {"name": "Gemini", "symbol": "assets/images/Geminis.png"},
//     {"name": "Cancer", "symbol": "assets/images/Cancer.png"},
//     {"name": "Leo", "symbol": "assets/images/Leo.png"},
//     {"name": "Virgo", "symbol": "assets/images/Virgo.png"},
//     {"name": "Libra", "symbol": "assets/images/Libra.png"},
//     {"name": "Scorpio", "symbol": "assets/images/Scorpio.png"},
//     {"name": "Sagittarius", "symbol": "assets/images/Sagi.png"},
//     {"name": "Capricorn", "symbol": "assets/images/Capricorn.png"},
//     {"name": "Aquarius", "symbol": "assets/images/Aquarius.png"},
//     {"name": "Pisces", "symbol": "assets/images/Pisces.png"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Select Your Zodiac"),
//           backgroundColor: Colors.transparent,
//         ),
//         bottomNavigationBar: bottomNav(),
//         body: Column(
//           children: [
//             Flexible(
//               child: GridView.builder(
//                 shrinkWrap: true,
//                 padding: const EdgeInsets.all(16),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 4,
//                   mainAxisSpacing: 10,
//                   crossAxisSpacing: 10,
//                   childAspectRatio: 0.9,
//                 ),
//                 itemCount: zodiacList.length,
//                 itemBuilder: (context, index) {
//                   final zodiac = zodiacList[index];
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => CategoryScreen(sign: zodiac["name"]!),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       decoration: goldCardDecoration(),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(4.0),
//                             child: Image.asset(zodiac["symbol"]!),
//                           ),
//                           // const SizedBox(height: 4),
//                           // Text(zodiac["name"]!),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   HoroscopeButton(title: "Today's\nHoroscope", onTap: () {}),
//                   HoroscopeButton(title: "Weekly\nHoroscope", onTap: () {}),
//                   HoroscopeButton(title: "Monthly\nHoroscope", onTap: () {}),
//                 ],
//               ),
//             ),
//             adBanner(),
//             // bottomNav(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HoroscopeButton extends StatelessWidget {
//   final String title;
//   final VoidCallback onTap;
//   const HoroscopeButton({super.key, required this.title, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           image: DecorationImage(
//             image: AssetImage("assets/images/starBG.jpeg"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.only(
//             top: 8.0,
//             bottom: 8.0,
//             left: 8.0,
//             right: 8.0,
//           ),
//           child: Text(
//             title,
//             textAlign: TextAlign.center,
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// ---------------------------
// /// 2️⃣ CATEGORY SCREEN
// /// ---------------------------
// class CategoryScreen extends StatelessWidget {
//   final String sign;
//   const CategoryScreen({super.key, required this.sign});

//   final List<Map<String, dynamic>> categories = const [
//     {"title": "Love", "icon": Icons.favorite},
//     {"title": "Relationship", "icon": Icons.people},
//     {"title": "Career", "icon": Icons.work},
//     {"title": "Lucky Color", "icon": Icons.palette},
//     {"title": "Lucky Number", "icon": Icons.numbers},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(sign), backgroundColor: Colors.transparent),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               padding: const EdgeInsets.all(16),
//               itemCount: categories.length,
//               itemBuilder: (context, index) {
//                 final item = categories[index];

//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => HoroscopeScreen(sign: sign),
//                       ),
//                     );
//                   },
//                   child: Container(
//                     margin: const EdgeInsets.only(bottom: 16),
//                     padding: const EdgeInsets.all(18),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       image: DecorationImage(
//                         image: AssetImage("assets/images/6.jpeg"),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(item["icon"], color: Colors.white),
//                         const SizedBox(width: 16),
//                         Text(
//                           item["title"],
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Spacer(),
//                         const Icon(Icons.arrow_forward_ios, size: 16),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),

//           adBanner(),
//         ],
//       ),
//     );
//   }
// }

// /// ---------------------------
// /// 3️⃣ HOROSCOPE SCREEN
// /// ---------------------------
// class HoroscopeScreen extends StatelessWidget {
//   final String sign;
//   const HoroscopeScreen({super.key, required this.sign});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("ASTROLOGY NOW"),
//         backgroundColor: Colors.transparent,
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 20),
//           Container(
//             margin: const EdgeInsets.all(16),
//             padding: const EdgeInsets.all(24),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               image: DecorationImage(
//                 image: AssetImage("assets/images/2.jpeg"),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Column(
//               children: [
//                 Container(
//                   decoration: goldCardDecoration(),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(4.0),
//                         child: Image.asset(
//                           'assets/images/Aries.png',
//                           height: 100,
//                           width: 100,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 Text(
//                   "Your sign is $sign",
//                   style: const TextStyle(fontSize: 20),
//                 ),
//                 const SizedBox(height: 12),
//                 const Text(
//                   "Today brings fresh energy and opportunities. "
//                   "Trust your instincts but plan before taking action.",
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//           const Spacer(),
//           adBanner(),
//           // bottomNav(),
//         ],
//       ),
//     );
//   }
// }

// /// ---------------------------
// /// Reusable Gold Card Decoration
// /// ---------------------------
// BoxDecoration goldCardDecoration() {
//   return BoxDecoration(
//     borderRadius: BorderRadius.circular(8),
//     gradient: const LinearGradient(
//       colors: [
//         Color.fromARGB(255, 99, 99, 176),
//         Color.fromARGB(255, 100, 100, 134),
//       ],
//       begin: Alignment.topLeft,
//       end: Alignment.bottomRight,
//     ),
//     // border: Border.all(color: Colors.amber.withOpacity(0.4)),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.amber.withOpacity(0.2),
//         blurRadius: 12,
//         spreadRadius: 1,
//       ),
//     ],
//   );
// }

// /// ---------------------------
// /// Fake Ad Banner
// /// ---------------------------
// Widget adBanner() {
//   return Container(
//     margin: const EdgeInsets.all(16),
//     padding: const EdgeInsets.all(16),
//     decoration: goldCardDecoration(),
//     child: Row(
//       children: const [
//         Icon(Icons.ads_click, color: Colors.amber),
//         SizedBox(width: 12),
//         Expanded(child: Text("Your Ad Here")),
//         Text("Open", style: TextStyle(color: Colors.amber)),
//       ],
//     ),
//   );
// }

// /// ---------------------------
// /// Bottom Navigation
// /// ---------------------------
// Widget bottomNav() {
//   return Container(
//     padding: const EdgeInsets.symmetric(vertical: 12),
//     decoration: const BoxDecoration(
//       border: Border(top: BorderSide(color: Colors.white12)),
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: const [
//         Row(
//           children: [
//             Icon(Icons.share, color: Colors.amber),
//             SizedBox(width: 6),
//             Text("Share"),
//           ],
//         ),
//         Row(
//           children: [
//             Icon(Icons.home, color: Colors.amber),
//             SizedBox(width: 6),
//             Text("Home"),
//           ],
//         ),
//       ],
//     ),
//   );
// }

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const AstrologyApp());
}

class AstrologyApp extends StatelessWidget {
  const AstrologyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark(),
      home: ZodiacScreen(),
    );
  }
}

class DarkBackground extends StatelessWidget {
  final Widget child;
  const DarkBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topCenter,
          radius: 1.2,
          colors: [Color(0xFF2B1E1A), Color(0xFF120D0B), Color(0xFF0B0B0F)],
        ),
      ),
      child: child,
    );
  }
}

BoxDecoration goldCard() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(22),

    // color: Color(0xFFFFC46B).withOpacity(.6),
    // gradient: const LinearGradient(
    //   colors: [Color(0xFF1E1A18), Color(0xFF2B211D)],
    // ),
    border: Border.all(color: Colors.black, width: 1.2),
    boxShadow: [
      BoxShadow(
        color: Color(0xFFFFC46B).withOpacity(.25),
        blurRadius: 18,
        spreadRadius: 1,
      ),
    ],
  );
}

class ZodiacScreen extends StatefulWidget {
  const ZodiacScreen({super.key});

  @override
  State<ZodiacScreen> createState() => _ZodiacScreenState();
}

class _ZodiacScreenState extends State<ZodiacScreen> {
  String? selectedSign;

  final List<Map<String, String>> zodiacList = [
    {"symbol": "♈", "title": "Aries"},
    {"symbol": "♉", "title": "Taurus"},
    {"symbol": "♊", "title": "Gemini"},
    {"symbol": "♋", "title": "Cancer"},
    {"symbol": "♌", "title": "Leo"},
    {"symbol": "♍", "title": "Virgo"},
    {"symbol": "♎", "title": "Libra"},
    {"symbol": "♏", "title": "Scorpio"},
    {"symbol": "♐", "title": "Sagittarius"},
    {"symbol": "♑", "title": "Capricorn"},
    {"symbol": "♒", "title": "Aquarius"},
    {"symbol": "♓", "title": "Pisces"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DarkBackground(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                "Select Your Zodiac",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: zodiacList.map((zodiac) {
                    final isSelected = selectedSign == zodiac["title"];
                    return ZodiacIconCard(
                      symbol: zodiac["symbol"]!,
                      title: zodiac["title"]!,
                      isSelected: isSelected,
                      onTap: () {
                        setState(() {
                          selectedSign = zodiac["title"];
                        });
                        // Navigate after a brief highlight delay to show selection
                        Future.delayed(const Duration(milliseconds: 400), () {
                          if (mounted) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const CategoryScreen(),
                              ),
                            );
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),

              sponsoredAd(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  goldButton("Today's\nHoroscope"),
                  goldButton("Monthly\nHoroscope"),
                  goldButton("Yearly\nHoroscope"),
                ],
              ),
              bottomNav(context),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DarkBackground(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              buildListTile(Icons.favorite, "Love", context),
              buildListTile(Icons.people, "Relationship", context),
              buildListTile(Icons.work, "Career", context),
              buildListTile(Icons.palette, "Lucky Color", context),
              buildListTile(Icons.numbers, "Lucky Number", context),
              const Spacer(),
              sponsoredAd(),
              goldButton("Google Ads"),
              bottomNav(context),
            ],
          ),
        ),
      ),
    );
  }
}

class HoroscopeScreen extends StatelessWidget {
  const HoroscopeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DarkBackground(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                "ASTROLOGY NOW",
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(22),
                decoration: goldCard(),
                child: Column(
                  children: const [
                    Text(
                      "♈",
                      style: TextStyle(fontSize: 42, color: Color(0xFFFFC46B)),
                    ),
                    SizedBox(height: 12),
                    Text("Your sign is Aries", style: TextStyle(fontSize: 18)),
                    SizedBox(height: 6),
                    Text(
                      "For period: Today",
                      style: TextStyle(fontSize: 13, color: Colors.white70),
                    ),
                    SizedBox(height: 14),
                    Text(
                      "Today brings fresh energy for Aries, making it a great time to act and move forward confidently.",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              sponsoredAd(),
              goldButton("Google Ads"),
              bottomNav(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildListTile(IconData icon, String title, context) {
  return InkWell(
    onTap: () {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => HoroscopeScreen()));
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(18),
      decoration: goldCard(),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFFFC46B)),
          const SizedBox(width: 16),
          Text(title),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 14),
        ],
      ),
    ),
  );
}

Widget sponsoredAd() {
  return Container(
    margin: const EdgeInsets.all(20),
    padding: const EdgeInsets.all(14),
    decoration: goldCard(),
    child: const Row(
      children: [
        Text("Ad", style: TextStyle(color: Color(0xFFFFC46B))),
        SizedBox(width: 12),
        Expanded(child: Text("Your Ad Here")),
        Text("Open", style: TextStyle(color: Color(0xFFFFC46B))),
      ],
    ),
  );
}

Widget goldButton(String text) {
  return Container(
    // margin: const EdgeInsets.symmetric(horizontal: 20),
    // padding: const EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      gradient: const LinearGradient(
        colors: [Color(0xFFFFD28D), Color(0xFFB8863B)],
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Text(
        text,
        overflow: TextOverflow.clip,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

Widget bottomNav(context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 14),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Icon(Icons.share, color: Color(0xFFFFC46B)),
            SizedBox(width: 6),
            Text("Share"),
          ],
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          child: Row(
            children: [
              Icon(Icons.home, color: Color(0xFFFFC46B)),
              SizedBox(width: 6),
              Text("Home"),
            ],
          ),
        ),
      ],
    ),
  );
}

class ZodiacIconCard extends StatelessWidget {
  final String symbol;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const ZodiacIconCard({
    super.key,
    required this.symbol,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 95,
            width: 95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isSelected
                    ? [const Color(0xFFFFD28D), const Color(0xFFB8863B)]
                    : [const Color(0xFF1E1A18), const Color(0xFF2B211D)],
              ),
              border: Border.all(
                color: isSelected ? Colors.white : const Color(0xFFFFC46B),
                width: isSelected ? 3.0 : 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: isSelected
                      ? const Color(0xFFFFC46B).withOpacity(.6)
                      : const Color(0xFFFFC46B).withOpacity(.25),
                  blurRadius: isSelected ? 25 : 20,
                  spreadRadius: isSelected ? 4 : 1,
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                /// ⭐ Star Dust Background
                const Positioned.fill(child: StarDust()),

                /// Zodiac Symbol
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: isSelected
                        ? [Colors.black, Colors.black87]
                        : [const Color(0xFFFFD28D), const Color(0xFFB8863B)],
                  ).createShader(bounds),
                  child: Text(
                    symbol,
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? const Color(0xFFFFC46B) : Colors.white,
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class StarDust extends StatelessWidget {
  const StarDust({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: StarPainter());
  }
}

class StarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.amber.withOpacity(0.3);

    final random = Random(2);

    for (int i = 0; i < 20; i++) {
      final dx = random.nextDouble() * size.width;
      final dy = random.nextDouble() * size.height;
      canvas.drawCircle(Offset(dx, dy), 1.2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
