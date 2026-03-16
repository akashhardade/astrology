class HoroscopeResponse {
  final bool ok;
  final String sign;
  final String category;
  final String text;

  HoroscopeResponse({
    required this.ok,
    required this.sign,
    required this.category,
    required this.text,
  });

  factory HoroscopeResponse.fromJson(Map<String, dynamic> json) {
    return HoroscopeResponse(
      ok: json['ok'] ?? false,
      sign: json['sign'] ?? '',
      category: json['category'] ?? '',
      text: json['text'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'ok': ok, 'sign': sign, 'category': category, 'text': text};
  }
}
