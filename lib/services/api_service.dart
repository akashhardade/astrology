import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import '../models/horoscope_response.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://astro.arasko.co.in/api/v1',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  static const Map<String, String> categoryMap = {
    'love': 'Love And Relationship',
    'career': 'Career',
    'health': 'Health',
    'lucky-number': 'Lucky Number',
    'lucky-color': 'Lucky Color',
    'match': "Today's Best Match",
  };

  Future<HoroscopeResponse?> getHoroscope({
    required String sign,
    required String category,
    String lang = 'en',
    String period = 'today',
  }) async {
    try {
      log("""
          'sign': $sign,
          'category': $category,
          'lang': $lang,
          'period': $period,
        """);
      final response = await _dio.get(
        '/horoscope',
        queryParameters: {
          'sign': sign,
          'category': category,
          'lang': lang,
          'period': period,
        },
      );

      if (response.statusCode == 200) {
        log("response ${response.data.toString()}");
        return HoroscopeResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      debugPrint('Dio error: ${e.message}');
      return null;
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }

  String getCategoryName(String key) {
    return categoryMap[key] ?? key;
  }
}
