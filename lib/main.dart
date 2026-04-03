import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:share_plus/share_plus.dart';
import 'banner_ad_widget.dart';
import 'interstitial_ad_manager.dart';
import 'models/horoscope_response.dart';
import 'repositories/horoscope_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  RequestConfiguration configuration = RequestConfiguration(
    tagForChildDirectedTreatment: TagForChildDirectedTreatment.yes,
    tagForUnderAgeOfConsent: TagForUnderAgeOfConsent.yes,
    maxAdContentRating: MaxAdContentRating.g,
  );

  MobileAds.instance.updateRequestConfiguration(configuration);

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

    color: Color(0xFFFFC46B).withOpacity(.6),
    gradient: const LinearGradient(
      colors: [Color(0xFF1E1A18), Color(0xFF2B211D)],
    ),
    // border: Border.all(color: Colors.black, width: 1.2),
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
  String selectedLang = 'en';

  final List<Map<String, String>> zodiacList = [
    {"symbol": "assets/images/Aries.png", "title": "Aries"},
    {"symbol": "assets/images/Taurus.png", "title": "Taurus"},
    {"symbol": "assets/images/Gemini.png", "title": "Gemini"},
    {"symbol": "assets/images/Cancer.png", "title": "Cancer"},
    {"symbol": "assets/images/Leo.png", "title": "Leo"},
    {"symbol": "assets/images/Virgo.png", "title": "Virgo"},
    {"symbol": "assets/images/Libra.png", "title": "Libra"},
    {"symbol": "assets/images/Scorpio.png", "title": "Scorpio"},
    {"symbol": "assets/images/Sagi.png", "title": "Sagittarius"},
    {"symbol": "assets/images/Capricorn.png", "title": "Capricorn"},
    {"symbol": "assets/images/Aquarius.png", "title": "Aquarius"},
    {"symbol": "assets/images/Pisces.png", "title": "Pisces"},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // bottomNavigationBar: bottomNav(context),
        body: DarkBackground(
          child: SafeArea(
            child: SingleChildScrollView(
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
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _langButton("English", "en"),
                      const SizedBox(width: 15),
                      _langButton("Hindi", "hi"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    children: zodiacList.map((zodiac) {
                      final isSelected = selectedSign == zodiac["title"];
                      return FittedBox(
                        fit: BoxFit.scaleDown,
                        child: ZodiacIconCard(
                          symbol: zodiac["symbol"]!,
                          title: zodiac["title"]!,
                          isSelected: isSelected,
                          onTap: () {
                            setState(() {
                              selectedSign = zodiac["title"];
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: sponsoredAd(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      goldButton(
                        "Today's\nHoroscope",
                        onTap: () {
                          if (selectedSign == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Please select a zodiac sign first",
                                ),
                              ),
                            );
                            return;
                          }
                          interstitialAdManager.showAd(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CategoryScreen(
                                  sign: selectedSign!,
                                  lang: selectedLang,
                                  period: "today",
                                ),
                              ),
                            );
                          });
                        },
                      ),
                      goldButton(
                        "Monthly\nHoroscope",
                        onTap: () {
                          if (selectedSign == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Please select a zodiac sign first",
                                ),
                              ),
                            );
                            return;
                          }
                          interstitialAdManager.showAd(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CategoryScreen(
                                  sign: selectedSign!,
                                  lang: selectedLang,
                                  period: "monthly",
                                ),
                              ),
                            );
                          });
                        },
                      ),
                      goldButton(
                        "Yearly\nHoroscope",
                        onTap: () {
                          if (selectedSign == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Please select a zodiac sign first",
                                ),
                              ),
                            );
                            return;
                          }
                          interstitialAdManager.showAd(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CategoryScreen(
                                  sign: selectedSign!,
                                  lang: selectedLang,
                                  period: "yearly",
                                ),
                              ),
                            );
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _langButton(String label, String code) {
    bool isSelected = selectedLang == code;
    return InkWell(
      onTap: () {
        setState(() {
          selectedLang = code;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: isSelected
              ? const LinearGradient(
                  colors: [Color(0xFFFFD28D), Color(0xFFB8863B)],
                )
              : null,
          border: isSelected
              ? null
              : Border.all(color: const Color(0xFFFFC46B)),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black : const Color(0xFFFFC46B),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class CategoryScreen extends StatelessWidget {
  final String sign;
  final String lang;
  final String period;
  const CategoryScreen({
    super.key,
    required this.sign,
    required this.lang,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    final repository = HoroscopeRepository();
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: bottomNav(context, hideShare: true),
        body: DarkBackground(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  "Choose Category for $sign",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView(
                    children: repository.categories.entries.map((entry) {
                      IconData icon;
                      switch (entry.key) {
                        case 'love':
                          icon = Icons.favorite;
                          break;
                        case 'career':
                          icon = Icons.work;
                          break;
                        case 'health':
                          icon = Icons.health_and_safety;
                          break;
                        case 'lucky-number':
                          icon = Icons.numbers;
                          break;
                        case 'lucky-color':
                          icon = Icons.palette;
                          break;
                        case 'match':
                          icon = Icons.people;
                          break;
                        default:
                          icon = Icons.star;
                      }
                      return buildListTile(
                        icon,
                        entry.value,
                        entry.key,
                        sign,
                        lang,
                        period,
                        context,
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: sponsoredAd(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HoroscopeScreen extends StatefulWidget {
  final String sign;
  final String category;
  final String categoryName;
  final String lang;
  final String period;

  const HoroscopeScreen({
    super.key,
    required this.sign,
    required this.category,
    required this.categoryName,
    required this.lang,
    required this.period,
  });

  @override
  State<HoroscopeScreen> createState() => _HoroscopeScreenState();
}

class _HoroscopeScreenState extends State<HoroscopeScreen> {
  final HoroscopeRepository _repository = HoroscopeRepository();
  Future<HoroscopeResponse?>? _horoscopeFuture;

  @override
  void initState() {
    super.initState();
    _horoscopeFuture = _repository.fetchHoroscope(
      sign: widget.sign,
      category: widget.category,
      lang: widget.lang,
      period: widget.period,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // remove bottomNav from here, it's now inside the FutureBuilder list
        body: DarkBackground(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    widget.categoryName.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 18,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 30),
                  FutureBuilder<HoroscopeResponse?>(
                    future: _horoscopeFuture,
                    builder: (context, snapshot) {
                      HoroscopeResponse? data = snapshot.data;

                      return Column(
                        children: [
                          if (snapshot.connectionState ==
                              ConnectionState.waiting)
                            const Center(
                              child: Padding(
                                padding: EdgeInsets.all(40.0),
                                child: CircularProgressIndicator(
                                  color: Color(0xFFFFC46B),
                                ),
                              ),
                            )
                          else if (snapshot.hasError || data == null)
                            const Center(
                              child: Padding(
                                padding: EdgeInsets.all(40.0),
                                child: Text(
                                  "Error fetching horoscope content",
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ),
                            )
                          else
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              padding: const EdgeInsets.all(22),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                image: const DecorationImage(
                                  image: AssetImage("assets/images/shine.jpeg"),
                                  fit: BoxFit.cover,
                                ),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(
                                      0xFFFFC46B,
                                    ).withOpacity(.25),
                                    blurRadius: 18,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 40,
                                      bottom: 20.0,
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.1),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        "assets/images/${widget.sign}.png",
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    "Your sign is ${widget.sign}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "For period: ${widget.period}",
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.white70,
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  Text(
                                    data.text,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(height: 1.5),
                                  ),
                                ],
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.only(top: 45, bottom: 10),
                            child: sponsoredAd(),
                          ),
                          // Inject bottomNav here to pass the data
                          bottomNav(
                            context,
                            shareText: data != null
                                ? "My ${widget.categoryName} horoscope for ${widget.sign} (Today):\n\n${data.text}\n\nCheck yours on Astrology App!"
                                : null,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildListTile(
  IconData icon,
  String title,
  String categoryKey,
  String sign,
  String lang,
  String period,
  context,
) {
  return InkWell(
    onTap: () {
      interstitialAdManager.showAd(() {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HoroscopeScreen(
              sign: sign,
              category: categoryKey,
              categoryName: title,
              lang: lang,
              period: period,
            ),
          ),
        );
      });
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1E1A18), Color(0xFF2B211D)],
        ),
      ),
      // decoration: goldCard(),
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
  return const BannerAdWidget();
}

Widget goldButton(String text, {VoidCallback? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
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
    ),
  );
}

Widget bottomNav(context, {bool hideShare = false, String? shareText}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 14),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (!hideShare)
          InkWell(
            onTap: () {
              if (shareText != null) {
                Share.share(shareText);
              }
            },
            child: const Row(
              children: [
                Icon(Icons.share, color: Color(0xFFFFC46B)),
                SizedBox(width: 6),
                Text("Share"),
              ],
            ),
          ),
        InkWell(
          onTap: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          child: const Row(
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
          Container(
            height: 95,
            width: 95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF1E1A18), Color(0xFF2B211D)],
              ),
              // border: Border.all(
              //   color: isSelected ? Colors.white : const Color(0xFFFFC46B),
              //   width: 1.2,
              // ),
              boxShadow: [
                BoxShadow(
                  color: isSelected
                      ? Colors.white
                      : const Color(0xFFFFC46B).withOpacity(.25),
                  blurRadius: 20,
                  spreadRadius: 1,
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
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFFFFD28D), Color(0xFFB8863B)],
                  ).createShader(bounds),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFFFFC46B),
                        width: 1.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset(symbol, height: 95, width: 95),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 14),
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
