import '../models/horoscope_response.dart';
import '../services/api_service.dart';

class HoroscopeRepository {
  final ApiService _apiService = ApiService();

  Future<HoroscopeResponse?> fetchHoroscope({
    required String sign,
    required String category,
    String lang = 'en',
    String period = 'today',
  }) async {
    return await _apiService.getHoroscope(
      sign: sign,
      category: category,
      lang: lang,
      period: period,
    );
  }

  Map<String, String> get categories => ApiService.categoryMap;
}
